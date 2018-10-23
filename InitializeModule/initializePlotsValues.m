function [oPlotValues] = initializePlotsValues()
%% INITIALIZEPLOTVALUES
% Allocate memory for dynamic arrays of *plotValues* structure.
%
% * Syntax
%
%   [PLOTVALUES] = INITIALIZEPLOTVALUES()
%
% * Output
%
% -- oPlotValues - return structure of values for plotting graphics
%                  including R, G, B, RG, RB, GB components.
%                  Every component contains Contrast, Correlation, Energy,
%                  Homogeneity properties.
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

oPlotValues.h =     initializePlotComponents();
oPlotValues.nh1 =   initializePlotComponents();
% oPlotValues.nh2 =   initializePlotComponents();
% oPlotValues.nh3 =   initializePlotComponents();
% oPlotValues.nh4 =   initializePlotComponents();
% oPlotValues.nh5 =   initializePlotComponents();
% oPlotValues.nh6 =   initializePlotComponents();
% oPlotValues.nh7 =   initializePlotComponents();
% oPlotValues.nh8 =   initializePlotComponents();
% oPlotValues.nh9 =   initializePlotComponents();
% oPlotValues.nh10 =   initializePlotComponents();
% oPlotValues.nh11 =   initializePlotComponents();
% oPlotValues.nh12 =   initializePlotComponents();
% oPlotValues.nh13 =   initializePlotComponents();
% oPlotValues.nh14 =   initializePlotComponents();
% oPlotValues.nh15 =   initializePlotComponents();


end