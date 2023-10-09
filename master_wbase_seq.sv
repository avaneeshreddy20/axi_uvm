class master_wbase_seq extends uvm_sequence #(write_xtn_master);  
	
 
	`uvm_object_utils(master_wbase_seq)  
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
        extern function new(string name ="master_wbase_seq");
	extern task body();

endclass
//-----------------  constructor new method  -------------------//
function master_wbase_seq::new(string name ="master_wbase_seq");
	super.new(name);
endfunction

task master_wbase_seq::body();

	
  repeat(req.NO_OF_TRANS)
    begin
    	req=write_xtn_master::type_id::create("req");
      
    	req.WRITE_DATA_TRANS++;
      
		start_item(req);
      	//assert(req.randomize() with {AWID==req.WRITE_DATA_TRANS ;});
  	
        assert(req.randomize());
  		`uvm_info("MASTER_WR_SEQUENCE",$sformatf("printing from master sequence \n %s", req.sprint()),UVM_LOW) 
		finish_item(req); 

    end
endtask

  