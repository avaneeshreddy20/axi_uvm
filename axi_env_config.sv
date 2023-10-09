class axi_env_config extends uvm_object;

`uvm_object_utils(axi_env_config)

bit has_scoreboard=1;


bit has_master_agent=1;

bit has_slave_agent=1;

int no_of_master_agent=1;
int no_of_slave_agent=1;

axi_master_config m_cfg[];

axi_slave_config s_cfg[];

extern function new(string name = "axi_env_config");

endclass

function axi_env_config::new(string name = "axi_env_config");
  super.new(name);
endfunction

