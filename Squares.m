/////////////////////////////////////////////
// 1) Define the function field and rings //
/////////////////////////////////////////////

// Define a function field in parameters c and d.
K<c> := FunctionField(Rationals());
K<d> := FunctionField(K);

// Define a polynomial ring in y over K.
P<x> := PolynomialRing(K);

//////////////////////////////////////////////////////////
// 2) Define the original quartic polynomial f(y)       //
//    with coefficients based on your given expression. //
//////////////////////////////////////////////////////////

// Coefficients for f(y)
A_   := 16*c^2 * d^3 * (d - c)^2;
B_   := 8*c * d^2 * (d + c) * (d - c)^2;
C_   := (d^4+6*c*d^3+12*c^2*d^2-2*c^3*d-c^4) * (d - c);
D_ := (d^3 + 7*c*d^2 - 3*c^2*d - c^3)*(d - c);
E_   := (d^3 - 2*c*d^2 + 5*c^2*d + c^3);

// Construct the quartic polynomial f(y)
f := A_*x^4 + B_*x^3 + C_*x^2 + D_*x + E_;

// print "Original quartic f(y):";
// print f;

//////////////////////////////////////////////////////
// 3) Normalize by dividing f(y) by the leading coeff //
//////////////////////////////////////////////////////

// Divide by A_ to get a monic polynomial.
f1 := f / A_;


//////////////////////////////////////////////////////
// 4) Define coefficients of the associated depressed 
// quartic (no cubic term)
//////////////////////////////////////////////////////

a := (-3*B_^2)/(8*A_^2) + (C_/A_);
b := (B_^3)/(8*A_^3) - (B_*C_)/(2*A_^2) + (D_/A_);
c_ := -3*(B_)^4/(256*A_^4) + C_*(B_)^2/(16*A_^3) - (B_*D_)/(4*A_^2) + E_/A_;


// rational numbers relevant in solving associated cubic

p := -a^2/12-c_;
q := -a^3/108 + a*c_/3 - b^2/8;
r_pq := (q^2/4 + p^3/27);


// root of f1 is value of square root appearing in solution to the cubic

f1 := x^2 - (q^2/4 + p^3/27);

L<alpha> := ext< K | f1 >;
P<x> := PolynomialRing(L);


// root of f2 is value of cubed root appearing in solution to the cubic

f2:= x^3 + q/2 - alpha; 

f2Fac := Factorization(f2); // factors as product of linear and quadratic in y

// taking w to be root of the linear factor 
w := -1*(-3072*c^4*d^8 + 6144*c^5*d^7 - 3072*c^6*d^6)/(d^8 - 12*c*d^7 +
        84*c^2*d^6 - 340*c^3*d^5 + 374*c^4*d^4 - 132*c^5*d^3 - 44*c^6*d^2 +
        4*c^7*d + c^8)*alpha + (-1/96/c^2*d^4 + 1/16/c*d^3 - 1/4*d^2 +
        1/48*c*d + 1/96*c^2)/(d^4 - c*d^3); // w2 has a linear factor in y, and this is the corresponding root

// taking w to instead be a root of the quadratic factor (see quadratic root file for this path)
// L<w> := ext< L | f2Fac[2][1] >;

// solution to the associated cubic 
y := a/6 + w - p/(3*w);


A<n,z> := AffineSpace(L,2); 

// The expression (2alpha - b2) in notation of paper, which we will use
// to express  the first needed assumption of an expression being a rational square. 
square_term_1 := 2*y-a; 

// The expression (z*(n^2+2alpha+b2)-2b1) in the notation of the paper, expressing the
// second needed assumption of an expression being a rational square. 
square_term_2 := z*(n^2+2*y+a)-2*b;

// numerators of square_term_1 and square_term_2 scaled by nonzero rationals (for each specialization), 
// with the former scaled by a square (as we will investigate rational points of M = z^2). 
M := square_term_1*16*9*c^2*d^4*(d-c)^2; 
N := square_term_2*d^4*(d-c)*3*32*c^2;

// S: {z^2 = M, N=0} defines a surface in A^4 in variables c, d, n, z. 
// We consider this surface in SquaresSurface.m

