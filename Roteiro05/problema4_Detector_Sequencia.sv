/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 5: Problema 4 (Detector de Sequência)
*/

parameter tamanho = 2;
module circuit(
	input clk, reset, lamp1, lamp2, lamp3,
	output alarme);
  
  // Definição dos estados da máquina de estados
  enum logic [tamanho-1 :0] {Inicio, Lampada1, Lampada2, Lampada3} state;
  
  always_ff @ (posedge clk)
    if (reset) state <= Inicio;  // Estado inicial é 'Inicio'
  	else
      unique case (state)
        Inicio:
          if (lamp1)
            state <= Lampada1;  // Se a lampada 1 estiver ligada, avança para o estado 'Lampada1'
          else
            state <= Inicio;  // Se a lampada 2 ou 3 estiver ligada, volta para o estado 'Inicio'
        Lampada1:
          if (lamp2)
            state <= Lampada2;  // Se a lampada 2 estiver ligada, avança do estado 'Lampada1' para o estado 'Lampada2'
          else if (lamp1)
            state <= Lampada1;
          else
            state <= Inicio;  // Se a lampada 3 estiver ligada enquanto o estado for 'Lampada1', volta para o estado 'Inicio'
        Lampada2:
          if (lamp3)
            state <= Lampada3;  // Se a lampada 3 estiver ligada, avança do estado 'Lampada2' para o estado 'Lampada3'
          else if (lamp1)
            state <= Lampada1;
          else
            state <= Inicio;  // Se a lampada 2 for ligada, o estado volta para o 'Inicio'
        Lampada3:
          if (lamp1)
            state <= Lampada1;  // Se lampada 1 está ligado durante o estado de alarme, o estado volta para 'Lampada1'
          else
            state <= Inicio;  // Se a lampada 2 ou 3 estiver ligada, volta para o estado 'Inicio'
      endcase
  
  // Saída indicando se a sequência 1-2-3 foi observada
  always_comb alarme <= (state == Lampada3);
endmodule