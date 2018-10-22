function [oSubMarks] = initializeSubMurks()
%% INITIALIZESUBMURKS 
% Allocate memory for dynamic arrays of *oSubMarks* structure.
% 
% * Syntax 
% 
%	[OSUBMARKS] = INITIALIZESUBMURKS()
% 
% * Output 
% 
% -- oSubMarks - output structure with allocated memory of statistic 
%                "averages" and indicators including mean, std, median, 
%                mode, range, minRange, maxRange.
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
% * Date: 21/10/2018 20:32:46 
% * Version: 1.0 $ 
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

%% _Initialize empty arrays for h structure_
%%
% * _Initialize empty arrays for mean indicator_
oSubMarks.means = initializeIndicator();
%%
% * _Initialize empty arrays for std indicator_            
oSubMarks.stds = initializeIndicator();
%%
% * _Initialize empty arrays for median indicator_
oSubMarks.medianes = initializeIndicator();
%%
% * _Initialize empty arrays for mode indicator_
oSubMarks.modes = initializeIndicator();
%%
% * _Initialize empty arrays for range indicator_
oSubMarks.ranges = initializeIndicator();
%%
% * _Initialize empty arrays for minRange indicator_
oSubMarks.minRanges = initializeIndicator();
%%
% * _Initialize empty arrays for maxRange indicator_
oSubMarks.maxRanges = initializeIndicator();

end
