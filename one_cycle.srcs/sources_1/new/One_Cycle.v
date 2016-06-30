`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 17:36:35
// Design Name: 
// Module Name: One_Cycle
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module One_Cycle(
        input clk,
        input reset,
        input [2:0] digit_control,
        output SyscallDisplay,
        output ClkEn,
        output RF_D2,
        output DigitEn, //choose which digit shine
        output DigitOut
    );
    //Clock Divider
    reg CLK;
    wire ClkCycle;
    parameter Cycle = 781250;
    ClkDiv #(Cycle) SysClk(
        .clk(clk),
        .reset(reset),
        .ClkOutput(ClkCycle)
    );
    
    //PC 
    wire [15:0] NextPC;
    wire [15:0] PC0;
    wire [15:0] PCOut;
    PC pc(
        .NextPC(NextPC),
        .reset(reset),
        .clk(clk),
        .Out(PCOut)
    );
    assign PC0 = PCOut + 1;
    
    //ROM
    wire [15:0] rom_addr;
    wire [31:0] rom_data;
    IM im(
        .addr(rom_addr),
        .data(rom_data)
    );
    assign rom_addr = PCOut;
    
    //Splitter
    wire [31:0] Instruction;
    wire [5:0] op0_5;
    wire [5:0] op26_31;
    wire [4:0] rt;
    wire [4:0] rs;
    wire [4:0] rd;
    wire [25:0] addr;
    wire [15:0] imm;
    Instr_Splitter split(
        .instr(Instruction),
        .op0_5(op0_5),
        .op26_31(op26_31),
        .rt(rt),
        .rs(rs),
        .rd(rd),
        .addr(addr),
        .imm(imm)
    );
   assign Instruction = rom_data; 
   
   //Sign Extend 16->32 PC address BNE/BEQ
   wire [15:0] SignExtendIn;
   wire [31:0] SignExtendOut;
   SignExtender sign_ext(
        .in(SignExtendIn),
        .out(SignExtendOut)
   );
   assign SignExtendIn = imm;
   //assign PC1 = PC0 + SignExtendOut;
   
   //Zero-Extender-16bit
   wire [15:0] ZeroExt16_in;
   wire [31:0] ZeroExt16_out;
   ZeroExt16_32 zeroext16(
        .in(ZeroExt16_in),
        .out(ZeroExt16_out)
   );
   assign ZeroExt16_in = imm;
   
   //Zero-Extender-5bit
   wire [4:0] ZeroExt5_in;
   wire [31:0] ZeroExt5_out;
   ZeroExtender zeroext5(
        .in(ZeroExt5_in),
        .out(ZeroExt5_out)
   );
   assign ZeroExt5_in = Instruction[10:6];
   
   //ALU
   wire [31:0] ALU_in_X;
   wire [31:0] ALU_in_Y;
   wire [3:0] ALU_in_S;
   wire ALU_out_OF; //signed overflow
   wire ALU_out_CF; //unsigned overflow
   wire [31:0] ALU_out_R;
   wire [31:0] ALU_out_R2;
   wire ALU_out_equal;
   ALU_bobo alu(
        .X(ALU_in_X),
        .Y(ALU_in_Y),
        .S(ALU_in_S),
        .OF(ALU_out_OF), //signed overflow
        .CF(ALU_out_CF), //unsigned overflow
        .R(ALU_out_R),
        .R2(ALU_out_R2),
        .equal(ALU_out_equal)
   );
   
   //Controller -> generate signal
   wire [31:0] Control_ins;
   wire [23:0] Control_sig;
   ControlUnit controller(
        .instr(Control_ins),
        .Signal(Control_sig)
   );
   assign Control_ins = rom_data;
   
   //Registers
    wire [4:0] Regs_R1_No;
    wire [4:0] Regs_R2_No;
    wire [4:0] Regs_W_No;
    wire [31:0] Regs_Din;
    wire Regs_we;
    wire [31:0] Regs_out_R1;
    wire [31:0] Regs_out_R2;
    Regfile regs(
        .R1_No(Regs_R1_No),
        .R2_No(Regs_R2_No),
        .W_No(Regs_W_No),
        .Din(Regs_Din),
        .clk(CLK),
        .we(Regs_we),
        .reset(reset),
        .R1(Regs_out_R1),
        .R2(Regs_out_R2)
    );
    
    //RAM 
    wire [15:0] DM_in_addr;
    wire DM_in_we;
    wire [31:0] DM_DataIn;
    wire [31:0] DM_DataOut; 
    DM dm(
        .addr(DM_in_addr),
        .clk(CLK),
        .we(DM_in_we),
        .DataInput(DM_DataIn),
        .DataOut(DM_DataOut) 
    );
   assign DM_in_addr = ALU_out_R;
   assign DM_DataIn = Regs_out_R2;
   
   //Cycle Counter
   reg [31:0] Cycle_count;
   always@(posedge CLK or negedge reset)
   begin
        if(~reset)
        begin
            Cycle_count <= 0;
        end
        else
        begin
           Cycle_count <= Cycle_count + 1; 
        end
   end
   
   
   /*MUX choose the proper $a0
   
   MUX1_2_5bit mux1_3_5bit(
        .in0(rt),
        .in1(5'd4),
        .sel(Control_sig[15]),
        .res()
   );*/
   
   //Digits
   
   wire Digits_Clk;
   parameter digit_clk_div = 1 << 16;
   ClkDiv #(digit_clk_div) DigitClk(
           .clk(clk),
           .reset(reset),
           .ClkOutput(Digits_Clk)
       );
   
   reg [31:0] Display_data;
   wire display;
   wire [31:0] Digits_In;  
   MUX3_8 DigitSrc(
        .in0(Display_data),
        .in1(PCOut),
        .in2(Cycle_count),
        .in3(DM_DataOut),
        .in4(rom_data),
        .in5(Regs_out_R1),
        .in6(0),
        .in7(0),
        .sel(digit_control),
        .out(Digits_In)
   );
   
   Display_Digit digit(
        .in0(Digits_In[3:0]),
        .in1(Digits_In[7:4]),
        .in2(Digits_In[11:8]),
        .in3(Digits_In[15:12]),
        .in4(Digits_In[19:16]),
        .in5(Digits_In[23:20]),
        .in6(Digits_In[27:24]),
        .in7(Digits_In[31:28]),
        .rst(reset),
        .clk(Digits_Clk),
        .digiten(DigitEn),
        .digitsout(DigitOut)
   );
   
   //Control_sig[19] is ClkEn signal.
   wire SyscallDisplay = ALU_out_equal & Control_sig[19];
   assign display = ((~SyscallDisplay) & Control_sig[19]);
   
   always@(posedge CLK or negedge reset) 
   begin
        if(~reset)
        begin
            Display_data <= 0;
        end
        else if (display)
            begin
               Display_data <=  Regs_out_R2;
            end    
   end
   
   //MUX ext choose
   wire [1:0] EXT;
   wire [31:0] ExtResult;
   assign EXT = Control_sig[17:16];
   MUX2_4 ext_choose(
        .in0(32'h0000_0000),
        .in1(SignExtendOut),
        .in2(ZeroExt16_out),
        .in3(ZeroExt5_out),
        .sel(EXT),
        .res(ExtResult)
   );
   
   // split some signal bne beq
    wire bne, beq, bne_beq;
    assign bne = Control_sig[21];
    assign beq = Control_sig[20];
    assign bne_beq = (beq & ALU_out_equal) | (~((~bne) | ALU_out_equal));
    
    wire [31:0] b_equal_1 ;
    assign b_equal_1 = ExtResult + PC0;
    wire [31:0] b_equal_res;
    MUX1_2_32bit mux1_2(
        .in0(PC0),
        .in1(b_equal_1),
        .sel(bne_beq),
        .res(b_equal_res)
    );
    
    // jump
    wire [31:0] jump_res;
    assign jump_res[25:0] = addr;
    assign jump_res[31:26] = 6'b00_0000;
   
   //choose PC MUX
   wire [1:0] Branch;
   wire [31:0] PC_next;
   assign Branch = Control_sig[4:3];
   MUX2_4 pc_choose(
      .in0(PC0),
      .in1(b_equal_res),
      .in2(jump_res),
      .in3(Regs_out_R1),
      .sel(Branch),
      .res(PC_next)
   );
   assign NextPC = PC_next[15:0];
   
endmodule
