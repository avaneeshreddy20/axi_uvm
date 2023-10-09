class axi_master_config extends uvm_object;

	`uvm_object_utils(axi_master_config)


	virtual axi_if m_vif;

	uvm_active_passive_enum is_active = UVM_ACTIVE;

	static int mon_rcvd_xtn_cnt = 0;
	static int drv_data_sent_cnt = 0;

	extern function new(string name = "axi_master_config");

endclass

function axi_master_config::new(string name = "axi_master_config");
  super.new(name);
endfunction



