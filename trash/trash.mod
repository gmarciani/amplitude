#===============================================================================
# TRASH PROBLEM (Model)
#===============================================================================
reset;

#===============================================================================
# PARAMETERS
#===============================================================================
set T;                          # trashes
set M;                          # materials
param TCost{T} >= 0;            # trash cost (euro/ton)
param TMax{T} >= 0;             # trashes maximum amount (ton)
param EPerc{M,T} >= 0, <= 100;  # material extractable from trash (%)
param ECost{M,T} >= 0;          # material extraction costs (euro/ton)
param MPrice{M} >= 0;           # material profit (euro/ton)
param ResCost >= 0;             # cost for residual trash (euro/ton)

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var x{M,T} >= 0;                # material extracted from trash
var y{T} >= 0;                  # acquired trash

#===============================================================================
# OBJECTIVE
#===============================================================================
maximize profit:                # total profit
  + sum{m in M, t in T} (MPrice[m]*x[m,t])
  - sum{t in T} (TCost[t]*y[t])
  - sum{m in M, t in T} (ECost[m,t]*x[m,t])
  - ResCost*sum{t in T} (y[t] - sum{m in M} x[m,t]);

#===============================================================================
# BOUNDS
#===============================================================================
subject to trash {t in T}:       # max amount of trash
  y[t] <= TMax[t];

subject to extraction {m in M, t in T}:  # max amount of extracted material
  x[m,t] <= EPerc[m,t]*y[t];
