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

oMarks.leaves.h =      initializeSubMurks();
oMarks.leaves.nh1 =    initializeSubMurks();
% oMarks.leaves.nh2 =    initializeSubMurks();
% oMarks.leaves.nh3 =    initializeSubMurks();
% oMarks.leaves.nh4 =    initializeSubMurks();
% oMarks.leaves.nh5 =    initializeSubMurks();
% oMarks.leaves.nh6 =    initializeSubMurks();
% oMarks.leaves.nh7 =    initializeSubMurks();
% oMarks.leaves.nh8 =    initializeSubMurks();
% oMarks.leaves.nh9 =    initializeSubMurks();
% oMarks.leaves.nh10 =    initializeSubMurks();
% oMarks.leaves.nh11 =    initializeSubMurks();
% oMarks.leaves.nh12 =    initializeSubMurks();
% oMarks.leaves.nh13 =    initializeSubMurks();
% oMarks.leaves.nh14 =    initializeSubMurks();
% oMarks.leaves.nh15 =    initializeSubMurks();


end