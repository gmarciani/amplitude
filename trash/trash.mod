/*******************************************************************************
 * TRASH PROBLEM (Model)
 *
* A company must locate a refinery.
* The refinery must be connected by pipes to a set of habors.
* Given a specific harbor, the refinery cannot be locate south of it and must
* be radius Km far away from it.
* Determine the refinery position, so to minimize pipes lenght.
/******************************************************************************/

reset;

set T;                          # trashes
set M;                          # materials
param TCost{T} >= 0;            # trash cost (euros/ton)
param TMax{T} >= 0;             # trashes maximum amount (tons/trash)
param EPerc{M,T} >= 0, <= 100;  # percentage of material extractable from trash
param ECost{M,T} >= 0;          # material extraction costs (euros/ton)
param MPrice{M} >= 0;           # material profit (euros/ton)
param ResCost >= 0;             # cost for residual trash (euros/ton)

var x{T} >= 0;                  # acquired trash

maximize profit:                # total profit
    + sum{m in M, t in T} (MPrice[m]*EPerc[m,t]*x[t])
    - sum{m in M, t in T} (ECost[m,t]*EPerc[m,t]*x[t])
    - sum{m in M, t in T} (ResCost*(100-EPerc[m,t])*x[t])
    - sum{t in T} (TCost[t]*x[t]);

subject to bound_maxamount{t in T}:     # maximum amount of trash
    x[t] <= TMax[t];
