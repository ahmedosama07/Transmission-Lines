function [outputArg1,outputArg2] = linePerformance(A, B, C, D)
%linePerformance Summary of this function goes here
%   Detailed explanation goes here

fprintf("1. CASE I: constant recieving power factor (0.8 lagging)\n");
fprintf("2. CASE II: constant recieving power (100 kW [full load])\n");
type = input();

switch type
    case 1
        CASE1(A, B, C, D);
    case 2
        CASE2(A, B, C, D);

outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

