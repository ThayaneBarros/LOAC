/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 2: Problema 2.a (Roteamento)
*/

module roteador (input logic [3:0] A, B, // Entradas de 4 bits A e B
                 input logic SEL,          // Seleção de qual entrada será transmitida
                 output logic [3:0] Saida  // Saída de 4 bits
                );
  
   always_comb begin
	case(SEL)
  	1'b0: Saida = A; // Se SEL for 0, transmitir a entrada A
  	default: Saida = B; // Se SEL for 1, transmitir a entrada B
	endcase
  end

endmodule

