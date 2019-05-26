function [ioStatistics, ...
          ioTableColumns] = writeGroupResult(iResFileName, ...
                                    iGroupValue, ...
                                    iDiseaseCode, ...
                                    iStats, ...
                                    iMarks, ...
                                    iImagename1, ...
                                    iImagename2, ...
                                    ioStatistics, ...
                                    ioTableColumns)
%% WRITEGROUPRESULT
% Check sample test from specific sample test folders and
% 
% * Syntax
%
% [] = WRITEGROUPRESULT(MARKS, GROUPVALUE)
%
% * Intput
%
% -- marks - structure of statistic "averages" and indicators.
%
% -- groupValue - Number of images in one group.
%
% * Examples: 
% 
% Provide sample usage code here.
% 
% * See also: 
%   
% 
%           
% * Authors: Dmitrii Leliuhin
% * Email: dleliuhin@mail.ru 
% * Date: 04/09/2018 18:51:36
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a  
% 
% * Warning: 
%
% No Warnings.
% 
% * TODO: 
% 
% TODO list.
% 

%% Code

if (iGroupValue == 1)
%     fprintf(iResFileName, '%s |  \t %d \t\t| \n', ...
%             iImagename1, ioStatistics.attribute);
    ioTableColumns.imageNames{end+1} = sprintf('%s', iImagename1);
    ioTableColumns.Attribute(end+1) = num2str(ioStatistics.attribute);
else
%     fprintf(iResFileName, '%s - %s |  \t %d \t   | \n', ...
%             iImagename1, iImagename2, ioStatistics.attribute);
    ioTableColumns.imageNames{end+1} = ...
                   sprintf('%s - %s', iImagename1, iImagename2);
    ioTableColumns.Attribute(end+1) = num2str(ioStatistics.attribute);
end

ioTableColumns.Component{end+1} = ' ';
ioTableColumns.Healthy(end+1) = ' ';
ioTableColumns.delta1(end+1) = ' ';
ioTableColumns.Test(end+1) = ' ';
ioTableColumns.delta2(end+1) = ' ';
ioTableColumns.Ill(end+1) = ' ';
ioTableColumns.Result(end+1) = ' ';

%% R

[ioStatistics, ...
 ioTableColumns] = writeComponentResult(iResFileName, ...
                                        iDiseaseCode, ...
                                        'means', ...
                                        'R', ...
                                        iStats, ...
                                        iMarks.leaves, ...
                                        ioStatistics, ...
                                        ioTableColumns);

% %% G
% 
% writeComponentResult();
% 
% %% B
% 
% writeComponentResult();
% 
% %% RG
% 
% writeComponentResult();
% 
% %% RB
% 
% writeComponentResult();
% 
% %% GB
% 
% writeComponentResult();

%%
ioStatistics.CountPercent.h = double((ioStatistics.count.h) ./ ioStatistics.allCount * 100);
ioStatistics.CountPercent.nh = double((ioStatistics.count.(iDiseaseCode)) ./ ioStatistics.allCount * 100);

if (ioStatistics.sumMark.h > ...
    ioStatistics.sumMark.nh)
    ioStatistics.finalResult = 1;
    ioStatistics.res.h = ioStatistics.res.h + 1;
    
elseif (ioStatistics.sumMark.h < ...
        ioStatistics.sumMark.nh)
    ioStatistics.finalResult = 0;
    ioStatistics.res.(iDiseaseCode) = ioStatistics.res.(iDiseaseCode) + 1;
    
elseif (ioStatistics.sumMark.h == ...
        ioStatistics.sumMark.nh)    
    ioStatistics.finalResult = 'undefined';

end

end