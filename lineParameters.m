function [A, B, C, D] = lineParameters(length, R, Cap, L)
%lineParameters Summary of this function goes here
%   function that calculates ABCD parameters of the transmission line

length = length * 10^(-3);          % convert length to kilo meters
XL = 2 * pi * 50 * L;               % inductive reactance
YC = 2 * pi * 50 * C * 10^(-6);     % capacitive admittance
Z = complex(R, XL);                 % total complex impedance
Y = complex(0, YC);                 % total complex admittance

if length < 80
    [A, B, C, D] = shortLine(Z);
elseif (length >= 80) && (length <= 250)
    [A, B, C, D] = midiumLine(Z, Y);
else
    [A, B, C, D] = longLine(Z, Y);
end

end

