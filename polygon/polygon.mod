#===============================================================================
# POLYGON PROBLEM (Model)
#
# Let us consider N vertices in the goniometric circumference with positive Y.
# One vertex must be in (0,0).
# Determine the vertices position so to maximize the area of the built polygon.
#===============================================================================
reset;

#===============================================================================
# PARAMETERS
#===============================================================================
param pi := 3.141592; # greek pi
param N integer > 2;  # number of vertices

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var r {i in 1..N};    # vertices radius
var a {i in 1..N};    # vertices angle

#===============================================================================
# OBJECTIVE
#===============================================================================
maximize area:        # polygon area
  0.5*sum{i in 1..N-1} (r[i+1]*r[i]*sin(a[i+1]-a[i]));

#===============================================================================
# BOUNDS
#===============================================================================
subject to bound_radius {i in 1..N}: # radius for Y-positive plain
  0.0 <= r[i] <= 1.0;

subject to bound_angle {i in 1..N}:  # angles for Y-positive plain
  0.0 <= a[i] <= pi;

subject to bound_radius_extreme:    # radius for the vertex in (0,0)
  r[N] = 0.0;

subject to bound_angle_extreme:     # angle for the vertex in (0,0)
  a[N] = pi;

subject to bound_angle_order {i in 1..N-1}: # vertex angle sorted
  a[i] <= a[i+1];

subject to bound_diameter {i in 1..N, j in i+1..N}: # vertex on goniometric circumference
  r[i]^2+r[j]^2-2*r[i]*r[j]*cos(a[j]-a[i]) <= 1.0;
