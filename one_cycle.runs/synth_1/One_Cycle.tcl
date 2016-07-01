# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {Common-41} -limit 4294967295
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/UART/lab1/one_cycle/one_cycle.cache/wt [current_project]
set_property parent.project_path C:/UART/lab1/one_cycle/one_cycle.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/Instr_Splitter.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/ControlUnit.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/ALU_bobo.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/ZeroExtender.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/ZeroExt16_32.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/SignExtender.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/PC.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/IM.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/DM.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/ClkDiv.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/Regfile.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/MUX2_4.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/MUX2_4_5bit.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/MUX1_2_32bit.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/MUX1_2_5bit.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/HexDigit.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/Display_Digit.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/One_Cycle.v
  C:/UART/lab1/one_cycle/one_cycle.srcs/sources_1/new/MUX3_8.v
}
read_xdc C:/UART/lab1/one_cycle/one_cycle.srcs/constrs_1/Nexys4_Master.xdc
set_property used_in_implementation false [get_files C:/UART/lab1/one_cycle/one_cycle.srcs/constrs_1/Nexys4_Master.xdc]

synth_design -top One_Cycle -part xc7a100tcsg324-1
write_checkpoint -noxdef One_Cycle.dcp
catch { report_utilization -file One_Cycle_utilization_synth.rpt -pb One_Cycle_utilization_synth.pb }
