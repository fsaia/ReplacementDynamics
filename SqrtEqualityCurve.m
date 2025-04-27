// Investigating the equation obtained in SqrtEquality.m
// via the corresponding curve in A^2 in variables c,d. 

A<c,d> := AffineSpace(Rationals(),2);

G := -25*d^12 + 405*c*d^11 - 4752*c^2*d^10 + 37104*c^3*d^9 - 172194*c^4*d^8 +
    438210*c^5*d^7 - 517584*c^6*d^6 + 114504*c^7*d^5 + 51027*c^8*d^4 -
    10879*c^9*d^3 - 1608*c^10*d^2 + 240*c^11*d^1 + 16*c^12; 

C := Curve(A,G); 
X := ProjectiveClosure(C); 

IsLocallySolvable(X,3:Smooth); // no points over Q_3 