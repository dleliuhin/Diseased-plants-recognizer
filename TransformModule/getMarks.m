function [marks] = getMarks(marks, plotValues)
%% GETMARKS 
% Get statistic "averages" and indicators from plot values.
% 
% * Syntax 
% 
%	[MARKS] = GETMARKS(MARKS, PLOTVALUES)
% 
% * Input 
% 
% -- marks - empty structure of statistic "averages" and indicators
%            including mean, std, median, mode, range, minRange, maxRange.
%            Every indicator contains R, G, B, RG, RB, GB components.
%            Every component contains Contrast, Correlation, Energy,
%            Homogeneity properties.
% 
% -- plotValues - structure of arrays contained plot data for 
%                 R, G, B, RG, RB, GB components. Every component contains 
%                 Contrast, Correlation, Energy, Homogeneity properties.
% 
% * Output 
% 
% -- marks - filed structure of statistic "averages" and indicators
%            including mean, std, median, mode, range, minRange, maxRange
%            according to plot values.
%            Every indicator contains R, G, B, RG, RB, GB components.
%            Every component contains Contrast, Correlation, Energy,
%            Homogeneity properties.
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
% * Date: 11/10/2018 23:19:14 
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

marks.h = getAllIndicators(marks.h, plotValues.h);

marks.nh1 = getAllIndicators(marks.nh1, plotValues.nh1);

marks.nh2 = getAllIndicators(marks.nh2, plotValues.nh2);

marks.nh3 = getAllIndicators(marks.nh3, plotValues.nh3);

marks.nh4 = getAllIndicators(marks.nh4, plotValues.nh4);

marks.nh5 = getAllIndicators(marks.nh5, plotValues.nh5);

marks.nh6 = getAllIndicators(marks.nh6, plotValues.nh6);

marks.nh7 = getAllIndicators(marks.nh7, plotValues.nh7);

marks.nh8 = getAllIndicators(marks.nh8, plotValues.nh8);

marks.nh9 = getAllIndicators(marks.nh9, plotValues.nh9);

marks.nh10 = getAllIndicators(marks.nh10, plotValues.nh10);

save('Workspaces/cutMarks.mat', 'marks');

end