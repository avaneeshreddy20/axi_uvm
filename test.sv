 class axi_base_test extends uvm_test;

 	`uvm_component_utils(axi_base_test)

 	 axi_tb envh;

	 master_wbase_seq seqh1;
	 slave_wbase_seq seqh2;

         axi_env_config e_cfg;

         axi_master_config m_cfg[];

         axi_slave_config s_cfg[];
	
	 int no_of_master_agent=1;
	 int no_of_slave_agent=1;

	extern function new(string name = "axi_base_test" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
        extern function void config_axi();
	extern task run_phase(uvm_phase phase);

endclass


function axi_base_test::new(string name = "axi_base_test" , uvm_component parent);

	super.new(name,parent);

endfunction

function void axi_base_test::build_phase(uvm_phase phase);
               

	e_cfg=axi_env_config::type_id::create("e_cfg");
	
	e_cfg.m_cfg=new[no_of_master_agent];
	e_cfg.s_cfg=new[no_of_slave_agent];
	
	m_cfg=new[no_of_master_agent];
	s_cfg=new[no_of_slave_agent];

	foreach(m_cfg[i])
        m_cfg[i]=axi_master_config::type_id::create($sformatf("m_cfg[%0d]",i));
	

	foreach(s_cfg[i])
        s_cfg[i]=axi_slave_config::type_id::create($sformatf("s_cfg[%0d]",i));
                
        config_axi();
 
     	super.build_phase(phase);
               
	envh=axi_tb::type_id::create("envh", this);

	

endfunction

function void axi_base_test::config_axi();

	foreach(m_cfg[i])
		begin
			if(!uvm_config_db #(virtual axi_if)::get(this,"","vif",m_cfg[i].m_vif))
				`uvm_fatal("VIF CONFIG","cannot get()interface vif from uvm_config_db. Have you set() it?") 

         		m_cfg[i].is_active = UVM_ACTIVE;

	 		e_cfg.m_cfg[i] = m_cfg[i];
		end

       	foreach(s_cfg[i])
		begin
			if(!uvm_config_db #(virtual axi_if)::get(this,"","vif",s_cfg[i].s_vif))
				`uvm_fatal("VIF CONFIG","cannot get()interface vif from uvm_config_db. Have you set() it?") 
		
         		s_cfg[i].is_active = UVM_ACTIVE;

	 		e_cfg.s_cfg[i] = s_cfg[i];
		end

	 e_cfg.no_of_master_agent=no_of_master_agent;
	 e_cfg.no_of_slave_agent=no_of_slave_agent;
	 
	uvm_config_db #(axi_env_config)::set(this,"*","axi_env_config",e_cfg);


endfunction
	

task axi_base_test::run_phase(uvm_phase phase);

 phase.raise_objection(this);
	seqh1=master_wbase_seq::type_id::create("seqh1");
	seqh2=slave_wbase_seq::type_id::create("seqh2");

begin
	fork
	seqh1.start(envh.m_agenth_top.m_agenth[0].m_sequencer);
	
	seqh2.start(envh.s_agenth_top.s_agenth[0].m_sequencer);
      $display("##########################################1");
	join
  
end
  

 phase.drop_objection(this);
		
endtask
