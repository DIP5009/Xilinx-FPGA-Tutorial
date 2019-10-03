`timescale 1ns / 1ps

module Adder(IN_DATA, OUT_DATA, IN_ADDR, OUT_ADDR, IN_WEN, OUT_CEN, RAM_SEL, start, finish, busy, CLK, RST_N);
    parameter ADDRESS_SIZE = 10;
    parameter WORD_SIZE = 32;
    parameter WORD_NUMBER = 1024;
    //Base
    input CLK,RST_N;
    //Control Signal
    input RAM_SEL; // 0 := A ,1 := B
    input start;
    //Feedback
    output finish;
    output busy;
    //Ram
    input IN_WEN, OUT_CEN;
    input [ADDRESS_SIZE-1 : 0]IN_ADDR;
    input [ADDRESS_SIZE-1 : 0]OUT_ADDR;
    input [WORD_SIZE-1 : 0]IN_DATA;
    output [WORD_SIZE-1 : 0]OUT_DATA;

    wire A_CEN, B_CEN;
    wire A_WEN, B_WEN;
    wire OUT_WEN, Inter_OUT_CEN;
    reg [ADDRESS_SIZE-1 : 0] Inter_IN_ADDR, Inter_OUT_ADDR;
    wire [WORD_SIZE-1 : 0] A_OUT_DATA, B_OUT_DATA;
    reg [WORD_SIZE-1 : 0] CIN;
    reg [ADDRESS_SIZE-1 : 0]count, count_1,count_2;
    reg state,next_state;
    reg Inter_start;

    Single_Port_Memory #(ADDRESS_SIZE, WORD_SIZE, WORD_NUMBER) RAM_A(
                        //Input
						.CLK(CLK),
						.CEN(A_CEN),
						.WEN(A_WEN),
						.ADDR(Inter_IN_ADDR),
						.DIN(IN_DATA),
						//Output
						.DOUT(A_OUT_DATA)
						);
    
    Single_Port_Memory #(ADDRESS_SIZE, WORD_SIZE, WORD_NUMBER) RAM_B(
                        //Input
						.CLK(CLK),
						.CEN(A_CEN),
						.WEN(A_WEN),
						.ADDR(Inter_IN_ADDR),
						.DIN(IN_DATA),
						//Output
						.DOUT(B_OUT_DATA)
						);

    Single_Port_Memory #(ADDRESS_SIZE, WORD_SIZE, WORD_NUMBER) RAM_C(
                        //Input
						.CLK(CLK),
						.CEN(Inter_OUT_CEN),
						.WEN(OUT_WEN),
						.ADDR(Inter_OUT_ADDR),
						.DIN(CIN),
						//Output
						.DOUT(OUT_DATA)
						);


    assign busy = state || next_state;
    assign finish = !state && !next_state;
    assign OUT_WEN = state;
    assign Inter_OUT_CEN = OUT_CEN || state;

    //Memory Generator
    always@(posedge CLK)begin
        if(!RST_N || !state)begin
            count <= 0;
            count_1 <= 0;
            count_2 <= 0;
        end
        else
            if(count >= count_2)
                count <= count + 1;
            else
                count <= WORD_NUMBER - 1;
            count_1 <= count;
            count_2 <= count_1;
    end

    //RAM
    assign A_WEN = !RAM_SEL && !state && IN_WEN;
    assign B_WEN = RAM_SEL && !state && IN_WEN;
    assign A_CEN = 1;
    assign B_CEN = 1;
    
    always@(*)begin
        if(state)begin
            Inter_IN_ADDR = count;
            Inter_OUT_ADDR = count_2;
        end
        else begin
            Inter_IN_ADDR = IN_ADDR;
            Inter_OUT_ADDR = OUT_ADDR;
        end
    end

    //Adder
    //assign CIN = (state)? A_OUT_DATA + B_OUT_DATA : 0;
    always@(posedge CLK)begin
        if(!RST_N) begin
            CIN <= 0;
        end
        else begin
            if(state)begin
                CIN <= A_OUT_DATA + B_OUT_DATA;
            end
            else begin
                CIN <= CIN;
            end
        end
    end


    /*
    always@(posedge CLK)begin
        if(RST_N) begin
            A_WEN <= 0;
            B_WEN <= 0;
        end
        else begin
            if(busy)begin
                A_WEN <= 0;
                B_WEN <= 0;
            end
            else begin
                A_WEN <= !RAM_SEL;
                B_WEN <= RAM_SEL;
                end
            end
        end
    end
    */
    
    always@(posedge CLK)begin
        if(!RST_N)
            next_state <= 0;
        else
            next_state <= state;
    end
    
    always@(posedge CLK)begin
        if(!RST_N)begin
            state <= 0;
            Inter_start <= 0;
        end
        else begin
            if(start && !state && !Inter_start)begin
                state <= 1;
                Inter_start <= 1;
            end
            else begin
                Inter_start <= start;
                if((count < (WORD_NUMBER -1) || count_2 < (WORD_NUMBER -1))&& state)
                    state <= 1;
                else 
                    state <= 0;
            end
        end
    end
endmodule