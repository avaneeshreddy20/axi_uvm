
`include"interface.sv"

module top;

	import axi_test_pkg::*;
	import uvm_pkg::*;

	bit clock;
	
	always
		begin
			#10 clock=~clock;
		end

	axi_if in0(clock);
initial
	begin
      
      $dumpfile("dump.vcd");
	    $dumpvars(1);
		//write_xtn_master req;
	 
		uvm_config_db #(virtual axi_if)::set(null,"*","vif",in0);
		run_test("axi_base_test");

	end

endmodule