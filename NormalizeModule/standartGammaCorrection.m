function [corrected] = standartGammaCorrection(iChannel, iGamma)
%% STANDARTGAMMACORRECTION 
% Summary of this function goes here. 
% 
% * Syntax 
% 
% [OUTPUTARGS] = STANDARTGAMMACORRECTION(INPUTARGS)
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
% * Date: 11/05/2019 04:41:47 
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

corrected = power(iChannel, 1 / iGamma);

end
