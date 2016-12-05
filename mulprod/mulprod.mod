#===============================================================================
# MULTI-PERIOD PRODUCTION PROBLEM (Model)
#
# Define the production plan for a set of product during periods.
# Each product is characterized by: a demand for any given period (unit), the
# time necessary to produce a unit on production line (hour/unit), the material
# cost (euro/unit), the working cost (euro/hour) and a storage cost (euro/unit).
# The production line has a limit on working time for each product (hour).
# Determine, the production plan for each period, so to minimize the total cost.
#===============================================================================
reset;

#===============================================================================
# PARAMETERS
#===============================================================================
set P;                # products
param T >= 1;         # periods
param D{P,1..T} >= 0; # demand of product in period (unit)
param L{1..T} >= 0;   # production limit for production line (hour)
param W{P} >= 0;      # production time for product (hour/unit)
param CM{P} >= 0;     # material cost for product (euro/unit)
param CW >=0;         # working cost (euro/hour)
param CS >= 0;        # storage cost (euro/unit/period)

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var x{P,1..T} >= 0 integer;   # units of product produced in period (unit)
var y{P,0..T} >= 0 integer;   # units of product stored in period (unit)

#===============================================================================
# OBJECTIVE
#===============================================================================
minimize cost: # total cost
  + sum{p in P, t in 1..T} CM[p]*x[p,t]
  + sum{p in P, t in 1..T} CW*W[p]*x[p,t]
  + sum{p in P, t in 1..T} CS*y[p,t];

#===============================================================================
# BOUNDS
#===============================================================================
subject to prodline {t in 1..T}:  # production line limit
  sum{p in P} W[p]*x[p,t] <= L[t];

subject to storage_first {p in P}: # storage (first period)
  y[p,0] = 0;

subject to storage_last {p in P}: # storage (last period)
  y[p,T] = 0;

subject to demand {p in P, t in 1..T}: # demand and storage limit
  x[p,t]+y[p,t-1] = D[p,t]+y[p,t];
