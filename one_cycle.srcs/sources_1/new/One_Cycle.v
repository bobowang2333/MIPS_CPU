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
        /*
        input [2:0] digit_control,
        input [7:0] dm_in_addr,
        output SyscallDisplay,
        output CLK,
        output Digits_Clk,
        //output RF_D2,
        output [7:0] DigitEn, //choose which digit shine
        output [7:0] DigitOut,
        output [31:0] Cycle_count,
        output test,
       
        output CLK_OUT_LED,
        output clk_OUT_LED*/
         output ClkCycle
        //output SyscallDisplay
    );
    
    //Clock Divider
    reg CLK;
    //wire ClkCycle;
   // parameter Cycle = 781250;
   //parameter Sys_clk_div = 1 << 20;
   parameter Sys_clk_div = 4;
    ClkDiv #(Sys_clk_div) SysClk(
        .clk(clk),
        .reset(reset),
        .ClkOutput(ClkCycle)
    );
    /*
    /*
    //----IF----------------------
    //PC 
    wire [15:0] NextPC;
    wire [15:0] PC0;
    wire [15:0] PCOut;
    PC pc(
        .NextPC(NextPC),
        .reset(reset),
        .clk(CLK),
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
    
    //------IF/ID-------
    wire [15:0] ifid_PC0;  // address of next instruction
    wire [31:0] ifid_instr;  // contents of instruction
    wire [15:0] ifid_PCNow;
    IF_ID  ifid(
            .PC0_in(PC0), // PC0 = PCOut + 1;
            .rom_data_in(rom_data),
            .PC_now_in(PCOut),
            .clk(CLK),
            .reset(reset),
            .PC0_out(ifid_PC0),
            .rom_data_out(ifid_instr),
            .PC_now_out(ifid_PCNow)
        );
      
   //-------ID ---------------  
    wire [31:0] b_equal_res;
    //Splitter

    wire [5:0] op0_5;
    wire [5:0] op26_31;
    wire [4:0] rt;
    wire [4:0] rs;
    wire [4:0] rd;
    wire [25:0] addr;
    wire [15:0] imm;
    Instr_Splitter split(
        .instr(ifid_instr),
        .op0_5(op0_5),
        .op26_31(op26_31),
        .rt(rt),
        .rs(rs),
        .rd(rd),
        .addr(addr),
        .imm(imm)
    );
    
    // jump
    wire [31:0] jump_res;
    assign jump_res[25:0] = addr;
    assign jump_res[31:26] = 6'b00_0000;
      
   
   //Sign Extend 16->32 PC address BNE/BEQ
   wire [31:0] SignExtendOut;
   SignExtender sign_ext(
        .in(imm),
        .out(SignExtendOut)
   );

   //assign PC1 = PC0 + SignExtendOut;
   
   //Zero-Extender-16bit
   wire [31:0] ZeroExt16_out;
   ZeroExt16_32 zeroext16(
        .in(imm),
        .out(ZeroExt16_out)
   );
  
   
   //Zero-Extender-5bit

   wire [31:0] ZeroExt5_out;
   ZeroExtender zeroext5(
        .in(rd),
        .out(ZeroExt5_out)
   );

    //Controller -> generate signal
    
   wire [23:0] Control_sig;
   //wire [31:0] Control_32_sig;
   ControlUnit controller(
        .instr(ifid_instr),
        .Signal(Control_sig)
   );
  
   //assign Control_32_sig = {8'd0, Control_sig};
   
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
    assign  Regs_we = ~Control_sig[18];
   
    //choose RF R1 MUX
      wire [1:0] RF_R1;
      assign RF_R1 = Control_sig[14:13];
      MUX2_4_5bit rf_r1_choose(
           .in0(rs),
           .in1(5'd2),
           .in2(5'd0),
           .in3(rt),
           .sel(RF_R1),
           .res(Regs_R1_No)
      );
      
    //choose RF R2 MUX
      wire RF_R2;
      assign RF_R2 = Control_sig[15];
      MUX1_2_5bit rf_r2_choose(
           .in0(rt),
           .in1(5'd4),
           .sel(RF_R2),
            .res(Regs_R2_No)
         );     
         
   //-----------------ID/EX------------------------
   wire [31:0] IDex_R1_out;
   wire [31:0] IDex_R2_out;
   wire [31:0] IDex_sign16_32ext_out;
   wire [31:0] IDex_zero16_32ext_out;
   wire [31:0] IDex_zero5_32ext_out;
   wire [15:0] IDex_PC0_out_out;
   wire [15:0] IDex_PC_Now;
   wire [31:0] IDex_instr_out;
   wire [31:0] IDex_control_out;
   wire [31:0] IDex_jump;
   ID_EX idex(
           .RF_R1_in(Regs_out_R1),
           .RF_R2_in(Regs_out_R2),
           .sign16_32ext_in(SignExtendOut),
           .zero16_32ext_in(ZeroExt16_out),
           .zero5_32ext_in(ZeroExt5_out),
           .PC0_in_in(ifid_PC0),
           .PC_Now_in(ifid_PCNow),
           .instr_in(ifid_instr),
           .control_in(Control_sig),
           .JumpAddressIn(jump_res),
           .clk(CLK),
           .rst(reset),
           .RF_R1_out(IDex_R1_out),
           .RF_R2_out(IDex_R2_out),
           .sign16_32ext_out(IDex_sign16_32ext_out),
           .zero16_32ext_out(IDex_zero16_32ext_out),
           .zero5_32ext_out(IDex_zero5_32ext_out),
           .PC0_out_out(IDex_PC0_out_out),  // next PC
           .PC_Now_out(IDex_PC_Now),  // Current PC
           .instr_out(IDex_instr_out),
           .control_out(IDex_control_out),
           .JumpAddressOut(IDex_jump)
       );
       
   //--------------------EX-----------------------------
   
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
  assign ALU_in_S = IDex_control_out[8:5];
  //wire [31:0] ALU_32_equal;
  //assign ALU_32_equal = {31'd0, ALU_out_equal};
   
   //choose ALU D1
     wire [31:0] PC_32;
     wire [1:0] ALU_D1;
     assign ALU_D1 = IDex_control_out[10:9];
     assign PC_32[15:0] = IDex_PC_Now;
     assign PC_32[31:16] = 16'h0000_0000;
     
     MUX2_4 ALU_D1_choose(
          .in0(IDex_R1_out),
          .in1(IDex_R1_out),
          .in2(PC_32),
          .in3(IDex_R1_out),
          .sel(ALU_D1),
          .res(ALU_in_X)
     );
     
     //choose ALU D2
     wire [1:0] ALU_D2;
     assign ALU_D2 = IDex_control_out[12:11];
     MUX2_4 ALU_D2_choose(
            .in0(IDex_R2_out),
            .in1(ExtResult),
            .in2(32'd1),
            .in3(32'd10),
            .sel(ALU_D2),
            .res(ALU_in_Y)
       );  

   //MUX ext choose
   wire [1:0] EXT;
   wire [31:0] ExtResult;
   assign EXT = IDex_control_out[17:16];
   MUX2_4 ext_choose(
        .in0(32'h0000_0000),
        .in1(IDex_sign16_32ext_out),
        .in2(IDex_zero16_32ext_out),
        .in3(IDex_zero5_32ext_out),
        .sel(EXT),
        .res(ExtResult)
   );
    
    
   // split some signal bne beq
    wire bne, beq, bne_beq;
    assign bne = IDex_control_out[21];
    assign beq = CIDex_control_out[20];
    assign bne_beq = (beq & ALU_out_equal) | (~((~bne) | ALU_out_equal));
    
    wire [31:0] b_equal_1 ;
    assign b_equal_1 = ExtResult + IDex_PC0_out_out;
    //wire [31:0] b_equal_res;  which has declared on ID level
    MUX1_2_32bit mux1_2(
        .in0(IDex_PC0_out_out),
        .in1(b_equal_1),
        .sel(bne_beq),
        .res(b_equal_res)
    );
    
        


    //---------------------------EX/EM----------------------
    wire [31:0] Exem_alu_out_R;
    wire [31:0] Exem_alu_out_R2;
    wire Exem_alu_equal; 
    wire [31:0] Exem_instr;
    wire [31:0] Exem_ctrl_out;
    wire [31:0] Exem_beq_equal;
    wire [15:0] Exem_PC0;
    wire [31:0] Exem_jump;
    wire [31:0] Exem_RFR2;
    wire [31:0] Exem_RFR1;
    EX_MEM(
            .ALU_R_in(ALU_out_R),
            .ALU_R2_in(ALU_out_R2),
            .ALU_equal_in(ALU_out_equal),
            .instr_in(IDex_instr_out),
            .ctrl_in(IDex_control_out),
            .b_equal_res_in(b_equal_res), //PC
            .PC0_in(IDex_PC0_out_out),
            .jump_res_in(IDex_jump),
            .RF_R2_in(IDex_R2_out),
            .RF_R1_in(IDex_R1_out),
            .clk(CLK),
            .rst(reset),
            .ALU_R_out(Exem_alu_out_R),
            .ALU_R2_out(Exem_alu_out_R2),
            .ALU_equal_out(Exem_alu_equal),
            .instr_out(Exem_instr),
            .ctrl_out(Exem_ctrl_out),
            .b_equal_res_out(Exem_beq_equal),
            .PC0_out(Exem_PC0),
            .jump_res_out(Exem_jump),
            .RF_R2_out(Exem_RFR2),
            .RF_R1_out(Exem_RFR1)
                );
                
    //-----------------------MEM-------------------------
    
                
    //RAM 
    wire DM_in_we;
    wire [31:0] DM_DataOut; 
    wire [31:0] DM_DataOut1;
    DM dm(
        .addr(Exem_alu_out_R),
        .addr1({8'd0, dm_in_addr}),
        .clk(CLK),
        .we(DM_in_we),
        .DataInput(Exem_RFR2),
        .DataOut(DM_DataOut),
        .DataOut1(DM_DataOut1)
    );
  
   assign DM_in_we = Exem_ctrl_out[2];
   
         //choose PC MUX
     wire [1:0] Branch;
     wire [31:0] PC_next;
    assign Branch = Exem_ctrl_out[4:3];
    MUX2_4 pc_choose(
        .in0(Exem_PC0),
        .in1(Exem_beq_equal),
        .in2(Exem_jump),
        .in3(xem_RFR1),
        .sel(Branch),
        .res(PC_next)
    );
    assign NextPC = PC_next[15:0];  
   
   //------------------MEM/WB----------------
   wire [31:0] Memwb_alu_r;
   wire  Memwb_alu_equal;
   wire [31:0] Memwb_dm_data;
   wire [31:0] Memwb_instr;
   wire [31:0] Memwb_ctrl;
   wire [15:0] Memwb_PC0;
   wire [31:0] Memwb_RFR1;
   wire [31:0] Memwb_RFR2;
    MEM_WB  Memwb(
           .ALU_R_in(Exem_alu_out_R),
           .ALU_equal_in(Exem_alu_equal),
           .DM_data_in(DM_DataOut),
           .instr_in(Exem_instr),
           .ctrl_in(Exem_ctrl_out),
           .PC0_in(Exem_PC0),
           .RF_R1_in(Exem_RFR1),
           .RF_R2_in(Exem_RFR2),
           .clk(CLK),
           .rst(reset),
           .ALU_R_out(Memwb_alu_r),
           .ALU_equal_out(Memwb_alu_equal),
           .DM_data_out(Memwb_dm_data),
           .instr_out(Memwb_instr),
           .ctrl_out(Memwb_ctrl),
           .PC0_out(Memwb_PC0),
           .RF_R1_out(Memwb_RFR1),
           .RF_R2_out(Memwb_RFR2)
       );
       
  // ------WB--------------------
   
     //choose RF W#
    wire [1:0] RF_W;
    assign RF_W = Memwb_ctrl[23:22];
    MUX2_4_5bit rf_w_choose(
         .in0(Memwb_instr[15:11]),
         .in1(Memwb_instr[20:16]),
         .in2(5'b1_1111),
         .in3(5'd0),
         .sel(RF_W),
         .res(Regs_W_No)
     );
    
    //choose Din
    wire [1:0] RegWriteData;
    assign RegWriteData = Memwb_ctrl[1:0];
    MUX2_4 Din_choose(
         .in0(AMemwb_alu_r),
         .in1(Memwb_dm_data),
         .in2(Memwb_RFR1),
         .in3(32'h0000_0000),
         .sel(RegWriteData),
         .res(Regs_Din)
    );
    
       
       
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
   /*
   wire Digits_Clk;
   //parameter digit_clk_div  = 1 ;
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
        .in3(DM_DataOut1),
        .in4(rom_data),
        .in5(0),
        .in6(0),// for test
        .in7(0), // for test
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
   wire SyscallDisplay ;
   //testing
   assign SyscallDisplay = (Memwb_alu_equal & (Memwb_ctrl[19]));
   //assign SyscallDisplay = ((Control_sig[19]));
   assign display = ((~SyscallDisplay) & CMemwb_ctrl[19]);
   assign test = SyscallDisplay;
   
   always@(negedge CLK or negedge reset) 
   begin
        if(~reset)
        begin
            Display_data <= 0;
        end
        else if (display)
            begin
               Display_data <=  Memwb_RFR2;
            end     
   end
   
     
     reg stop;
    //CLK 
    always@(negedge CLK or negedge reset)
    begin
        if(~reset)
        begin
            stop <= 0;   
        end
        else 
        begin
         if(SyscallDisplay)
         begin
            stop <= 1;
         end
        end
    end
    
    always@(ClkCycle) 
    begin
        if(stop)
        begin
            CLK <= 0;
        end
        else
        begin
            CLK <= ClkCycle;
        end
    end
    
    // for testing
    
    reg [31:0] test1;
    always@(posedge SyscallDisplay or negedge reset)
    begin
        if(~reset)
        begin
            test1 <= 0;
        end
        else
        begin
        test1 <= test1 + 1;
        end
    end   
    
    assign CLK_OUT_LED = CLK;
    assign clk_OUT_LED = clk;
    */
endmodule
