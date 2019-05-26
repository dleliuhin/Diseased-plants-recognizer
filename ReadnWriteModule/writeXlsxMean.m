function writeXlsxMean(iFileName, iMeanStruct, iStartRow)
%% WRITEXLSXMEAN
% Write iMeanStruct averages to table in 
% Result/Tables/iFileName.xlsx from specific iStartRow.
% 
% * Syntax 
% 
%	[] = WRITEXLSXMEAN(IFILENAME, IMEANSTRUCT, ISTARTROW)
% 
% * Input 
% 
% -- iFileName - name of the file in which need to write averages.
% 
% -- iMeanStruct - structure of statistic mean indicator.
%             Indicator contains R, G, B, RG, RB, GB components.
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
% WRITEXLSXPROPERTIES
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

% Write mean averages for R component.
writeXlsxProperties(iFileName, iMeanStruct.('R'),  'B', iStartRow);

% Write mean averages for G component.
writeXlsxProperties(iFileName, iMeanStruct.('G'),  'D', iStartRow);

% Write mean averages for B component.
writeXlsxProperties(iFileName, iMeanStruct.('B'),  'F', iStartRow);

% Write mean averages for RG component.
writeXlsxProperties(iFileName, iMeanStruct.('RG'), 'H', iStartRow);

% Write mean averages for RB component.
writeXlsxProperties(iFileName, iMeanStruct.('RB'), 'J', iStartRow);

% Write mean averages for GB component.
writeXlsxProperties(iFileName, iMeanStruct.('GB'), 'L', iStartRow);

end