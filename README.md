# ReplacementDynamics
Magma code for the paper "Replacement dynamics of binary quadratic forms" by Raghav Bhutani and Frederick Saia.

## Contents

- `LRLR.m`: Code for computing the scheme $Y_{(L,R,L,R)}$ over the function field $\mathbb{Q}(c,d)$ and its primary decomposition. This zero-dimensional scheme parameterizes periodic vectors of type $(L,R,L,R)$ for binary quadratic forms $f(x,y) = cx^2+dy^2$. 

- `LLRLR.m`: Code for computing the scheme $Y_{(L,L,R,L,R)}$ over the function field $\mathbb{Q}(c,d)$ and its primary decomposition. This zero-dimensional scheme parameterizes periodic vectors of type $(L,L,R,L,R)$ for binary quadratic forms $f(x,y) = cx^2+dy^2$.

- `SqrtEquality.m`: Code for investigating the first necessary condition we test, from the quartic formula, for the quartic polynomial $R_{c,d}$ over $\mathbb{Q}(c,d)$ to have a rational root.

- `SqrtEqualityCurve.m`: Constructing the curve in variables $c, d$, given by the equation computed in `SqrtEquality.m`, which would provide rational roots to $R_{c,d}$ if it had non-trivial rational points. We find that this curve has no rational points other than $(c,d) = (0,0)$. 

- `BiquadraticCheck.m`: Here we show there are no biquadratic specializations of the depressed quartic corresponding to the quartic polynomial $R_{c,d}(y)$ over $\mathbb{Q}(c,d)$.

- `Squares.m`: Code for investigating the second necessary condition we test, from the quartic formula, for the quartic polynomial $R_{c,d}$ over $\mathbb{Q}(c,d)$ to have a rational root.

- `SquaresSurface.m`: Constructing the surface in variables $c, d, n, z$, given by the equations computed in `Squares.m`, which would provide rational roots to $R_{c,d}$ if it had non-trivial rational points.

- `Yt_Nlt5`: Constructing dynamical modular curves $Y_{t,L}$ and $Y_{t,R}$ for a representative $t$ of each binary type class of period up to $5$. 
