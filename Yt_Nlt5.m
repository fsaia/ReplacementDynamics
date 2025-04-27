K<c> := FunctionField(Rationals()); 
K<d> := FunctionField(K);	
// This and the prior line give K = \mathbb{Q}(c,d) is the field extension of the rationals via adjoining two variables c,d 

A<x,y> := AffineSpace(K,2);        // Polynomial ring in 2 variables x and y over K
f := c*x^2+d*y^2;                  // Our binary quadratic form over K

// results of iteration

fL := [f,y];

fLL := [Evaluate(f, [fL[1],fL[2]]),fL[2]];

fLR := [fL[1],Evaluate(f,[fL[1],fL[2]])];

fLLL := [Evaluate(f,[fLL[1],fLL[2]]),fLL[2]]; 

fLLR := [fLL[1],Evaluate(f, [fLL[1],fLL[2]])];

fLRL := [Evaluate(f,[fLR[1],fLR[2]]),fLR[2]];

fLLLL := [Evaluate(f,[fLLL[1],fLLL[2]]),fLLL[2]];

fLLLR := [fLLL[1],Evaluate(f,[fLLL[1],fLLL[2]])];

fLLRR := [fLLR[1], Evaluate(f, [fLLR[1],fLLR[2]])];

fLRLR := [fLRL[1],Evaluate(f,[fLRL[1],fLRL[2]])]; 

fLLLLL := [Evaluate(f,[fLLLL[1],fLLLL[2]]),fLLLL[2]];

fLLLLR := [fLLLL[1],Evaluate(f,[fLLLL[1],fLLLL[2]])];

fLLLRR := [fLLLR[1],Evaluate(f,[fLLLR[1],fLLLR[2]])]; 

        
// dynamical modular polynomials 

Phi_L_x := fL[1] - x;

Phi_LL_x := Factorization(fLL[1]-x)[2][1]; // first factor is Phi_L_x
      
Phi_LR_y := fLR[2] - y; 

Phi_LLL_x := Factorization(fLLL[1] - x)[2][1]; // first factor is Phi_L_x

Phi_LLR_y := fLLR[2]-y;

Phi_LLLL_x := Factorization(fLLLL[1] - x)[3][1]; // first factor is Phi_L_x, second is Phi_LL_x

Phi_LLLR_y := fLLLR[2]-y;

Phi_LLRR_y := Factorization(fLLRR[2]-y)[2][1]; // first factor is Phi_LLR_y

Phi_LRLR_x := fLRLR[1]-x;
Phi_LRLR_y := fLRLR[2]-y;

Phi_LLLLL_x := Factorization(fLLLLL[1]-x)[2][1]; // first factor is Phi_L_x

Phi_LLLLR_y := fLLLLR[2]-y;

Phi_LLLRR_y := Factorization(fLLLRR[2] - y)[2][1]; // first factor is Phi_LLLR_y


// dynamical modular curves

C_L_x := Curve(A,Phi_L_x);

C_LL_x := Curve(A,Phi_LL_x); 

C_LR_y := Curve(A,Phi_LR_y);

C_LLL_x := Curve(A,Phi_LLL_x); 

C_LLR_y := Curve(A,Phi_LLR_y); 

C_LLLL_x := Curve(A,Phi_LLLL_x);

C_LLLR_y := Curve(A,Phi_LLLR_y);

C_LLRR_y := Curve(A,Phi_LLRR_y); 

C_LRLR_x := Curve(A,Phi_LRLR_x);
C_LRLR_y := Curve(A,Phi_LRLR_y);

C_LLLLL_x := Curve(A,Phi_LLLLL_x); 

C_LLLLR_y := Curve(A,Phi_LLLLR_y);

C_LLLRR_y := Curve(A,Phi_LLLRR_y); 





