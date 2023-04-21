function [A, B, C, D] = lineParameters(length, R, C, L)
%lineParameters Summary of this function goes here
%   function that calculates ABCD parameters of the transmission line

length = length * 10^(-3);
if length < 80
    % TODO short
elseif (length >= 80) && (length <= 250)
    % TODO mid
else
    % TODO long
end

end

