`timescale 1ns / 1ps

module registru_8b
	(
		input logic clk,
		input logic rst, 
		input logic [7:0] data_in, 
		output logic [7:0] data_out 
    );
    
always_ff @(posedge clk) begin    
    if(rst == 1) data_out <= 0;
    else
    	begin
           data_out <= data_in;
		end
end
    
endmodule
