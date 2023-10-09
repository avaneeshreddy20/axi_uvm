class master_agent_top extends uvm_env;

	`uvm_component_utils(master_agent_top);
	
	master_agent m_agenth[];

	axi_env_config e_cfg;


	extern function new(string name = "master_agent_top" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);



endclass


   	function master_agent_top::new(string name = "master_agent_top" , uvm_component parent);
		super.new(name,parent);

	if(!uvm_config_db#(axi_env_config)::get(this,"","axi_env_config",e_cfg))

		`uvm_fatal("MASTER_AGT_TOP","Cannot get configuration db from the test")
      
      $display("$$$$$$$$$$$$$$$$$ %0p",e_cfg);

	

	endfunction

 	function void master_agent_top::build_phase(uvm_phase phase);

     		super.build_phase(phase);
		
		m_agenth=new[e_cfg.no_of_master_agent];
		foreach(m_agenth[i])
			begin
			uvm_config_db#(axi_master_config)::set(this,$sformatf("m_agenth[%0d]*",i),"set_from_master_top",e_cfg.m_cfg[i]);

   			m_agenth[i]=master_agent::type_id::create($sformatf("m_agenth[%0d]",i),this);
			end

	endfunction


	task master_agent_top::run_phase(uvm_phase phase);
		uvm_top.print_topology;
	endtask   



