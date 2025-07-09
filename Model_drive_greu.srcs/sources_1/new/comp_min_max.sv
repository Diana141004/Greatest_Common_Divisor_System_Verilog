`timescale 1ns / 1ps

module comp_min_max(
    input logic [7:0]in0,
    input logic [7:0]in1,
    
    output logic [7:0]max,
    output logic [7:0]min
    
    );
    
    always_comb begin
           if(in0>in1) begin
                max=in0;
                min=in1;
           end 
           
           else begin
                max=in1;
                min=in0;
           end
    end
    
endmodule
