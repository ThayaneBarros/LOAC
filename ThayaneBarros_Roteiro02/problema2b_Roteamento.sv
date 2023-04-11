/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 2: Problema 2.b (Roteamento)
*/

parameter SEL_BITS = 2;
module roteador (input logic [3:0] A, B, C, D, // Entradas de 4 bits A e B
                 input logic [SEL_BITS-1:0] SEL, // Seleção de qual entrada será transmitida
                 output logic [3:0] Saida  // Saída de 4 bits
                );
  
   always_comb begin
	case(SEL)
  	2'b00: Saida <= A; // Se SEL for 00, transmitir a entrada A
  	2'b01: Saida <= B; // Se SEL for 01, transmitir a entrada B
  	2'b10: Saida <= C; // Se SEL for 10, transmitir a entrada C
  	default: Saida <= D; // Se SEL for 11, transmitir a entrada D
	endcase
  end

endmodule