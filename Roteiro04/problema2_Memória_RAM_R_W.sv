/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 4: Problema 2 (Memória RAM R/W)
*/

parameter ADDR_WIDTH = 2; // Tamanho do endereço em bits
parameter DATA_WIDTH = 4; // Tamanho dos dados de entrada e saída em bits

module ram_rw_4x4 (
  input logic clk, reset, sel, // Entradas de clock, reset e seleção                
  input logic [DATA_WIDTH-1:0] din,   // Dados de entrada
  input logic [ADDR_WIDTH-1:0] addr,  // Endereço
  output logic [DATA_WIDTH-1:0] dout  // Dados de saída
);

  // declaração da memória RAM como uma matriz de 4x4 de 4 bits cada
  logic [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1]; 

  always_ff @(posedge clk) begin
    if (reset) begin
      // reset da memória
      for (int i=0; i<(1<<ADDR_WIDTH); i++) begin
        mem[i] <= '0;
      end
    end else begin
      if (sel == 1) begin
        // escrita na memória
        mem[addr] <= din;
      end else begin
        // leitura na memória
        dout <= mem[addr];
      end
    end
  end

endmodule