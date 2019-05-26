function [oStruct] = initializeComponents()
%% INITIALIZECOMPONENTS 
% Allocate memory for dynamic arrays of *oStruct* structure.
%
% * Syntax
%
%   [OSTRUCT] = INITIALIZECOMPONENTS()
%
% * Output
%
% -- oStruct - output structure with allocated memory for R, G, B, 
%               RG, RB, GB components.
% 
% * Examples:
%
% Insert function before loop for adding elements to arrays.
% 
% * See also: 
%   
% INITIALIZECOMPONENTPROPERTIES
%
% * Author: *Dmitrii Leliuhin* 
% * Email: dleliuhin@mail.ru
% * Date: 10/10/2018 05:49:23 
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

oStruct.R =    initializeComponentProperties();
oStruct.G =    initializeComponentProperties();
oStruct.B =    initializeComponentProperties();
oStruct.RG =   initializeComponentProperties();
oStruct.RB =   initializeComponentProperties();
oStruct.GB =   initializeComponentProperties();

end
