# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
# The Tank Problem
# Model
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

param sheet;
param side;
param hmin;
param hmax;

var x1 >= 0, <= side; 	# tank width
var x2 >= 0; 		    # tank height

maximize volume: (x1^2)*x2;
subject to sheet_bound: x1^2+4*x1*x2=sheet;
subject to height_bound: x2<=(side-x1)*(hmax-hmin)/side+hmin;
