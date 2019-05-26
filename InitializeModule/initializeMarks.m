function [oMarks] = initializeMarks()
%% INITIALIZEMARKS
% Allocate memory for dynamic arrays of *marks* structure.
%
% * Syntax
%
%   [OMARKS] = INITIALIZEMARKS()
%
% * Output
%
% -- oMarks - structure of statistic "averages" and indicators
%             including mean, std, median, mode, range, minRange, maxRange.
%             Every indicator contains R, G, B, RG, RB, GB components.
%             Every component contains Contrast, Correlation, Energy,
%             Homogeneity properties for each plantic group.
% 
% * Examples:
%
% Provide sample usage code here.
% 
% * See also: 
%   
% INITIALIZESUBMARKS
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

oMarks.h =      initializeSubMurks();
oMarks.nh1 =    initializeSubMurks();
oMarks.nh2 =    initializeSubMurks();
oMarks.nh3 =    initializeSubMurks();
oMarks.nh4 =    initializeSubMurks();
oMarks.nh5 =    initializeSubMurks();
oMarks.nh6 =    initializeSubMurks();
oMarks.nh7 =    initializeSubMurks();
oMarks.nh8 =    initializeSubMurks();
oMarks.nh9 =    initializeSubMurks();
oMarks.nh10 =    initializeSubMurks();
% oMarks.nh11 =    initializeSubMurks();
% oMarks.nh12 =    initializeSubMurks();
% oMarks.nh13 =    initializeSubMurks();
% oMarks.nh14 =    initializeSubMurks();
% oMarks.nh15 =    initializeSubMurks();

end