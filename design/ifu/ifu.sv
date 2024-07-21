module instr_fetch (
    input logic  clk;
    input logic reset;
    // input to the module;
    input logic  [31:0] program_count;
    input logic [31:0]  inst_mem_input;
    //output form unite
    output logic ins_mem_req_o;
    output lgoic [31:0] ins_address;
    //output of the instructio do decode
    output logic inst_to_idu;
);
always @(posedge clk or negedge reset ) begin
    if(!reset)
        ins_mem_req_o <= 1'b0;
    else
        ns_mem_req_o <= 1'b1;
end
  assign ins_address = program_count;
  assign inst_to_idu = inst_mem_input;
endmodule