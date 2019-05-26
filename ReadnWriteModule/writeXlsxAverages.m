function writeXlsxAverages(iFileName, iMarks)
%% WRITEXLSXAVERAGES 
% Write all iMarks averages to table in Result/Tables/iFileName.xlsx. 
% 
% * Syntax 
% 
%	[] = WRITEXLSXAVERAGES(IFILENAME, IMARKS)
% 
% * Input 
% 
% -- iFileName - name of the file in which need to write averages.
% 
% -- iMarks - structure of statistic "averages" and indicators
%             including mean, std, median, mode, range, minRange, maxRange
%             according to plot values.
%             Every indicator contains R, G, B, RG, RB, GB components.
%             Every component contains Contrast, Correlation, Energy,
%             Homogeneity properties.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% WRITEXLSXGROUPAVERAGE
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 01/11/2018 10:22:09 
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

% Write averages for healthy plantic leaves.
writeXlsxGroupAverage(iFileName, iMarks.leaves.h, 5);

% Write averages for diseased of 1st group plantic leaves.
writeXlsxGroupAverage(iFileName, iMarks.leaves.nh1, 14);

end
