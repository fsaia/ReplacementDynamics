/////////////////////////////////////////////
// Proving that there are no biquadratic specializations
// of the depressed quartic associated to R(y)
//
/////////////////////////////////////////////

A<c,d> := AffineSpace(Rationals(),2);

// scaled numerator of the coefficient of the degree 2 term
// of the depressed quartic 
B_2 := -d^4 + 10*c*d^3 - 24*c^2*d^2 - 2*c^3*d + c^4;

// g has factorization type (2,2)
Fg := Factorization(g);
g1 := Fg[1][1];
g2 := Fg[2][1];

C1 := Curve(A,g1);
C2 := Curve(A,g2);
X1 := ProjectiveClosure(C1);
X2 := ProjectiveClosure(C2);

IsLocallySolvable(X1,3:Smooth); // no points over Q_3 
IsLocallySolvable(X2,3:Smooth); // no points over Q_3 


