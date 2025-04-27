K<c> := FunctionField(Rationals()); 
K<d> := FunctionField(K);	
// This and the prior line give K = \mathbb{Q}(c,d) is the field extension of the rationals via adjoining two variables c,d 

A<x,y> := AffineSpace(K,2);        // Polynomial ring in 2 variables x and y over K
f := c*x^2+d*y^2;                  // Our binary quadratic form over K
fL := [f,y];
fLL := [Evaluate(f, [fL[1],fL[2]]),fL[2]];
fLLR := [fLL[1],Evaluate(f, [fLL[1],fLL[2]])];
fLLRL := [Evaluate(f, [fLLR[1],fLLR[2]]),fLLR[2]];
fLLRLR := [fLLRL[1], Evaluate(f, [fLLRL[1],fLLRL[2]])];

print "fLRLRx fact:";
#Factorization(fLLRLR[1]-x);
print "fLRLRy fact:";
#Factorization(fLLRLR[2]-y);         


// To do: find all vectors (x,y) satisfying both fLRLR[1]-x and fLRLR[2]-y

Phi_LLRLR_x := fLLRLR[1]-x;       
Phi_LLRLR_y := fLLRLR[2]-y;           
Cx := Curve(A,Phi_LLRLR_x);             
Cy := Curve(A,Phi_LLRLR_y);

// Genus(Cx);
// Genus(Cy);

V := Scheme(A,[Phi_LLRLR_x,Phi_LLRLR_y]); // intersection of Cx and Cy in A
Comps := PrimaryComponents(V);
W := Comps[3];