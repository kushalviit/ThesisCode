// ==============================================================
// File generated by AutoESL - High-Level Synthesis System (C, C++, SystemC)
// Version: 2012.1
// Copyright (C) 2012 Xilinx Inc. All rights reserved.
// 
// ==============================================================


`timescale 1ns/1ps

module distance_squared_grp_fu_228_ACMP_dcmp_4
#(parameter
    ID         = 4,
    NUM_STAGE  = 3,
    din0_WIDTH = 64,
    din1_WIDTH = 64,
    dout_WIDTH = 1
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  ce,
    input  wire [din0_WIDTH-1:0] din0,
    input  wire [din1_WIDTH-1:0] din1,
    input  wire [4:0]            opcode,
    output wire [dout_WIDTH-1:0] dout
);
//------------------------Parameter----------------------
// AutoESL opcode
localparam [4:0]
    AP_OEQ = 5'b00001,
    AP_OGT = 5'b00010,
    AP_OGE = 5'b00011,
    AP_OLT = 5'b00100,
    AP_OLE = 5'b00101,
    AP_ONE = 5'b00110,
    AP_UEQ = 5'b01001,
    AP_UGT = 5'b01010,
    AP_UGE = 5'b01011,
    AP_ULT = 5'b01100,
    AP_ULE = 5'b01101,
    AP_UNE = 5'b01110;

// FPV6 opcode
localparam [7:0]
    OP_EQ = 8'b00010100,
    OP_GT = 8'b00100100,
    OP_GE = 8'b00110100,
    OP_LT = 8'b00001100,
    OP_LE = 8'b00011100,
    OP_NE = 8'b00101100;
//------------------------Local signal-------------------
wire                  aclk;
wire                  aclken;
wire                  a_tvalid;
wire [63:0]           a_tdata;
wire                  b_tvalid;
wire [63:0]           b_tdata;
wire                  op_tvalid;
reg  [7:0]            op_tdata;
wire                  r_tvalid;
wire [7:0]            r_tdata;
reg                   ce_buf1;
reg  [din0_WIDTH-1:0] din0_buf1;
reg  [din1_WIDTH-1:0] din1_buf1;
reg  [4:0]            opcode_buf1;
//------------------------Instantiation------------------
distance_squared_ap_dcmp_1_no_dsp distance_squared_ap_dcmp_1_no_dsp_u (
    .aclk                    ( aclk ),
    .aclken                  ( aclken ),
    .s_axis_a_tvalid         ( a_tvalid ),
    .s_axis_a_tdata          ( a_tdata ),
    .s_axis_b_tvalid         ( b_tvalid ),
    .s_axis_b_tdata          ( b_tdata ),
    .s_axis_operation_tvalid ( op_tvalid ),
    .s_axis_operation_tdata  ( op_tdata ),
    .m_axis_result_tvalid    ( r_tvalid ),
    .m_axis_result_tdata     ( r_tdata )
);
//------------------------Body---------------------------
assign aclk     = clk;
assign aclken   = ce_buf1;
assign a_tvalid = 1'b1;
assign a_tdata  = din0_buf1;
assign b_tvalid = 1'b1;
assign b_tdata  = din1_buf1;
assign dout     = r_tdata[0];

always @(*) begin
    case (opcode_buf1)
        AP_OEQ  : op_tdata = OP_EQ;
        AP_OGT  : op_tdata = OP_GT;
        AP_OGE  : op_tdata = OP_GE;
        AP_OLT  : op_tdata = OP_LT;
        AP_OLE  : op_tdata = OP_LE;
        AP_ONE  : op_tdata = OP_NE;
        AP_UEQ  : op_tdata = OP_EQ;
        AP_UGT  : op_tdata = OP_GT;
        AP_UGE  : op_tdata = OP_GE;
        AP_ULT  : op_tdata = OP_LT;
        AP_ULE  : op_tdata = OP_LE;
        AP_UNE  : op_tdata = OP_NE;
        default : op_tdata = OP_EQ;
    endcase
end

always @(posedge clk) begin
    ce_buf1     <= ce;
    din0_buf1   <= din0;
    din1_buf1   <= din1;
    opcode_buf1 <= opcode;
end

endmodule
