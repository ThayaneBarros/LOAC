/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 3: Problema 1 (ULA)
*/
parameter Bits = 8;
module circuit_ULA(input logic signed [Bits-1:0] A, B,
                   input logic [1:0] F,
                   output logic [Bits-1:0] Saida,
                   output logic FLAG_O);
  
  always_comb begin
    case(F)
      2'b00: Saida <= A & B;
      2'b01: Saida <= A | B;
      2'b10: Saida <= A + B;
      2'b11: Saida <= A - B;
      default: Saida <= 0;
    endcase;
    
    if((F == 2'b10 || F == 2'b11) && (Saida < -128 || Saida > 127)) 
      FLAG_O <= 1;
    else 
      FLAG_O <= 0; 
  end
  
endmodule
