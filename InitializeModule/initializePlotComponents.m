function [oStruct] = initializePlotComponents()
%% INITIALIZEPLOTCOMPONENTS 
% Allocate memory for dynamic arrays of *oStruct* structure.
% 
% * Syntax 
% 
%	[OSTRUCT] = INITIALIZEPLOTCOMPONENTS()
% 
% * Output 
% 
% -- oStruct - output structure with allocated memory with 
%              R,G,B,RG,RB,GB substructures 
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

oStruct.R =    initializePlotComponentProperties();
oStruct.G =    initializePlotComponentProperties();
oStruct.B =    initializePlotComponentProperties();
oStruct.RG =   initializePlotComponentProperties();
oStruct.RB =   initializePlotComponentProperties();
oStruct.GB =   initializePlotComponentProperties();

end
