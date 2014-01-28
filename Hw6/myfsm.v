module myfsm (clk, rst, x, z);
input clk, rst, x; output z;

// state flip-flops
reg [2:0] state, nxt_st;
// state definition
parameter S0=0,S1=1,S2=2,S3=3,S7=7;

// REGISTER DEFINITION
always @(posedge clk or posedge rst) 
begin
  if (rst) state <= S0;
  else 
  state<=nxt_st;
end

// OUTPUTCALCULATIONS
assign z = (state==S7);

// NEXT STATE CALCULATIONS
always @(state or x)
begin
case (state)
  S0: if(x) nxt_st=S1;
         else nxt_st=S0;
  S1: if(x) nxt_st=S3;
         else nxt_st=S2;
  S2: if(x) nxt_st=S0;
         else nxt_st=S7;
  S3: if(x) nxt_st=S2;
         else nxt_st=S7;
  S7:  nxt_st=S0;
  default: nxt_st = S0;
endcase
end

endmodule

