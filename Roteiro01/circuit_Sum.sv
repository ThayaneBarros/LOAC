/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 1: Problema 2 (Somador de 8 bits)
*/
parameter N_Bits = 8;
module circuit_Sum(
  // Variaveis de entrada em complemento de 2
  input logic signed[N_Bits-1:0] A1, A2,
  // Variaveis de saída em complemento de 2
  output logic signed[N_Bits-1:0] Sum,
  output logic Zero, Negative, Par);
  
  always_comb begin
    // Soma de A e B
    Sum <= A1 + A2;
    
    // Verifica se a soma é igual a zero
    Zero <= (Sum == 0); 
    
    // Verifica se a soma é negativa
    Negative <= Sum[N_Bits-1]; 
    
    // Verifica se a soma é par
    Par <= (Sum[0] == 0);
  end
endmodule