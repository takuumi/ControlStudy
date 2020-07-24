clear
format compact

state=[0;0];
bPID = true;

g = 9.8; %9.80665 [m/s^2]
L = 0.3; %[m] 
m = 0.2; %[kg]

A = [0, 1; -g/L, 0];
B = [0; 1/m];
C = [1, 0];
D = 0;

Q = [2,0;
     0,0.1];
R = 1;

[K,S,P] = lqr(A,B,Q,R);

open_system('simulate_pid');
sim('simulate_pid');

open_system('simulate_lqr');
sim('simulate_lqr');

