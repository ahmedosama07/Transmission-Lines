function [A, B, C, D] = longLine(Z, Y)
%longLine Summary of this function goes here
%   function that calculates ABCD parameters of long transmission line
%   parameters are set to NaN since they cannot be calculated as the other
%   two cases

line1 = "Cannot measure ABCD parameters.";
line2 = "*The distributed nature of the parameters is considered.";
line3 = "*The resistance, inductance, and capacitance of the line are not lumped.";
line4 = "\bfLine impedance: " + num2str(abs(Z)) + "∠" + num2str(rad2deg(angle(Z))) + "° Ω";
line5 = "Capacitive admitance: " + num2str(abs(Y)) + "∠" + num2str(rad2deg(angle(Y))) + "° ℧";

CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'non-modal';

msg = [line1; line2; line3; ""; line4; line5];
msgbox(msg, "Long Line", CreateStruct);

[A, B, C, D] = struct('x', num2cell([NaN, NaN, NaN, NaN])).x;
end