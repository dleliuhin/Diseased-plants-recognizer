function [oStruct] = initializePlanticGroups()
%% INITIALIZEPLANTICGROUPS 
% Allocate memory for dynamic arrays of *oStruct* structure.
% 
% * Syntax 
% 
%	[OSTRUCT] = INITIALIZEPLANTICGROUPS()  
% 
% * Output 
% 
% -- oStruct - output structure with allocated memory for healthy and
%              diseased part of a plants.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% INITIALIZECOMPONENTS
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 15/10/2018 15:26:44 
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

oStruct.h   =   initializeComponents();
oStruct.nh1 =   initializeComponents();
oStruct.nh2 =   initializeComponents();
oStruct.nh3 =   initializeComponents();
oStruct.nh4 =   initializeComponents();
oStruct.nh5 =   initializeComponents();
oStruct.nh6 =   initializeComponents();
oStruct.nh7 =   initializeComponents();
oStruct.nh8 =   initializeComponents();
oStruct.nh9 =   initializeComponents();
oStruct.nh10 =  initializeComponents();
% oStruct.nh11 = initializeComponents();
% oStruct.nh12 = initializeComponents();
% oStruct.nh13 = initializeComponents();
% oStruct.nh14 = initializeComponents();
% oStruct.nh15 = initializeComponents();

end
