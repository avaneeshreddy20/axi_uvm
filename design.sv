package axi_test_pkg;

	import uvm_pkg::*;

	`include"uvm_macros.svh"
	
	`include"master_xtn.sv"
	`include"slave_xtn.sv"
	
	`include"axi_master_config.sv"
	`include"axi_slave_config.sv"
	
	`include"axi_env_config.sv"
	
	`include"master_wbase_seq.sv"
	`include"slave_wbase_seq.sv"
	
	`include"master_sequencer.sv"
	`include"slave_sequencer.sv"
	
	`include"slave_driver.sv"
	`include"master_driver.sv"
	
	`include"slave_monitor.sv"
	`include"master_monitor.sv"
	
	`include"axi_scoreboard.sv"
	`include"slave_agent.sv"
	`include"master_agent.sv"
	`include"master_agent_top.sv"
	`include"slave_agent_top.sv"
	`include"axi_tb.sv"
	`include"test.sv"




endpackage
