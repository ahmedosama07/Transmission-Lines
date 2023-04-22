function R = resistance(diameter, length)
%resistance Summary of this function goes here
%   function that calculates the resistance of the transmission line
radius = (diameter / 2) * 10^(-2);          % convert radius to meters
resistivity = input('Conductor resistivity (in SI units): ');
while resistivity <= 0
    clc;
    fprintf('****Invalid Input****\n');
    resistivity = input('Conductor resistivity (in SI units): ');
end
area = pi * radius^2 ;                      % conductor cross-section area
R = resistivity * (length* 10^(-3))/area;   % conductor resistance
end