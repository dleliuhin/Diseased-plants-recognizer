function [ioStatistics, ...
          ioTableColumns] = writeComponentPropertyResult(iResFileName, ...
                                                         iDiseaseCode, ...
                                                         iIndicator, ...
                                                         iComponentName, ...
                                                         iPropertyName, ...
                                                         iStats, ...
                                                         iMarks, ...
                                                         ioStatistics, ...
                                                         ioTableColumns)
%% WRITECOMPONENTPROPERTYRESULT 
% Summary of this function goes here. 
% 
% * Syntax 
% 
%	[OUTPUTARGS] = WRITECOMPONENTPROPERTYRESULT(INPUTARGS)
% 
% * Input 
% 
% -- INPUTARGS -  
% 
% * Output 
% 
% -- OUTPUTARGS -  
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
% * Date: 08/11/2018 10:20:50 
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

% tabulaString = '\t\t\t\t\t\t\t\t  ';
ioTableColumns.imageNames{end+1} = ' ';
ioTableColumns.Attribute(end+1) = ' ';

markh = double(iMarks.h. ...
                      (iIndicator). ...
                       (iComponentName). ...
                        (iPropertyName));
                    
currentStats = double(mean(iStats.(iComponentName).(iPropertyName)));

marknh = double(iMarks.(iDiseaseCode). ...
                        (iIndicator). ...
                         (iComponentName). ...
                          (iPropertyName));

[binResult, ...
 ioStatistics.count] = checkPropertyOwnership(markh, ...
                                              currentStats, ...
                                              iDiseaseCode, ...
                                              marknh, ...
                                              ioStatistics.count);
bufDiffHSt =  abs(markh - currentStats);
bufDiffNhSt = abs(marknh - currentStats);

% fprintf(iResFileName, ...
%         '%s | %s | %2.4f  | %2.4f | %2.4f | %2.4f | %2.4f | %d \n', ...
%         sprintf(tabulaString), ... 
%         sprintf(strcat(iComponentName, '.', iPropertyName)), ...
%         markh, ...
%         bufDiffHSt, ...
%         currentStats, ...
%         bufDiffNhSt, ...
%         marknh, ...
%         binResult);

ioTableColumns.Component{end+1} = ...
               sprintf(strcat(iComponentName, '.', iPropertyName));
ioTableColumns.Healthy(end+1) = markh;
ioTableColumns.delta1(end+1) = bufDiffHSt;
ioTableColumns.Test(end+1) = currentStats;
ioTableColumns.delta2(end+1) = bufDiffNhSt;
ioTableColumns.Ill(end+1) = marknh;
ioTableColumns.Result(end+1) = binResult;

ioStatistics.allCount = ioStatistics.allCount + 1;  
ioStatistics.sumMark.h(end+1) = bufDiffHSt;
ioStatistics.sumMark.nh(end+1) = bufDiffNhSt;

end