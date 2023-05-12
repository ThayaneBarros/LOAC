/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 4: Problema 3 (Memória RAM ROM)
*/

// Parâmetros para definição do tamanho do endereço e dos dados de saída
parameter ADDR_WIDTH = 2;
parameter DATA_WIDTH = 4;

module RAM_ROM(
  input logic [ADDR_WIDTH-1:0] addr,       // Entrada de endereço
  output logic [DATA_WIDTH-1:0] dout       // Saída de dados
);
  // Sempre que o endereço mudar, o bloco always_comb será executado para definir o dado de saída correspondente
  always_comb
    case(addr)
      2'b00: dout = 4'b0100;    // Quando o endereço for 00, o dado de saída será 0100
      2'b01: dout = 4'b1100;    // Quando o endereço for 01, o dado de saída será 1100
      2'b10: dout = 4'b0110;    // Quando o endereço for 10, o dado de saída será 0110
      2'b11: dout = 4'b0111;    // Quando o endereço for 11, o dado de saída será 0111
    endcase 
endmodule