function writeXlsxEachData(iTableFileName, iImageNames, iLeaves)
%% WRITEXLSXEACHDATA
% Write all iLeaves sttistic for each image from iImageNames to 
% table in Result/Tables/iTableFileName.xlsx. 
% 
% * Syntax 
% 
%	[] = WRITEXLSXEACHDATA(ITABLEFILENAME, IIMAGENAMES, ILEAVES)
% 
% * Input 
% 
% -- iTableFileName - name of the file in which need to write averages.
% 
% -- iImageNames - structure of statistic "averages" and indicators
%             including mean, std, median, mode, range, minRange, maxRange
%             according to plot values.
%             Every indicator contains R, G, B, RG, RB, GB components.
%             Every component contains Contrast, Correlation, Energy,
%             Homogeneity properties.
%
% -- iLeaves - structure with healthy or diseased parts of a plants.
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
% * Date: 04/10/2018 00:43:49
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

xlswrite(strcat('Result/Tables/', iTableFileName, '.xlsx'), ...
         iImageNames(1:80),  'C2:CD2');

writeXlsxGroupData(iTableFileName, iLeaves.h, 'C', 3);

%Writing data for diseased plants
xlswrite(strcat('Result/Tables/', iTableFileName, '.xlsx'), ...
         iImageNames(81:end),  'C30:CD30');
     
writeXlsxGroupData(iTableFileName, iLeaves.nh1, 'C', 31);

end