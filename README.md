# ReplacementDynamics
Magma code for the paper "Replacement dynamics of binary quadratic forms" by Raghav Bhutani and Frederick Saia ([arXiv:2508.05816](https://arxiv.org/abs/2508.05816)).

## Contents

- `LRLR.m`: Code for computing the scheme $Y_{(L,R,L,R)}$ over the function field $\mathbb{Q}(c,d)$ and its primary decomposition. This zero-dimensional scheme parameterizes periodic vectors of type $(L,R,L,R)$ for binary quadratic forms $f(x,y) = cx^2+dy^2$. We then provide code for all computations supporting the proof of Corollary 3.11.  

- `LLRLR.m`: Code for computing the scheme $Y_{(L,L,R,L,R)}$ over the function field $\mathbb{Q}(c,d)$ and its primary decomposition. This zero-dimensional scheme parameterizes periodic vectors of type $(L,L,R,L,R)$ for binary quadratic forms $f(x,y) = cx^2+dy^2$. We then provide code for all computations supporting the proof of Conjecture 3.14.  

- `Yt_Nlt5`: Constructing dynamical modular curves $Y_{t,L}$ and $Y_{t,R}$ for a representative $t$ of each binary type class of period up to $5$. 
