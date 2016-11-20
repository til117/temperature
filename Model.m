clear all; close all; clc;

%Initial cases
To = 5; % [°C] the outside temperature (constant)
%Case 1
dTr1 = 0; % [°C/h] assume constant room temperature
Tr1 = 25; % [°C] same with our set point
w1 = 500; % [W] the heater's effect to maintain balance
Th1 = 60; % [°C] the heater's temperature in equilibrium
dTh1 = 0; % [°C/h] the heater has constant temperature
%Case 2
dTr2 = 10; % [°C/h] assume the temperature increases to set point
Tr2 = 15; % [°C] colder than the desired temperature
w2 = 1000; % [W] the heater works on max
Th2 = 80; % [°C] the heater's max temperature
dTh2 = 40; % [°C/h] the heater produces more heat to warm the room

%Estimate constants
A = [Th1-Tr1 -(Tr1-To);Th2-Tr2 -(Tr2-To)];
B = [dTr1;dTr2];
c = A\B;
a1 = c(1); a2 = c(2); % the constants are positive
C = [-(Th1-Tr1) w1;-(Th2-Tr2) w2];
D = [dTh1;dTh2];
d = C\D;
a3 = d(1); a4 = d(2); % the constants are positive

%Transfer function
s = tf('s');
G = (a1*a4)/(s^2+(a1+a2+a3)*s+(a2*a3))






