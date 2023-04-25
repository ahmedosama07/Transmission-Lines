function [A, B, C, D] = longLine(Z, Y)
%longLine Summary of this function goes here
%   function that calculates ABCD parameters of long transmission line
%   parameters are set to NaN since they cannot be calculated as the other
%   two cases
fprintf("Cannot measure ABCD parameters.\n");
fprintf("*The distributed nature of the parameters is considered.\n");
fprintf("*The resistance, inductance, and capacitance of the line are not lumped.\n");

fprintf("Line impedance: %.3f ∠ %.3f° Ω", abs(Z), rad2deg(angle(Z)));
fprintf("Capacitive admitance: %.3f ∠ %.3f° ℧", abs(Y), rad2deg(angle(Y)));

[A, B, C, D] = struct('x', num2cell([NaN, NaN, NaN, NaN])).x;
end
