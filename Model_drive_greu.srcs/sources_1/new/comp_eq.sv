`timescale 1ns / 1ps

module comp_eq(
    input logic in0,
    input logic [7:0]in1,
    
    output logic out
    );
    
    always_comb begin
        if(in0==in1) out=1;
        else out=0;
    end
endmodule
