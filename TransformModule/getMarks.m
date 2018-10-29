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

marks.leaves.h.means =       getMeanIndicator(marks.leaves.h.means, plotValues.h);
marks.leaves.nh1.means =     getMeanIndicator(marks.leaves.nh1.means, plotValues.nh1);

marks.leaves.h.stds =        getStdIndicator(marks.leaves.h.stds, plotValues.h);
marks.leaves.nh1.stds =      getStdIndicator(marks.leaves.nh1.stds, plotValues.nh1);

marks.leaves.h.medianes =    getMedianeIndicator(marks.leaves.h.medianes, plotValues.h);
marks.leaves.nh1.medianes =  getMedianeIndicator(marks.leaves.nh1.medianes, plotValues.nh1);

marks.leaves.h.modes =       getModeIndicator(marks.leaves.h.modes, plotValues.h);
marks.leaves.nh1.modes =     getModeIndicator(marks.leaves.nh1.modes, plotValues.nh1);

marks.leaves.h.ranges =      getRangeIndicator(marks.leaves.h.ranges, plotValues.h);
marks.leaves.nh1.ranges =    getRangeIndicator(marks.leaves.nh1.ranges, plotValues.nh1);

marks.leaves.h.minRanges =   getMinRangeIndicator(marks.leaves.h.minRanges, plotValues.h);
marks.leaves.nh1.minRanges = getMinRangeIndicator(marks.leaves.nh1.minRanges, plotValues.nh1);

marks.leaves.h.maxRanges =   getMaxRangeIndicator(marks.leaves.h.maxRanges, plotValues.h);
marks.leaves.nh1.maxRanges = getMaxRangeIndicator(marks.leaves.nh1.maxRanges, plotValues.nh1);

end