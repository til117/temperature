%% Room model (without any controller - just the heat flows)

clc; close all; clear all;

C_R   = 100000;   % [J/kgK] Heat capacity
t_a = 0;        % [°C] Temperature, ambient
K   = 100;      % [W/°C] Coeff. of heat loss
Q_H = 1500;     % [W] Radiator heat
t_init  = 5;    % [°C] Initial value

tau_F = 2*3600;   % [s] Time for free heat input
Q_F_ON = 1000;     % [W] Heat inputz

tau_sim   = 6*3600;   % [s] Simulation time

sim('house_without_controller_sim',tau_sim)

figure('Name','Without controller','NumberTitle','off')
subplot(2,1,1)
h1=plot(tau/3600,t_R,'k-');
%set(h1,'linewidth',2)
grid
ylabel('t_R [°C]')
title('Room temperature')
ylim([0 30])
subplot(2,1,2)
h1=plot(tau/3600,Q_L,'r-',tau/3600,Q_F,'b-');
legend('Q_L','Q_F','location','northwest')
%set(h1,'linewidth',2)
grid
xlabel('tau [h]')
ylabel('Q [W]')
ylim([-20 3000])
title('Heat flow')


%% Room model - with ON-OFF controller

% Here the model above without controller is included as a subsystem 
% named "Room Model" in Simulink 

clc; close all; clear all;

C_R   = 100000;   % [J/kgK] Heat capacity
t_a = 0;        % [°C] Temperature, ambient
K   = 100;      % [W/°C] Coeff. of heat loss
Q_H = 1500;     % [W] Radiator heat
t_init  = 5;    % [°C] Initial value

tau_F = 2*3600;   % [s] Time for free heat input
Q_F_ON = 1000;     % [W] Heat inputz

H  = 2;         % [K] Hysteresis
tau_s = 60;     % [s] Time constant, sensor
t_R_set = 20;   % [°C] Set point for room temperature


tau_sim   = 6*3600;   % [s] Simulation time

sim('house_with_onoff_sim',tau_sim)

figure('Name','With On-Off controller','NumberTitle','off')
subplot(2,1,1)
h1=plot(tau/3600,t_R,'k-');
%set(h1,'linewidth',2)
grid
ylabel('t_R [°C]')
title('Room temperature')
ylim([0 30])
subplot(2,1,2)
h1=plot(tau/3600,Q_L,'r-',tau/3600,Q_F,'b-',tau/3600,Q_H_onoff,'k-');
legend('Q_L','Q_F','Q_H','location','northwest')
%set(h1,'linewidth',2)
grid
xlabel('tau [h]')
ylabel('Q [W]')
ylim([-20 3000])
title('Heat flow')


%% Room model - with PID controller

% Here the model above without controller is included as a subsystem 
% named "Room Model" in Simulink 

clc; close all; clear all;

C_R   = 100000;   % [J/kgK] Heat capacity
t_a = 0;        % [°C] Temperature, ambient
K   = 100;      % [W/°C] Coeff. of heat loss
Q_H = 1500;     % [W] Radiator heat
t_init  = 5;    % [°C] Initial value

tau_F = 2*3600;   % [s] Time for free heat input
Q_F_ON = 1000;     % [W] Heat input

tau_s = 60;     % [s] Time constant, sensor
t_R_set = 20;   % [°C] Set point for room temperature


tau_sim   = 6*3600;   % [s] Simulation time

sim('house_with_pid',tau_sim)

figure('Name','With PID controller','NumberTitle','off')
subplot(2,1,1)
h1=plot(tau/3600,t_R,'k-');
%set(h1,'linewidth',2)
grid
ylabel('t_R [°C]')
title('Room temperature')
ylim([0 30])
subplot(2,1,2)
h1=plot(tau/3600,Q_L,'r-',tau/3600,Q_F,'b-',tau/3600,Q_H_onoff,'k-');
legend('Q_L','Q_F','Q_H','location','northwest')
%set(h1,'linewidth',2)
grid
xlabel('tau [h]')
ylabel('Q [W]')
ylim([-20 3000])
title('Heat flow')

