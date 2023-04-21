function [r, c, l] = rcl()
%rcl Summary of this function goes here
%   function that calculates the rcl parameters of the transmission line
resistivity = input('Conductor resistivity (in SI units): ');
while resistivity <= 0
    clc;
    fprintf('****Invalid Input****\n');
    resistivity = input('Conductor resistivity (in SI units): ');
end
length = input('Please enter the length in meters: ');
while length <= 0
    clc;
    fprintf('****Invalid Input****\n');
    length = input('Conductor length (in meters): ');
end
diameter = input('Conductor diameter (in centimeters): ');
while diameter <= 0
    clc;
    fprintf('****Invalid Input****\n');
    diameter = input('Conductor diameter (in centimeters): ');
end

type = input('Line spacing: \n1-Symetrical system\n2-Unsymetrical system\n');


r = resistance(diameter, length, resistivit);
c = capacitance(diameter, length, type);
l = inductance(diameter, length, type);
end