// 1bit full-adder with output latch
module fa(ck, rst, a, b, ci, s, co);
   input ck, rst, a, b, ci;
   output s, co;
   reg 	  r_s, r_co;

   assign s = r_s, co = r_co;
   
   always @(posedge ck) begin
      if (rst == 1'b1) begin
	 r_s <= 1'b0; r_co <= 1'b0;
      end
      else begin
	 {r_co, r_s} = {a + b + ci};
	 // r_s <= a ^ b ^ ci;
	 // r_co <= (a & b) | (b & ci) | (ci & a);
      end
   end
endmodule
  
