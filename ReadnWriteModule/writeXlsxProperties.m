function writeXlsxProperties(iFileName, ...
                             iAttributeStruct, ...
                             iStartColumn, ...
                             iStartRow)
%% WRITEXLSXPROPERTIES 
% Write iAttributeStruct average properties to table in 
% Result/Tables/iFileName.xlsx from specifics iStartColumn and iStartRow.
% 
% * Syntax 
% 
%	[] = WRITEXLSXPROPERTIES(IFILENAME, 
%                            IATTRIBUTESTRUCT, 
%                            ISTARTCOLUMN, 
%                            ISTARTROW)
% 
% * Input 
% 
% -- iFileName - name of the file in which need to 
%                write average properties.
% 
% -- iAttributeStruct - structure of component properties.
%             Every component contains Contrast, Correlation, 
%             Energy, Homogeneity properties.
% 
% -- iStartColumn - column in table of iFileName from which need to 
%                   write average properties.
%
% -- iStartRow - row in table of iFileName from which need to 
%                write average properties.
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
% * Date: 01/11/2018 11:34:25 
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

% Write std averages for GB component.
xlswrite(strcat('Result/Tables/', iFileName, '.xlsx'), ...
         iAttributeStruct.Contrast, 1, ...
         strcat(iStartColumn, num2str(iStartRow)));
xlswrite(strcat('Result/Tables/', iFileName, '.xlsx'), ...
         iAttributeStruct.Correlation, 1, ...
         strcat(iStartColumn, num2str(iStartRow + 1)));
xlswrite(strcat('Result/Tables/', iFileName, '.xlsx'), ...
         iAttributeStruct.Energy, 1, ...
         strcat(iStartColumn, num2str(iStartRow + 2)));
xlswrite(strcat('Result/Tables/', iFileName, '.xlsx'), ...
         iAttributeStruct.Homogeneity, 1, ...
         strcat(iStartColumn, num2str(iStartRow + 3)));

end
