/*******************************************************************************
* TANK PROBLEM (Model)
*
* A chemical industry intends to use the residual sheet metal, building a tank
* to be used for storage of a liquid product.
* The sheet can be cut and welded at will, it is available for a total of
* 150m^2 and is to be used throughout. The tank must be in a square hall,
* with the side of 10m, and the height sloping roof of 4.5m to 3m.
* For sake of simplicity, it is assumed that the tank has the shape of a prism
* with a square base.
* We determine the size of the tank, so as to maximize the volume of liquid
* that can be contained there.
*******************************************************************************/

reset;

param SHEET >= 0;    # Sheet area (m^2)
param SIDE  >= 0;    # Room side (m)
param HMIN  >= 0;    # Room minimum height (m)
param HMAX  >= 0;    # Room maximum height (m)

var x1 >= 0, <= SIDE;   # tank width (m)
var x2 >= 0;            # tank height (m)

maximize volume: (x1^2)*x2; # Tank volume (m^3)

subject to sheet_area:  # Available sheet area (m^2)
    x1^2+4*x1*x2=SHEET;
subject to room_height: # Available room height (m)
    x2<=(SIDE-x1)*(HMAX-HMIN)/SIDE+HMIN;
