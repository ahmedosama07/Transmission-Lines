function Cap = capacitance(diameter, length, type)
%capacitance Summary of this function goes here
%   function that calculates the capacitance of the transmission line
radius = (diameter / 2) * 10^(-2);
switch type
    case 1
        GMD = input('Please enter the seperation distance in meters: ');
    case 2
        d1 = input('Distance between a and b (in meters): ');
        d2 = input('Distance between b and c (in meters): ');
        d3 = input('Distance between a and c (in meters): ');
        dis = d1 * d2 * d3;
        GMD = nthroot(dis, 3);
end
Cap = (( 2 * pi * 8.85 * 10 ^(-6))/(log(GMD/radius))) * length;
end

