#===============================================================================
# YIELD MANAGEMENT PROBLEM (Model)
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
set S ordered;  # stations
param P {i in S, j in S: ord(j,S) > ord(i,S)} >= 0;  # routes price
param D {i in S, j in S: ord(j,S) > ord(i,S)} >= 0;  # routes demand
param C integer >= 0; # train capacity

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var x {i in S, j in S: ord(j,S) > ord(i,S)} >=0, <= D[i,j] integer;	# tickets

#===============================================================================
# OBJECTIVE
#===============================================================================
maximize profit: # profit
  sum {i in S, j in S: ord(j,S) > ord(i,S)} P[i,j]*x[i,j];

#===============================================================================
# BOUNDS
#===============================================================================
subject to capacity # tickets not exceeding train capacity
{i in S}:
  + sum {j in S: ord(j,S) > ord(i,S)} x[i,j]
  + sum {k in S: ord(k,S) < ord(i,S)} sum{j in S: ord(j,S) > ord(i,S)} x[k,j]
  <= C;
