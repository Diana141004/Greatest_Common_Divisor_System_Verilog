`timescale 1ns / 1ps

module testbench();

 logic [7:0]in0;
     logic [7:0]in1;
     logic clk;
     logic rst;
   logic start;
    
     logic [7:0]steps_count;
     logic [7:0]out;
     
     top top_inst(.*);
     
     initial begin 
     clk=0;
         forever begin
              #1 clk=~clk;   
         end
     end
     
     initial begin
        rst=1;
        start=0;
        in0=64;
        in1=12;
        
        #4; rst=0;
        #2; start=1;
        #2; start=0;
        #30; in0=82; in1=164; 
        #2; start=1;
        #2; start=0;
        #30; 
        
        $stop;
        
     end

endmodule
