param n; # Number of Nodes
param p; # Number of Centers
set I := {1..n};  #set of demands
set J := {1..n};  #set of filiaties

# Cordinates
param XX {I}; # X Cordinate
param YY {I}; # Y Cordinate

# Decision Variables
var X{J} >= 0 binary;
var Y{I,J} >= 0 binary;
var Q >= 0;

minimize z: Q;

s.t. Constraint1 {i in I}		  :	sum {j in J} Y[i,j] = 1;												# Each Demand Nodes Must Connect To Exactly 1 Faciliator
s.t. Constraint2 {i in I, j in J} : Y[i,j] <= X[j];															# Limitation
s.t. Constraint3		 		  : sum {j in J} X[j] = p;													# Exactly p Centers
s.t. Constraint4 {i in I}		  : sum {j in J} sqrt( (XX[i]-XX[j])^2 + (YY[i]-YY[j])^2) * Y[i,j] <= Q;	# Minimize distance