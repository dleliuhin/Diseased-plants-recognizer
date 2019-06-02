function [] = to_test_group(iPath, iMarks, iGroup, iGroupValue, iLogsFile)
%% TO_TEST_GROUP
% Summary of this function goes here.
%
% * Syntax
%
% [] = TO_TEST_GROUP(IPATH, IMARKS, IGROUP, IGROUPVALUE, ILOGSVALUE)
%
% * Input
%
% -- iPath - relative path to test images dataset.
%
% -- iMarks - filed structure of statistic "averages" and indicators
%             including mean, std, median, mode, range, minRange, maxRange
%             according to plot values.
%             Every indicator contains R, G, B, RG, RB, GB components.
%             Every component contains Contrast, Correlation, Energy,
%             Homogeneity properties.
%
% -- iGroup - structure of statistic "average" or indicator
%             with allocated memory
%
% -- iGroupValue - number of images in one group. 
%
% -- iLogsFile - file for output result logs.
%
% * Examples:
%
% Provide sample usage code here
%
% * See also:
%
% FINDGLCMSTATISTICS, INCREMENTGROUPCOMPONENTS, GROUPCALC,
% CALCTESTRESULTS, WRITETESTRESULTSTXT, GROUPCLEAR
%
% * Author: Dmitrii Leliuhin
% * Email: dleliuhin@mail.ru
% * Date: 11/05/2019 15:00:28
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

% Reading test dataset images from subfolders
f = dir(strcat(iPath, '*.jpg'));

for i = 1:length(f(:))
    clc;
    
    he = imread(fullfile(iPath, f(i).name));
    
    %     he = adaptiveGammaCorrection(he);
    
    stats = findGlcmStatistic(he);
    
    if (mod(i, iGroupValue) == 0)
        fprintf(iLogsFile, sprintf('%d -- %d \n', i - iGroupValue + 1, i));
        
        iGroup = incrementGroupComponents(iGroup, stats);
        oGroup = groupCalc(iGroup);
        
        decis = calcTestResults(iMarks, oGroup);
        writeTestResultsTxt(iLogsFile, iMarks, oGroup, decis);
        
        iGroup = groupClear(iGroup);
        oGroup = groupClear(oGroup);
        
        fprintf(iLogsFile, '\n');
    else
        iGroup = incrementGroupComponents(iGroup, stats);
    end
    
    clear stats he;
end

if (mod(i, iGroupValue) ~= 0)
    %> For remained
    fprintf(iLogsFile, 'Remained \n');
    
    oGroup = groupCalc(iGroup);
    
    decis = calcTestResults(iMarks, oGroup);
    writeTestResultsTxt(iLogsFile, iMarks, oGroup, decis);
    
    iGroup = groupClear(iGroup);
    oGroup = groupClear(oGroup);
    
    fprintf(iLogsFile, '\n');
end

end