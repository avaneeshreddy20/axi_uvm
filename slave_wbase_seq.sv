class slave_wbase_seq extends uvm_sequence #(write_xtn_slave);  
	
 
	`uvm_object_utils(slave_wbase_seq)  
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
        extern function new(string name ="slave_wbase_seq");
	extern task body();
endclass
//-----------------  constructor new method  -------------------//
function slave_wbase_seq::new(string name ="slave_wbase_seq");
	super.new(name);
endfunction

task slave_wbase_seq::body();
  
    
  repeat(req.NO_OF_TRANS)
    begin
      
		req=write_xtn_slave::type_id::create("req");
   		req.WRITE_DATA_TRANS++;
		start_item(req);
   	    //assert(req.randomize() with {AWID==req.WRITE_DATA_TRANS ;});
      
      	assert(req.randomize());
	   `uvm_info("SLAVE_WR_SEQUENCE",$sformatf("printing from slave sequence \n 	%s", req.sprint()),UVM_LOW) 
		finish_item(req); 
    end

endtask

