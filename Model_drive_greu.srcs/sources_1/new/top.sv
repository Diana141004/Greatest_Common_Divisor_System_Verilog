`timescale 1ns / 1ps

module top(
    input logic [7:0]in0,
    input logic [7:0]in1,
    input logic clk,
    input logic rst,
    input logic start,
    
    output logic [7:0]steps_count,
    output logic [7:0]out
    );
    
    logic en_fsm,we_fsm,rr_fsm,out_comp,rst_reg,en_cnt,rst_cnt;
    logic [7:0] in0_comp,out_reg2,in1_comp,max_out,min_out,out_reg1,out_substract,out_counter;
    
    FSM FSM_inst(
    .clk(clk),
    .rst(rst),
    .start(start),
    .stop(out_comp),
    .start_computing(en_fsm),
    .we(we_fsm),
    .rr(rr_fsm)
    );
    
    mux mux_inst1(
        .in0(out_substract),
        .in1(in0),
        .sel(en_fsm),
        .out(in0_comp)
    );
    
    mux mux_inst2 (
        .in0(out_reg2),
        .in1(in1),
        .sel(en_fsm),
        .out(in1_comp)
    );
    
    comp_min_max comp_min_max_inst(
        .in0(in0_comp),
        .in1(in1_comp),
        .max(max_out),
        .min(min_out)
    );
    
   assign rst_reg=rst||rr_fsm;
    
    registru_8b registru_8b_inst1(
        .clk(clk),
        .data_in(max_out),
        .data_out(out_reg1),
        .rst(rst_reg)
    );
    
    registru_8b registru_8b_inst2(
        .clk(clk),
        .data_in(min_out),
        .data_out(out_reg2),
        .rst(rst_reg)
    );
    
    substract substract_inst(
        .in0(out_reg1),
        .in1(out_reg2),
        .out(out_substract)
    );
    
    counter counter_inst1(
        .clk(clk),
        .rst(rst),
        .en(en_fsm),
        .out(out_counter)
    );
    
    comp_eq comp_eq_inst(
        .in0(0),
        .in1(out_substract),
        .out(out_comp)
    );
    
    assign en_cnt=~out_comp;
    assign rst_cnt=rst||en_fsm;
    
     counter counter_inst2(
        .clk(clk),
        .rst(rst_cnt),
        .en(en_fsm),
        .out(steps_count)
    );
    
    ram ram_inst(
        .clk(clk),
        .rst(rst),
        .addr_read(out_counter),
        .addr_write(out_counter),
        .data_write(out_reg2),
        .we(we_fsm),
        .data_read(out)
    );
    
    
    
    
endmodule
