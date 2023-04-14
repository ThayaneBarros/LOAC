/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 1: Problema 1 (Elevador)
*/

module elevator_circuit(input logic M, A1, A2, A3,
                   	output logic P);
 
  // A porta só deve abrir se o elevador estiver em um andar específico e parado
  always_comb P <= ~M & (A1 | A2 | A3);
endmodule