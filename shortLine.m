function [A, B, C, D] = shortLine(Z)
%shortLine Summary of this function goes here
%   Detailed explanation goes here
[A, B, C, D] = struct('x', num2cell([1,Z,0,1])).x;
end

