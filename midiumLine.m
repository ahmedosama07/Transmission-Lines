function [A, B, C, D] = midiumLine(Z, Y)
%midiumLine Summary of this function goes here
%   function that calculates ABCD parameters of midiuam transmission line

formats = struct('type', {}, 'style', {}, 'items', {}, 'format', {}, 'limits', {}, 'size', {});
    formats(1,1).type   = 'list';
    formats(1,1).style = 'popupmenu';
    formats(1,1).items  = {'1. Π model','2. T model'};
    
    value = inputsdlg('Transmission Line Model:: ', 'Midium Line', formats);
    model = value{1};

switch model
    case 1
        [A, B, C, D] = struct('x', num2cell([1 + (Z*Y)/2, Z, Y * (1 + (Z*Y/4)), 1 + (Z*Y)/2])).x;
    case 2
        [A, B, C, D] = struct('x', num2cell([1 + (Z*Y)/2, Z * (1 + (Z*Y/4)), Y, 1 + (Z*Y)/2])).x;
end
end

