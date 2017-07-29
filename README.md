# AMPLITUDE

*A collection of notable optimization problems solved with AMPL*


* **dantzig** we need to assign W employees to J different jobs.
Employee skills are not all the same, so you want to choose the assignment
that maximizes the overall success of the jobs.
Clearly, every employee must be assigned to a job, and each job should be
assigned to an employee.

* **mulprod** define the production plan for a set of product during periods.
Each product is characterized by: a demand for any given period (unit), the
time necessary to produce a unit on production line (hour/unit), the material
cost (euro/unit), the working cost (euro/hour) and a storage cost (euro/unit).
The production line has a limit on working time for each product (hour).
Determine, the production plan for each period, so to minimize the total cost.

* **polygon** let us consider N vertices in the goniometric circumference with positive Y.
One vertex must be in (0,0).
Determine the vertices position so to maximize the area of the built polygon.

* **production** a company produces products P.
Each product is sold at price Pprice.
Each product needs a work of Pwork hours at price Wprice euros/hour.
A product needs an amount of Pm kg of prime materials M.
Each prime material costs Mprice euro/kg.
The company can acquire Mmax kg of prime material, monthly.
Determine the monthly production plan of products, so to maximize the
monthly profit.

* **refinery** a company must locate a refinery.
The refinery must be connected by pipes to a set of harbors.
Given a specific harbor, the refinery cannot be locate south of it and must
be radius Km far away from it.
Determine the refinery position, so to minimize pipes length.

* **tank** a chemical industry intends to use the residual sheet metal, building a tank
to be used for storage of a liquid product.
The sheet can be cut and welded at will, it is available for a total of
150m^2 and is to be used throughout. The tank must be in a square hall,
with the side of 10m, and the height sloping roof of 4.5m to 3m.
For sake of simplicity, it is assumed that the tank has the shape of a prism
with a square base.
We determine the size of the tank, so as to maximize the volume of liquid
that can be contained there.

* **trash** optimize the acquiring of recyclable trash materials, taking into account the
cost of trash materials, the selling price of extractable resources and the
percentage of extractable resources.

* **yield management** a train passes through a given sequence of stations.
The train is characterized by a limited amount of places.
Each route is characterized by a given tickets demand.
Each ticket is sold at a given price.
Determine the ticket emission for each route, so to maximize the profit.


## Authors
Giacomo Marciani, [gmarciani@ieee.org](mailto:gmarciani@acm.org)


## References
*Metodi di ottimizzazione non vincolata*. Springer Science & Business Media. Grippo, L. and Sciandrone, M., 2011.


## License
The project is released under the [MIT License](https://opensource.org/licenses/MIT).
