/*******************************************************************************
* DANTZIG PROBLEM (Model)
*
* Suppose we need to assign W employees to J different jobs.
* Employee skills are not all the same, so you want to choose the assignment
* that maximizes the overall success of the jobs.
* Clearly, every employee must be assigned to a job, and each job should be
* assigned to an employee.
*******************************************************************************/

reset;

param W > 0 integer;    # workers
param J > 0 integer;    # jobs
param C {1..W, 1..J};   # capacities of worker w to execute job j

var x {1..W, 1..J} binary;	# assignments of worker w to job j

maximize utility: # utility of assignments
    sum {i in 1..W, j in 1..J} C[i,j]*x[i,j];

subject to unicity_job_worker {i in 1..W}: # one job each worker
    sum {j in 1..J} x[i,j] = 1;
subject to unicity_worker_job {j in 1..J}: # one worker each job
    sum {i in 1..W} x[i,j] = 1;
