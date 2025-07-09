`timescale 1ns / 1ps

module FSM(
    input logic clk,
    input logic rst,
    input logic start,
    input logic stop,
    
    output logic start_computing,
    output logic we,
    output logic rr
    );
    
    localparam idle=2'b00;
    localparam computing=2'b01;
    localparam ends=2'b11;
    
    logic [1:0]stare,stare_next;
    
    always_ff @(posedge clk) begin
        if(rst==1) begin
            stare <= idle;
        end
        else begin 
            stare <= stare_next;
        end
    end
    
    always_comb begin
        stare_next=stare;
        
        case (stare) 
            idle: begin
                if(start==1) begin
                    stare_next=computing;
                end
                
                else stare_next=idle;
            end
            
            computing: begin
                if(stop==1) stare_next=ends;
                else stare_next=computing;
            end
            
            ends: begin
                stare_next=idle;
            end
            
        endcase
    end
    
    always_ff @(negedge clk) begin
    
        if(stare==idle) start_computing=1;
        else start_computing =0;
        
        if(stare==computing && stop==1) we=1;
        else we=0;
        
        if(stare==ends) rr=1;
        else rr=0;
        
    end
    
endmodule
