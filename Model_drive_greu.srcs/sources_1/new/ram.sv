`timescale 1ns / 1ps

module ram(
    input logic clk,
    input logic rst,
    input logic [7:0]addr_read,
    input logic [7:0]addr_write,
    input logic [7:0]data_write,
    input logic we,
    
    output logic [7:0]data_read
    );
    
    logic [7:0]memorie[0:255];
    
    always_ff @(posedge clk,posedge rst) begin
        if(rst==1) memorie[addr_read] <= 0;
        else begin
            if(we==1) memorie[addr_write] <= data_write;
        end
    end
    
    assign data_read = memorie[addr_read];
    
endmodule
