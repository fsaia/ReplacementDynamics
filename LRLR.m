K<c> := FunctionField(Rationals()); 
K<d> := FunctionField(K);	
// This and the prior line give K = \mathbb{Q}(c,d) is the field extension of the rationals via adjoining two variables c,d 

A<x,y> := AffineSpace(K,2);        // Polynomial ring in 2 variables x and y over K
f := c*x^2+d*y^2;                  // Our binary quadratic form over K
fL := [f,y];
fLR := [fL[1],Evaluate(f, [fL[1],fL[2]])];
fLRL := [Evaluate(f, [fLR[1],fLR[2]]),fLR[2]];
fLRLR := [fLRL[1], Evaluate(f, [fLRL[1],fLRL[2]])];

// print "fLRx fact:";
// #Factorization(fLR[1]-x);
// print "fLRy fact:";
// #Factorization(fLR[2]-y); 
// print "fLRLRx fact:";
// #Factorization(fLRLR[1]-x);
// print "fLRLRy fact:";
// #Factorization(fLRLR[2]-y);         


// To do: find all vectors (x,y) satisfying both fLRLR[1]-x and fLRLR[2]-y

Phi_LRLR_x := fLRLR[1]-x;       
Phi_LRLR_y := fLRLR[2]-y;           
Cx := Curve(A,Phi_LRLR_x);             
Cy := Curve(A,Phi_LRLR_y);

// Genus(Cx);
// Genus(Cy);

VLRLR := Scheme(A,[Phi_LRLR_x,Phi_LRLR_y]); // intersection of Cx and Cy in A
Comps := PrimaryComponents(VLRLR);
PLRLR := Comps[3];
gxLRLR := DefiningEquations(PLRLR)[1];
gyLRLR := DefiningEquations(PLRLR)[2];


