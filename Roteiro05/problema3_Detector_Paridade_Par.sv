/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 5: Problema 3 (Detector de Paridade Par)
*/

parameter tamanho = 1;
module detector_paridade_par(
  input clk, reset, serial_input,
  output saida);
  
  enum logic [tamanho-1 : 0] {PAR, IMPAR} state;
  
  // Transição de estados da máquina de estados
  always_ff @ (posedge clk)
    if (reset) state <= PAR;  // Reinicia a máquina de estados para o estado PAR quando o sinal reset está ativo
  	else
      unique case (state)
        PAR:
          if (serial_input == 0)
            state <= PAR;  // Permanece no estado PAR se a entrada serial for igual a 0
          else
            state <= IMPAR;  // Muda para o estado IMPAR se a entrada serial for diferente de 0
        IMPAR:
          if (serial_input == 0)
            state <= IMPAR;  // Permanece no estado IMPAR se a entrada serial for igual a 0
          else
            state <= PAR;  // Muda para o estado PAR se a entrada serial for diferente de 0
      endcase
  
  always_comb saida <= (state == IMPAR);  // A saída é 1 se o estado for IMPAR, indicando paridade ímpar; caso contrário, a saída é 0, indicando paridade par
endmodule