/*******************************************************************************
* POLYGON PROBLEM (Model)
*
* Given N vertices, determine their position sot ot maximize the area of the
* built polygon .
*******************************************************************************/

reset;

param pi := 3.141592;
param N integer > 2;

var r {i in 1..N};
var a {i in 1..N};

maximize area:
  0.5*sum{i in 1..N-1} (r[i+1]*r[i]*sin(a[i+1]-a[i]));
subject to bound_radius {i in 1..N}:
  0.0 <= r[i] <= 1.0;
subject to bound_angle {i in 1..N}:
  0.0 <= a[i] <= pi;
subject to bound_radius_extreme:
  r[N] = 0.0;
subject to bound_angle_extreme:
  a[N] = pi;
subject to bound_angle_order {i in 1..N-1}:
  a[i] <= a[i+1];
subject to bound_diameter {i in 1..N, j in i+1..N}:
  r[i]^2+r[j]^2-2*r[i]*r[j]*cos(a[j]-a[i]) <= 1.0;
