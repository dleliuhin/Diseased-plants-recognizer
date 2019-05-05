function [oStatistics] = initializeGroupStatistics(iDiseaseCode, iAttribute)
%% INITIALIZEGROUPSTATISTICS 
% Summary of this function goes here. 
% 
% * Syntax 
% 
%	[OUTPUTARGS] = INITIALIZEGROUPSTATISTICS(INPUTARGS)
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
% * Date: 17/11/2018 00:51:53 
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

oStatistics.CountPercent.h = 0;
oStatistics.CountPercent.nh = 0;
oStatistics.sumMark.h = [];
oStatistics.sumMark.nh = [];
oStatistics.allCount = 0;
oStatistics.count.h = 0;
oStatistics.count.(iDiseaseCode) = 0;
oStatistics.res.h = 0;
oStatistics.res.(iDiseaseCode) = 0;
oStatistics.attribute = iAttribute;
oStatistics.finalResult = 0;

end
