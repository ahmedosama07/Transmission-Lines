function R = resistance(diameter, length, resistivity)
%resistance Summary of this function goes here
%   function that calculates the resistance of the transmission line
radius = (diameter / 2) * 10^(-2);
area = pi * radius^2 ;
R = resistivity * length/area;
end