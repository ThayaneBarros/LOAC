/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 5: Problema 2 (Contador de uma Sequência Qualquer)
*/

parameter NBITS_COUNT = 4;
module Contador (
  input logic clk, reset,entrada, 
  output logic [NBITS_COUNT-1:0] saida);
  
  always @(posedge clk) begin
    if(reset)
      saida <= 0;  // Reinicia a saída do contador para zero quando o sinal de reset for ativado
    else if(entrada)
      saida <= 1;  // Define a saída do contador como 1 quando o sinal de entrada for ativado
    else
      if(saida[NBITS_COUNT-1]) saida <= 1;  // Se o bit mais significativo da saída for 1, define a saída como 1
      else saida <= saida << 1;  // Desloca a saída uma posição para a esquerda (multiplicação por 2) quando o sinal de entrada estiver desativado

  end
endmodule