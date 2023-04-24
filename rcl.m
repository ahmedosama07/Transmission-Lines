function [r, c, l] = rcl(length, diameter)
%rcl Summary of this function goes here
%   function that calculates the rcl parameters of the transmission line

type = input('Line spacing: \n1-Symetrical system\n2-Unsymetrical system\n');

switch type
    case 1
        GMD = input('Seperation distance (in meters): ');
    case 2
        d1 = input('Distance between a and b (in meters): ');
        d2 = input('Distance between b and c (in meters): ');
        d3 = input('Distance between a and c (in meters): ');
        dis = d1 * d2 * d3;
        GMD = nthroot(dis, 3);
end
r = resistance(diameter, length);           % line resistance
c = capacitance(diameter, length, GMD);     % line capacitance
l = inductance(diameter, length, GMD);      % line inductance
end