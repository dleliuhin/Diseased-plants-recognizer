function [] = printGroupVerdict(iResFileName, iStatistics)
%% PRINTGROUPVERDICT 
% Summary of this function goes here. 
% 
% * Syntax 
% 
%	[OUTPUTARGS] = PRINTGROUPVERDICT(INPUTARGS)
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
% * Date: 17/11/2018 00:48:35 
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
%fprintf(iResFileName, '\n');
fprintf('\n');
%fprintf(iResFileName, ...
fprintf(...
        strcat('Healthy: %3.2f%% , Ill: %3.2f%% ,', ...
        ' Verdict atribute: %s , ', ...
        'sumDelta1: %2.4f ,  sumDelta2: %2.4f \n'), ...
        iStatistics.CountPercent.h, ...
        iStatistics.CountPercent.nh, ...
        num2str(iStatistics.finalResult), ...
        sum(iStatistics.sumMark.h ...
        (isnan(iStatistics.sumMark.h) == 0)), ...
        sum(iStatistics.sumMark.nh ...
        (isnan(iStatistics.sumMark.nh) == 0)));

fprintf('\n\n');
% fprintf(iResFileName, '\n');
% fprintf(iResFileName, '\n');

end
