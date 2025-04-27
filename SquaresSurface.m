A<c,d,n,z> := AffineSpace(Rationals(),4);

// M and N are the expressions (2alpha - b2) and z*(n^2+2alpha+b2)-2b1, respectively, 
// in the notation of the paper, each scaled by elements of \Q[c,d] which are nonzero 
// for each specialization. The former is scaled by a square in \Q[c,d]. 
// These are computed in Squares.m and copied here (as elements of A<c,d,n,z> in this file).
M := -3*d^6 + 12*c*d^5 - 234*c^2*d^4 + 240*c^3*d^3 - 3*c^4*d^2 - 12*c^5*d;
N := (96*c^2*d^5 - 96*c^3*d^4)*n^2*z + (-8*d^5 + 60*c*d^4 + 12*c^2*d^3 + 4*c^3*d^2 -
    4*c^4*d)*z + 3*d^4 - 30*c*d^3 + 72*c^2*d^2 + 6*c^3*d - 3*c^4; 

T1 := Scheme(A,z^2-M); // Threefold defined by z^2=M
T2 := Scheme(A,N); // Threefold defined by N
S := Scheme(A,[z^2-M,N]); // Surface which is the intersection of T1 and T2
X := ProjectiveClosure(S);
XSing := SingularSubscheme(X); // 1-dimensional singular locus 

// point search up to height bound 
// [P : P in PointSearch(X,5*10^3) | ((P[1] ne 0) and (P[2] ne 0)) and (P[1] ne P[2])];