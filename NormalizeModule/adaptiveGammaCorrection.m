function [ioFrame] = adaptiveGammaCorrection(ioFrame)
%% ADAPTIVEGAMMACORRECTION 
% Summary of this function goes here. 
% 
% * Syntax 
% 
% [OUTPUTARGS] = ADAPTIVEGAMMACORRECTION(INPUTARGS)
% 
% * Input 
% 
% -- INPUTARGS -  
% 
% * Output 
% 
% -- OUTPUTARGS -  
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% List related files here 
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 11/05/2019 04:44:36 
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a 
% 
% * Warning: 
% 
% # Warnings list. 
% 
% * TODO: 
% 
% # TODO list. 
% 

%% Code 
tetta = 3;

hsv = rgb2hsv(ioFrame);
V = hsv(:,:,3);
v_mean = mean(V(:));
v_std = std(V(:));

diff = 4 * v_std;

if (diff <= 1/tetta)
    gamma = - log2(v_std);
    sGC = standartGammaCorrection(V, gamma);
    [rows columns] = size(sGC);
    
    if (v_mean < 0.5)
        onesMat = ones(rows, columns, 'double');
        denominator = onesMat - sGC;
        denominator = denominator .* power(v_mean, gamma);
        denominator = sGC + denominator;
        Iout = sGC ./ denominator;
    else
        Iout = sGC;
    end
else
    gamma = exp(1 - (v_mean + v_std) ./ 2);
    sGC = standartGammaCorrection(V, gamma);
    [rows columns] = size(sGC);
    
    if (v_mean < 0.5)
        Iout = sGC;
    else
        onesMat = ones(rows, columns, 'double');
        k_mat = onesMat - sGC;
        k_mat = k_mat .* power(v_mean, gamma);
        k_mat = sGC + k_mat;
        
        denominator = k_mat - onesMat;
        denominator = denominator .* heaviside(0.5 - v_mean);
        denominator = onesMat + denominator;
        c_param = onesMat ./ denominator;
        Iout = c_param .* sGC;
    end
end
    
hsv(:,:,3) = Iout;

ioFrame = hsv2rgb(hsv);

end
