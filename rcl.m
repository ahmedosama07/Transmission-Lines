function [r, c, l] = rcl(length, diameter, resistivity, GMD)
%rcl Summary of this function goes here
%   function that calculates the rcl parameters of the transmission line

r = resistance(diameter, length, resistivity);           % line resistance
c = capacitance(diameter, length, GMD);     % line capacitance
l = inductance(diameter, length, GMD);      % line inductance
end