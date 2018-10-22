function [oStruct] = initializeComponentProperties()
%% INITIALIZECOMPONENTPROPERTIES 
% Allocate memory for dynamic arrays of *oStruct* structure.
% 
% * Syntax 
% 
%	[OSTRUCT] = INITIALIZECOMPONENTPROPERTIES()
% 
% * Output 
% 
% -- ioStruct - output structure with allocated memory for RGB 
%               components properties:
%               Contrast, Correlation, Energy, Homogeneity.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% No relations.
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 15/10/2018 13:27:12 
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

oStruct.Contrast =     [];
oStruct.Correlation =  [];
oStruct.Energy =       [];
oStruct.Homogeneity =  [];

end
