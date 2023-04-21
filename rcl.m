function [r, c, l] = rcl(length, diameter)
%rcl Summary of this function goes here
%   function that calculates the rcl parameters of the transmission line

type = input('Line spacing: \n1-Symetrical system\n2-Unsymetrical system\n');

r = resistance(diameter, length);
c = capacitance(diameter, length, type);
l = inductance(diameter, length, type);
end