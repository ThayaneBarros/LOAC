/* 
Aluna: Thayane Stheffany Silva Barros - 121110604
Roteiro 3: Problema 1 (ULA)
*/
parameter Bits = 8;
module ULA(input logic signed [Bits-1:0] A, B, // Operandos A e B com sinal
           input logic [1:0] F,                // Seletor de operação da ULA
           output logic [Bits-1:0] Saida,      // Resultado da operação
           output logic FLAG_O);               // Flag para indicar overflow ou underflow

  always_comb begin
    FLAG_O = 0; // O sinal FLAG_O é inicializado com 0
    case(F)
      2'b00: Saida = A & B; // Operação AND
      2'b01: Saida = A | B; // Operação OR
      2'b10: begin          // Operação de adição
        Saida = A + B; 
        if (Saida[Bits-1] != A[Bits-1] && Saida[Bits-1] != B[Bits-1]) // Verifica overflow ou underflow
          FLAG_O = 1;
        else
          FLAG_O = 0;
      end
      2'b11: begin  // Operação de subtração
        Saida = A - B;
        if (Saida[Bits-1] != A[Bits-1] && Saida[Bits-1] == B[Bits-1]) // Verifica overflow ou underflow
          FLAG_O = 1;
        else
          FLAG_O = 0;
      end
      default: Saida = 8'b0; // Caso F não corresponda a uma operação válida, o resultado é zero
    endcase
  end
endmodule