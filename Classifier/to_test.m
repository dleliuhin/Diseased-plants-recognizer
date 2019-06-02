function [] = to_test(iPath, iMarks, iGroupValue)
%% TO_TEST 
% Calulating and comparing sample test.
% 
% * Syntax 
% 
% [] = TO_TEST(IPATH, IMARKS, IGROUPVALUE)
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
% -- iGroupValue - Number of images in one group. 
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% INITIALIZEINDICATOR, TO_TEST_GROUP
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 11/05/2019 14:38:43 
% * Version: 1.0 $ s
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

logsFullFileName = 'Result/PercentRecognition/TestResult.txt';
logsFile = fopen(logsFullFileName, 'w');

% Writing column names
fprintf(logsFile, strcat('imagenames \t| Channel | Stats', ...
      ' \t\t || Test  ||', ...
      '  h   | in |   d   | r ||', ...
      ' nh1  | in |  d1   | r ||', ...
      ' nh2  | in |  d2   | r ||', ...
      ' nh3  | in |  d3   | r ||', ...
      ' nh4  | in |  d4   | r ||', ...
      ' nh5  | in |  d5   | r ||', ...
      ' nh6  | in |  d6   | r ||', ...
      ' nh7  | in |  d7   | r ||', ...
      ' nh8  | in |  d8   | r ||', ...
      ' nh9  | in |  d9   | r ||', ...
      ' nh10 | in |  d10  | r ||', ...
      ' Result'));
fprintf(logsFile, '\n\n');                 

groupTest = initializeIndicator();

to_test_group(iPath, iMarks, groupTest, iGroupValue, logsFile);

fclose(logsFile);

end
