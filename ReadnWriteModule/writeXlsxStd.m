function writeXlsxStd(iFileName, iStdStruct, iStartRow)
%% WRITEXLSXSTD 
% Write iStdStruct averages to table in 
% Result/Tables/iFileName.xlsx from specific iStartRow.
% 
% * Syntax 
% 
%	[] = WRITEXLSXSTD(IFILENAME, ISTDSTRUCT, ISTARTROW)
% 
% * Input 
% 
% -- iFileName - name of the file in which need to write averages.
% 
% -- iMeanStruct - structure of statistic std indicator.
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
% * Date: 01/11/2018 12:02:29 
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

% Write std averages for R component.
writeXlsxProperties(iFileName, iStdStruct.('R'),  'C', iStartRow);

% Write std averages for G component.
writeXlsxProperties(iFileName, iStdStruct.('G'),  'E', iStartRow);

% Write std averages for B component.
writeXlsxProperties(iFileName, iStdStruct.('B'),  'G', iStartRow);

% Write std averages for RG component.
writeXlsxProperties(iFileName, iStdStruct.('RG'), 'I', iStartRow);

% Write std averages for RB component.
writeXlsxProperties(iFileName, iStdStruct.('RB'), 'K', iStartRow);

% Write std averages for GB component.
writeXlsxProperties(iFileName, iStdStruct.('GB'), 'M', iStartRow);

end
