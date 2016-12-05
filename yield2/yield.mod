#===============================================================================
# YIELD MANAGEMENT PROBLEM (Model) 2nd version
#
# A train passes through a given sequence of stations.
# The train is characterized by a limited amount of places.
# Each route is characterized by a given tickets demand.
# Each ticket is sold at a given price.
# Determine the ticket emission for each route, so to maximize the profit.
#===============================================================================
reset;

#===============================================================================
# PARAMETERS
#===============================================================================
set S ordered;        # stations
set R within {S,S};   # routes
param P {R} >= 0;     # routes price
param D {R} >= 0;     # routes demand
param C integer >= 0; # train capacity

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var x {(i,j) in R} >= 0, <= D[i,j] integer;	# tickets

#===============================================================================
# OBJECTIVE
#===============================================================================
maximize profit: # profit
  sum {(i,j) in R} P[i,j]*x[i,j];

#===============================================================================
# BOUNDS
#===============================================================================
subject to capacity # tickets not exceeding train capacity
{(i,j) in R}:
  + sum{(i,l) in R} x[i,l]
  + sum{(k,l) in R: ord(k,S)<ord(i,S) && ord(l,S)>=ord(j,S)} x[k,l]
  <= C;
