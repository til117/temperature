% ROOMSIM_DATA
% Thermodynamic model of Kirilenko's room for the "roomsim" simulation.

% convert rad to degrees
r2d = 180/pi;

% ---------------
% Room geometry
% ---------------
%length = 3.10 m
lenHouse = 3.10;
%width = 2.40 m
widHouse = 2.40;
%height = 2.35 m
htHouse = 2.35;
%roof pitch = 40 deg
pitRoof = 40/r2d;
%number of windows = 2
numWindows = 2;
%height of windows = 1.20 m
htWindows = 1.20;
% Width of windows = 1 m
widWindows = 1;
windowArea = numWindows*htWindows*widWindows;
wallArea = 2*lenHouse*htHouse + 2*widHouse*htHouse + ...
           2*(1/cos(pitRoof/2))*widHouse*lenHouse + ...
           tan(pitRoof)*widHouse - windowArea;
       
% -------------------------------
% Insulation materials
% -------------------------------
%walls: glass wool 0.2 m thick
%k is J/sec/m/C - convert to J/hr/m/C mult by 3600
kWall = 0.038*3600;   % time in h
LWall = .2;
RWall = LWall/(kWall*wallArea);
%windows: glass 0.01 m thick
kWindow = 0.78*3600;  % time in h
LWindow = .01;
RWindow = LWindow/(kWindow*windowArea);

% -------------------------------
% Equivalent thermal resistance for the whole room
% -------------------------------
Req = RWall*RWindow/(RWall + RWindow);
% c = cp of air (273 K) = 1005.4 J/kg-K
c = 1005.4;

% -------------------------------
% Temperature of heated air
% -------------------------------
%the air exiting the heater has a constant temperature (the one we set on
%as max output for the relay to control: THeater = 50 deg C
THeater = 50;
%air flow rate: Mdot = 1 kg/sec = 3600 kg/h
Mdot = 3600;  % time in h

% -------------------------------
% Total internal air mass = M
% -------------------------------
%density of air at sea level = 1.2250 kg/m^3
densAir = 1.2250;
M = (lenHouse*widHouse*htHouse+tan(pitRoof)*widHouse*lenHouse)*densAir;

% -------------------------------
% Cost of electricity + initial internal temperature
% -------------------------------
%assume the cost of electricity is 0.6 kr/kWh 
%assume all electric energy is transformed to heat energy
%1 kWh = 3.6e6 J
%cost = 0.6 kr per 3.6e6 J
cost = 0.6/3.6e6;

% -------------------------------
% Initial indoor temperature
% -------------------------------
%initial temperature inside: TinIC = 20 deg C
TinIC = 20;
