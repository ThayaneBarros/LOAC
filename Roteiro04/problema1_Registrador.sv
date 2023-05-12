/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 4: Problema 1 (Registrador Paralelo/Serial)
*/

parameter NBITS = 4; // Define o número de bits do registrador como 4

module registrador_paralelo_serial(
  input logic clk, reset, SEL, Din_serie,  // Entradas do registrador
  input logic [NBITS-1:0] Din,             // Entrada de dados no modo paralelo
  output logic [NBITS-1:0] Dout);          // Saída do registrador
  
  always_ff @(posedge reset or posedge clk) begin
    if(reset)begin  // Se o reset estiver ativado, reinicia o valor armazenado para 0
      Dout <= 0;
    end else if (SEL == 0) begin  // Se o modo for paralelo, armazena o valor presente em "Din" no registrador
      Dout <= Din;
    end else begin   // Se o modo for serial, desloca o valor armazenado para a esquerda em uma posição e armazena o valor presente em "Din_serie" no bit menos significativo
      Dout <= {Dout[NBITS-1:1], Din_serie};
    end
  end
endmodule