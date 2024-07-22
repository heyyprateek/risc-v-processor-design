package yarp_pkg;
  typedef enum logic[6:0] {
    R_TYPE    = 7'h33,
    I_TYPE_0  = 7'h03,
    I_TYPE_1  = 7'h13,
    I_TYPE_2  = 7'h67,
    S_TYPE    = 7'h23,
    B_TYPE    = 7'h63,
    U_TYPE_0  = 7'h37,
    U_TYPE_1  = 7'h17,
    J_TYPE    = 7'h6F
  } riscv_op_t;
endpackage