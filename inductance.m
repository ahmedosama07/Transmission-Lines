function L = inductance(diameter, length, type)
%inductance Summary of this function goes here
%   function that calculates the inductance of the transmission line
radius = (diameter / 2) * 10^(-2);
GMR = radius * exp(-0.25);
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
L = (2 * 10^(-7) * log(GMD/GMR)) * length;
end