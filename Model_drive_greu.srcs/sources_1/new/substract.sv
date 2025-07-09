`timescale 1ns / 1ps

module substract(
    input logic [7:0]in0,
    input logic [7:0]in1,
    
    output logic [7:0]out
    );
    
    assign out=in0-in1;
endmodule
