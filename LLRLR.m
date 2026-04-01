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

// we now hard-code back in the *projective* curve that arises from 
// z^4R(z) = 0 with R being gyLRLR above and z=1/y. 

P<c,d,z> := ProjectiveSpace(Rationals(),2);

z_poly := (1024*c^7*d^10 + 1280*c^8*d^9 - 256*c^9*d^8 - 256*c^10*d^7 + 256*c^11*d^6)
		+ (1536*c^7*d^9 + 1024*c^8*d^8 - 512*c^9*d^7)*z 
		+ (-512*c^5*d^10 + 768*c^6*d^9 + 2176*c^7*d^8 + 448*c^8*d^7 - 288*c^9*d^6 
			+ 160*c^10*d^5 + 32*c^11*d^4 + 32*c^12*d^3)*z^2 
		+ (-512*c^5*d^9 + 128*c^6*d^8 + 576*c^7*d^7 + 864*c^8*d^6 - 112*c^9*d^5 
			+ 16*c^11*d^3)*z^3 
		+ (64*c^3*d^10 - 288*c^4*d^9 - 64*c^5*d^8 + 240*c^6*d^7 + 144*c^7*d^6 
			+ 264*c^8*d^5 - 152*c^9*d^4 + 41*c^10*d^3 + 11*c^11*d^2 + 3*c^12*d 
			+ c^13)*z^4 
		+ (-96*c^3*d^9 + 48*c^4*d^8 - 496*c^5*d^7 - 32*c^6*d^6 + 160*c^7*d^5 
			+ 56*c^8*d^4 + 112*c^9*d^3 + 9*c^10*d^2 + 2*c^11*d + c^12)*z^5 
		+ (32*c^2*d^9 - 136*c^3*d^8 - 128*c^4*d^7 + 234*c^5*d^6 + 208*c^6*d^5 - 
			146*c^7*d^4 - 30*c^8*d^3 - 14*c^9*d^2 + c^10*d + c^11)*z^6 
		+ (16*c*d^9 - 16*c^2*d^8 + 40*c^3*d^7 - 112*c^4*d^6 + 210*c^5*d^5 
			- 192*c^6*d^4 + 30*c^7*d^3 + 8*c^8*d^2 + 2*c^9*d + c^10)*z^7 
		+ (d^9 + 9*c*d^8 + 96*c^2*d^7 + 38*c^3*d^6 + 12*c^4*d^5 + 55*c^5*d^4 
			+ 104*c^6*d^3 + 7*c^7*d^2 + c^8*d + c^9)*z^8 
		+ (d^8 + 10*c*d^7 + 56*c^2*d^6 + 190*c^3*d^5 - 76*c^4*d^4 - 59*c^5*d^3 
			- 25*c^6*d^2 + c^8)*z^9 
		+ (d^7 - 6*c*d^6 + 91*c^2*d^5 - 7*c^3*d^4 + 37*c^4*d^3 
			+ 21*c^5*d^2 + 7*c^6*d + c^7)*z^(10);

// z_poly defines a projective curve X of geometric genus 2 over the rationals,
// which is then birational to a hyperelliptic curve Y over the rationals. 
// We compute an explicit birational map from X to Y here. 
X := Curve(P,z_poly); 

// We see that X has no non-singular points up to the height noted here 
PointSearch(X,10000000);

// We find that X is not birational to a hyperelliptic curve using the following command
	// bool, Y, B := IsHyperelliptic(X);

// The following computes a canonical map B from X to the 
// projective space \P^10 over \Q. This runs within a few hours.
B := CanonicalMap(X);

// Computing the image of B as in the commented line below, though, 
// seems to be too computationally taxing;
// perhaps it is possible with more time on a better machine, but with
// at least 6 hours of computation and significant memory use we have
// not been able to complete the computation.
	// Y := Image(B);
