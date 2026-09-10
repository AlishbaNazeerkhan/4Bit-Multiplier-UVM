//catch packet from monitor
//match with golden data

class scorboard extends uvm_scoreboard;
`uvm_component_utils(scorboard)

uvm_analysis_imp #(transaction, scorboard) recv;

function new(input string inst="sco", uvm_component parent = null);
super.new(inst, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
recv = new("recv", this);
endfunction

virtual function void write(transaction tr);
if(tr.y == (tr.a * tr.b)) begin
`uvm_info("SCO", $sformatf("Test Passed -> a : %0d , b : %0d , y : %0d", tr.a, tr.b, tr.y),UVM_NONE);
 end else begin
`uvm_error("SCO", $sformatf("Test Failed -> a : %0d , b : %0d , y : %0d", tr.a, tr.b, tr.y));
$display("---------------------------------------");
end
endfunction

endclass
