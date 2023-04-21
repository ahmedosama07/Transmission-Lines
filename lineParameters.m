function [A, B, C, D] = lineParameters(length, R, C, L)
%lineParameters Summary of this function goes here
%   function that calculates ABCD parameters of the transmission line

length = length * 10^(-3);
XL = 2 * pi * 50 * L;
YC = 2 * pi * 50 * C * 10^(-6);
Z = complex(R, XL);
Y = complex(0, YC);
if length < 80
    % TODO short
    [A, B, C, D] = shortLine(Z);
elseif (length >= 80) && (length <= 250)
    % TODO mid
    [A, B, C, D] = midiumLine(Z, Y);
else
    % TODO long
    [A, B, C, D] = longLine(Z, Y);
end

end

