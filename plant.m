g = 9.8 %9.80665 [m/s^2]
L = 0.3 %[m] 
m = 0.2 %[kg]

A = [0, 1; -g/L, 0];
B = [0; 1/m];
C = [1, 0];

open_system('simulate');