class slave_agent_top extends uvm_env;

	`uvm_component_utils(slave_agent_top);
	
	slave_agent s_agenth[];

	axi_env_config e_cfg;


	extern function new(string name = "slave_agent_top" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);



endclass


   	function slave_agent_top::new(string name = "slave_agent_top" , uvm_component parent);
		super.new(name,parent);

	if(!uvm_config_db#(axi_env_config)::get(this,"","axi_env_config",e_cfg))

		`uvm_fatal("SLAVE_AGT_TOP","Cannot get configuration db from the test")


	endfunction

 	function void slave_agent_top::build_phase(uvm_phase phase);

     		super.build_phase(phase);
		
   		s_agenth=new[e_cfg.no_of_slave_agent];
		
		foreach(s_agenth[i])

		begin

   		s_agenth[i]=slave_agent::type_id::create($sformatf("s_agenth[%0d]",i),this);
		uvm_config_db#(axi_slave_config)::set(this,$sformatf("s_agenth[%0d]*",i),"set_from_slave_top",e_cfg.s_cfg[i]);

			
		end

	endfunction


	task slave_agent_top::run_phase(uvm_phase phase);
		uvm_top.print_topology;
	endtask   



