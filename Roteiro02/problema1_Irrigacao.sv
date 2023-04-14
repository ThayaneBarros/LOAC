/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 2: Problema 1 (Irrigação)
*/

module IrrigationControl(
  input logic [1:0] U, // Variavel de entrada 
  output logic [1:0] Saida // Variavel de saída 
);

  always_comb begin
	case(U)
  	2'b00: Saida <= 2'b00;
  	2'b01: Saida <= 2'b01;
  	2'b10: Saida <= 2'b10;
  	2'b11: Saida <= 2'b11;
  	default: Saida <= 2'b00; // caso os valores de entrada não sejam válidos, assumimos que as duas áreas estão adequadas
	endcase
  end

endmodule