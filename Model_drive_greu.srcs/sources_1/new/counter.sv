`timescale 1ns / 1ps

module counter(
    input logic clk,
    input logic rst,
    input logic en,
    
    output logic [7:0]out
    );
    
    always_ff @(posedge clk) begin
        if(rst==1) out=0;
        
        else begin
            if(en==1) out <= out+1;
        end
    end
    
endmodule
