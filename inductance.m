function L = inductance(diameter, length, GMD)
%inductance Summary of this function goes here
%   function that calculates the inductance of the transmission line
radius = (diameter / 2) * 10^(-2);                  % radius in meters
GMR = radius * exp(-0.25);                          % gemetric mean radius
L = (2 * 10^(-7) * log(GMD/GMR))*(length* 10^(3)); % conductor inductance
end