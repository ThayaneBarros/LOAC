/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 5: Problema 1 (Contador Up/Down)
*/

parameter NBITS_COUNT = 4;  // Parâmetro para definir o tamanho do contador

module contador_up_down (
  input logic clk, reset, count_direction,
  output logic [NBITS_COUNT-1:0] saida
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      saida <= 0;  // Reinicia o contador para zero quando o sinal de reset for ativado
    end else if (count_direction) begin
      saida <= saida + 1;  // Incrementa o contador quando a direção de contagem for para cima (count_direction = 1)
    end else begin
      saida <= saida - 1;  // Decrementa o contador quando a direção de contagem for para baixo (count_direction = 0)
    end
  end

endmodule