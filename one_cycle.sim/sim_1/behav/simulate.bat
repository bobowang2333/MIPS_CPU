@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim OneCycle_tb_behav -key {Behavioral:sim_1:Functional:OneCycle_tb} -tclbatch OneCycle_tb.tcl -view C:/One_Cycle_Streamline/one_cycle_pipeline/OneCycle_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
