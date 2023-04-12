function [A, B, C, D] = abcd_param(Z, Y, length)
    if length < 80000
        fprintf('Short Line Model\n');
        A = 1;
        B = Z;
        C = 0;
        D = 1;
        fprintf('A = %0.1f\nB =%f+j%f\nC=%0.1f\nD=%0.1f\n', A, real(B), imag(B), C, D); 
    elseif (length >= 80000) && (length <= 250000)
        fprintf('Which medium line model would you like to work with?\n1-pi Model\n2-T Model\n');
        choice = input('Choice: ');
        switch choice
            case 1
                A = 1 + (Z*Y)/2;
                B = Z;
                C = Y * (1 + (Z*Y/4));
                D = 1 + (Z*Y)/2;
            case 2
                A = 1 + (Z*Y)/2;
                B = Z * (1 + (Z*Y/4));
                C = Y;
                D = 1 + (Z*Y)/2;
        end
        fprintf('A = %f+j%f\nB =%f+j%f\nC=%f+j%f\nD=%f+j%f\n', real(A), imag(A), real(B), imag(B), real(C), imag(C), real(D), imag(D));
    elseif length > 250000
        fprintf('Long Transmission Line has no accurate model\n');
    end
end 