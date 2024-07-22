module instr_decode  (
  input   logic [31:0]  inst_in,
  output  logic [4:0]   rs1_o,
  output  logic [4:0]   rs2_o,
  output  logic [4:0]   rd_o,
  output  logic [6:0]   op_o,
  output  logic [2:0]   funct3_o,
  output  logic [6:0]   funct7_o,
  output  logic         r_type_instr_o,
  output  logic         i_type_instr_o,
  output  logic         s_type_instr_o,
  output  logic         b_type_instr_o,
  output  logic         u_type_instr_o,
  output  logic         j_type_instr_o,
  output  logic [31:0]  instr_imm_o
);

logic [6:0] opcode;
logic [31:0]         r_type_imm;
logic [31:0]         i_type_imm;
logic [31:0]         s_type_imm;
logic [31:0]         b_type_imm;
logic [31:0]         u_type_imm;
logic [31:0]         j_type_imm;

assign i_type_imm = {{20{inst_in[31]}},inst_in[31:20]};
assign s_type_imm = {{20{inst_in[31]}},inst_in[31:25],inst_in[11:7]};
assign b_type_imm = {{20{inst_in[31]}},inst_in[7],inst_in[30:25],inst_in[11:8],1'b0};
assign u_type_imm = {inst_in[31:12],12'h0};
assign j_type_imm = {{12{instr_i[31]}}, instr_i[19:12],instr_i[20], instr_i[30:21], 1'b0};

assign rs1_o = inst_in[19:15];
assign rs2_o = inst_in[24:20];
assign rd_o  = inst_in[11:7];
assign opcode = inst_in[6:0];
assign op_o  = inst_in[6:0];
assign funct3_o =inst_in[14:12];
assign funct7_o = inst_in[31:25];
 
always@(*)begin
    r_type_instr_o = 1'b0;
    i_type_instr_o = 1'b0;
    s_type_instr_o = 1'b0;
    b_type_instr_o = 1'b0;
    u_type_instr_o = 1'b0;
    j_type_instr_o = 1'b0;
    case (opcode):
    R_TYPE   : begin instr_imm_o = 32'h0; r_type_instr_o = 1'b1; end
    I_TYPE_0,
    I_TYPE_1,
    I_TYPE_2 : begin instr_imm_o = i_type_imm; i_type_instr_o = 1'b1; end
    S_TYPE   : begin instr_imm_o = s_type_imm; s_type_instr_o = 1'b1; end
    B_TYPE   : begin instr_imm_o = b_type_imm; b_type_instr_o = 1'b1; end
    U_TYPE_0,
    U_TYPE_1 : begin instr_imm_o = u_type_imm; u_type_instr_o = 1'b1; end
    J_TYPE   : begin instr_imm_o = j_type_imm; j_type_instr_o = 1'b0; end
    default  : begin instr_imm_o = 32'h0;    
              r_type_instr_o = 1'b0;
              i_type_instr_o = 1'b0;
              s_type_instr_o = 1'b0;
              b_type_instr_o = 1'b0;
              u_type_instr_o = 1'b0;
              j_type_instr_o = 1'b0; 
              end
    endcase
end


endmodule