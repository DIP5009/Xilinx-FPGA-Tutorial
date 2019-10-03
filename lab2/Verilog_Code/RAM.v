`timescale 1ns / 1ps
module Single_Port_Memory(//Input
						  CLK,
						  CEN,
						  WEN,
						  ADDR,
						  DIN,
						  //Output
						  DOUT
						  );

parameter ADDRESS_SIZE = 10;
parameter WORD_SIZE = 32;
parameter WORD_NUMBER = 1024;

//#################### Input & Output Variable Declare ####################						  
input CLK ;
input CEN, WEN ;
input [ADDRESS_SIZE-1:0] ADDR ;
input [WORD_SIZE-1:0] DIN ;

output [WORD_SIZE-1:0] DOUT ;

//#################### Wire & Reg Variable Declare ####################
reg [ADDRESS_SIZE-1:0] ADDR_Reg ;
reg [WORD_SIZE-1:0] MEMORY [0:WORD_NUMBER-1] ;

//******************** Memory ********************
always@(posedge CLK) begin
  if(CEN == 1) begin
     if(WEN == 1) begin
        MEMORY[ADDR] = DIN ;
     end
	 
     ADDR_Reg <= ADDR ;
  end
end

assign DOUT = MEMORY[ADDR_Reg] ; 

endmodule
