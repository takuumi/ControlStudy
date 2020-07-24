clear
format compact

g = 9.8; %9.80665 [m/s^2]
L = 0.3; %[m] 
m = 0.2; %[kg]

A = [0, 1; -g/L, 0];
B = [0; 1/m];
C = [1, 0];
D = 0;

Q = [1,0;
     0,0];
R = 1;

[K,S,P] = lqr(A,B,Q,R);
%sys1 = ss(A-B*K,B,C,D);
%step(sys1)

%open_system('simulate');