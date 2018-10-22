function [oStruct] = initializePlotComponents()
%% INITIALIZEPLOTCOMPONENTS 
% Summary of this function goes here. 
% 
% * Syntax 
% 
%	[OUTPUTARGS] = INITIALIZEPLOTCOMPONENTS(INPUTARGS) Explain usage here
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
% * Date: 21/10/2018 22:17:25 
% * Version: 0.1 $ 
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

oStruct.R =    initializePlotComponentProperties();
oStruct.G =    initializePlotComponentProperties();
oStruct.B =    initializePlotComponentProperties();
oStruct.RG =   initializePlotComponentProperties();
oStruct.RB =   initializePlotComponentProperties();
oStruct.GB =   initializePlotComponentProperties();

end
