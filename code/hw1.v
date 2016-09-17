module demorgan
(
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output nAandB,      // Single bit output, ~(A*B)
  output nAornB,      // Single bit output, ~A+~B
  output nAorB,       // Single bit output, ~(A+B)
  output nAandnB     // Single bit output, (~A)*(~B)

);

  wire nA;
  wire nB;
  wire AandB;
  wire AorB;

  not Ainv(nA, A);      // Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);

  and andgateAB(AandB, A, B);
  not AandBinv(nAandB, AandB); // Equation 1

  or orgatenAnB(nAornB, nA, nB); // Equation 2

  or orgateAB(AorB, A, B);
  not AorBinv(nAorB, AorB); //Equation 3

  and andgate(nAandnB, nA, nB);     // Equation 4 AND gate produces nAandnB from nA and nB


endmodule
