/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 4: Problema 2 (Memória RAM R/W)
*/

parameter ADDR_WIDTH = 2; // Tamanho do endereço em bits
parameter DATA_WIDTH = 4; // Tamanho dos dados de entrada e saída em bits

module ram_rw_4x4 (
  input logic clk, sel,  // Entradas de clock e seleção               
  input logic [DATA_WIDTH-1:0] din,   // Dados de entrada
  input logic [ADDR_WIDTH-1:0] addr,  // Endereço
  output logic [DATA_WIDTH-1:0] dout  // Dados de saída
);

  // declaração da memória RAM como uma matriz de 4x4 de 4 bits cada
  logic [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1]; 

  always_ff @(posedge clk) begin
    if (sel == 1) mem[addr] <= din;   // O dado de entrada será armazenado na posição de memória 
    else dout <= mem[addr];           // O dado armazenado na posição de memória correspondente ao endereço será enviado para a saída
  end

endmodule