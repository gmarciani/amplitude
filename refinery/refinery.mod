#===============================================================================
# REFINERY PROBLEM (Model)
#
# A company must locate a refinery.
# The refinery must be connected by pipes to a set of habors.
# Given a specific harbor, the refinery cannot be locate south of it and must
# be radius Km far away from it.
# Determine the refinery position, so to minimize pipes lenght.
#===============================================================================
reset;

#===============================================================================
# PARAMETERS
#===============================================================================
set H;                  # harbors
param xpos{H};          # harbors X coordinates
param ypos{H};          # harbors Y coordinates
param h symbolic in H;  # a specific harbor
param r;                # radius

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var x;                  # refinery X coordinate
var y;                  # refinery Y coordinate

#===============================================================================
# OBJECTIVE
#===============================================================================
minimize pipes:         # pipes lenght
    sum {i in H} sqrt((x-xpos[i])^2 + (y-ypos[i])^2);

#===============================================================================
# BOUNDS
#===============================================================================
subject to bound_mindistance:   # minimum distance from the harbor h
    (x-xpos[h])^2+(y-ypos[h])^2 >= r^2;
subject to bound_nosud:         # refinery cannot be south of harbor h
    y >= ypos[h];
