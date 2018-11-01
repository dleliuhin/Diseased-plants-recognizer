function writeXlsxGroupAverage(iFileName, iGroupStruct, iStartRow)
%% WRITEXLSXGROUPAVERAGE
% Write iGroupStruct local averages to table in 
% Result/Tables/iFileName.xlsx from specific iStartRow.
% 
% * Syntax 
% 
%	[] = WRITEXLSXGROUPAVERAGE(IFILENAME, IGROUPSTRUCT, ISTARTROW)
% 
% * Input 
% 
% -- iFileName - name of the file in which need to write averages.
% 
% -- iGroupStruct - structure of statistic "averages" and indicators
%             including mean, std, median, mode, range, minRange, maxRange
%             according to plot values.
%             Every indicator contains R, G, B, RG, RB, GB components.
%             Every component contains Contrast, Correlation, Energy,
%             Homogeneity properties.
% 
% -- iStartRow - row in table of iFileName from which need to 
%                write averages.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% WRITEXLSXMEAN, WRITEXLSXSTD
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 01/11/2018 11:08:48 
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

% Write mean averages to iFileName from specific iStartRow.
writeXlsxMean(iFileName, iGroupStruct.means, iStartRow);

% Write std averages to iFileName from specific iStartRow.
writeXlsxStd(iFileName, iGroupStruct.stds, iStartRow);

end
