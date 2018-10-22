function [plotValues] = initializePlotsValues()
%% INITIALIZEPLOTVALUES
% Allocate memory for dynamic arrays of *plotValues* structure.
%
% * Syntax
%
%   [PLOTVALUES] = INITIALIZEPLOTVALUES()
%
% * Output
%
% -- plotValues - return structure of values for plotting graphics
%            including R, G, B, RG, RB, GB components.
%            Every component contains Contrast, Correlation, Energy,
%             Homogeneity properties.
% 
% * Examples:
%
% Provide sample usage code here.
% 
% * See also: 
%   
% No dependencies
%
% * Author: *Dmitrii Leliuhin* 
% * Email: dleliuhin@mail.ru
% * Date: 04/09/2018 13:24:27
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

oStruct.h =     initializePlotComponents();
oStruct.nh1 =   initializePlotComponents();

end