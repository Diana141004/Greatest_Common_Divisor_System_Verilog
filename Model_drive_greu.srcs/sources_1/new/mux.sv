`timescale 1ns / 1ps

module mux(
    input logic [7:0]in0,
    input logic [7:0]in1,
    input logic sel,
    
    output logic [7:0]out
    );
    
    always_comb begin
    
        if(sel==0) out = in0;
        else out = in1;
        
    end
    
endmodule
