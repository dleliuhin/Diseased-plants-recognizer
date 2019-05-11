function [res] = heaviside(x)
%% HEAVISIDE 
% Summary of this function goes here. 
% 
% * Syntax 
% 
% [OUTPUTARGS] = HEAVISIDE(INPUTARGS)
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
% * Date: 11/05/2019 05:36:12 
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

if (x <= 0.0)
    res = false;
else 
    res = true;
end

end
