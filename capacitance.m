function C = capacitance(diameter, length, GMD)
%capacitance Summary of this function goes here
%   function that calculates the capacitance of the transmission line
radius = (diameter / 2) * 10^(-2);                       % radius in meters
C = ((2*pi*8.85*10^(-6))/(log(GMD/radius)))*(length* 10^(-3));% capacitance
end

