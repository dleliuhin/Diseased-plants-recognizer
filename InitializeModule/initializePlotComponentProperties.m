function [oStruct] = initializePlotComponentProperties()
%% INITIALIZEPLOTCOMPONENTSPROPERTIES 
% Allocate memory for dynamic arrays of *oStruct* structure.
% 
% * Syntax 
% 
%	[OUTPUTARGS] = INITIALIZEPLOTCOMPONENTSPROPERTIES(INPUTARGS)
% 
% * Output 
% 
% -- oStruct - output structure with allocated memory for plot values.
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
% * Date: 21/10/2018 22:18:00 
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a 
% 
% * Warning: 
% 
% # Warnings list. 
% 
% * TODO: 
% 
% # Replace dynamic memory allocation *[]* with *zeros()* function.
% 

%% Code 

oStruct.Contrast.nums =       [];
oStruct.Contrast.edges =      [];
oStruct.Correlation.nums  =   [];
oStruct.Correlation.edges  =  [];
oStruct.Energy.nums  =        [];
oStruct.Energy.edges  =       [];
oStruct.Homogeneity.nums  =   [];
oStruct.Homogeneity.edges  =  [];

end
