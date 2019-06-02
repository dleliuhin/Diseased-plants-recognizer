function [oIndicatorName] = initializeIndicator()
%% INITIALIZEINDICATOR 
% Allocate memory for dynamic arrays of *oIndicatorName* structure.
% 
% * Syntax 
% 
%   [OINDICATORNAME] = INITIALIZEINDICATOR() 
% 
% * Output 
% 
% -- oIndicatorName - structure of statistic "average" or indicator
%                     with allocated memory.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% INITIALIZECOMPONENTPROPERTIES
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 11/10/2018 10:05:32 
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

oIndicatorName.R =     initializeComponentProperties();
oIndicatorName.G =     initializeComponentProperties();
oIndicatorName.B =     initializeComponentProperties();
oIndicatorName.RG =    initializeComponentProperties();
oIndicatorName.RB =    initializeComponentProperties();
oIndicatorName.GB =    initializeComponentProperties();

end
