function R = resistance(diameter, length, resistivity)
%resistance Summary of this function goes here
%   function that calculates the resistance of the transmission line
radius = (diameter / 2) * 10^(-2);          % convert radius to meters
area = pi * radius^2 ;                      % conductor cross-section area
R = 1.11 * resistivity * (length* 10^(3))/area;   % conductor resistance
end