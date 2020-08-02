clear
format compact

state=[0;0];
bPID = true;

g = 9.8; %9.80665 [m/s^2]
L = 0.3; %[m] 
m = 0.2; %[kg]

A = [0, 1; g/L, 0];
B = [0; 1/(m * L^2)];
C = [1, 0];
D = 0;
sys = ss(A,B,C,D) 


%%%%%%%%%
%simlinkを使ったpidコントロール
open_system('simulate_pid');
sim_pid = sim('simulate_pid');
%Simulinkの結果の取り出し方
%sim_pid.simout_pid.signals.values


%simlinkの使い方確認
P_self = 55.7711555827577;
I_self = 331.638235598418;
D_self = 2.29826165386028;

%feedback関数にて
C_pid_self = pid(P_self, I_self, D_self);
T_pid_self = feedback(C_pid_self*sys, 1);
step(T_pid_self)

%伝達関数にて


%%%%%%%%%
%pidtuneを使ったコントローラ　https://jp.mathworks.com/help/control/ref/pidtune.html

% [C_pi,info] = pidtune(sys,'PI');
% T_pi = feedback(C_pi*sys, 1);
% step(T_pi)
% [C_pi_fast,info] = pidtune(sys,'PI',1.0)
% T_pi_fast = feedback(C_pi_fast*sys,1);
% step(T_pi,T_pi_fast)
% axis([0 5 0 1.4])
% legend('PI','PI,fast')
% [C_pidf_fast,info] = pidtune(sys,'PIDF',1.0)
% 
% T_pidf_fast =  feedback(C_pidf_fast*sys,1);
% step(T_pi_fast, T_pidf_fast);
% axis([0 5 0 1.4]);
% legend('PI,fast','PIDF,fast');

%%%%%%%%% 
Q = [2,0;
     0,0.1];
R = 1;
[K,S,P] = lqr(A,B,Q,R);

%open_system('simulate_lqr');
%sim_lqr = sim('simulate_lqr');
    
