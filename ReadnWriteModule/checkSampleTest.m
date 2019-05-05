function checkSampleTest(marks, iGroupValue)
%% CHECKSAMPLETEST
% Check sample test from specific sample test folders and
% write results to SampleTestResult.txt file 
% 
% * Syntax
%
% [] = CHECKSAMPLETEST(MARKS, GROUPVALUE)
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
% INITIALIZESAMPLETESTPLGROUPS, FINDGLCMSTATISTIC, 
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

clc;

fullFileName = 'Result/PercentRecognition/TestResult.txt';

% Opening output .txt file for writing.
resFileName = fopen(fullFileName, 'w');

% Writing column names
% fprintf(resFileName, strcat('imagenames \t\t\t\t| atribute | Stats', ...
%       '          | Healthy | delta  | Test   | delta  | Ill    | Result'));
% fprintf(resFileName, '\n\n');                 

fclose(resFileName);

% Reading sample test image files from folders.
fileName_add.h = dir('Material/Healthy_add/*.jpg');
fileName_add.nh1 = dir('Material/Diseased_1_add/*.jpg');


% diseaseCode = 'undef';
% 
% count.h = 0; %>
% count.nh1 = 0; %>
% res.h = 0; %>
% res.(diseaseCode) = 0; %>
% attribute = 1; %>
% iterCount = 0; %>
% 
% tests = initializeSampleTestPlGroups();
% 
% resFileName = fopen('Result/PercentRecognition/TestResult.txt', 'a');
% 
% for i = 1:length(fileName_add.h(:))
% %%
%     % Read image of a healthy leaf of a plant from graphics file
%     he = imread(fullfile('Material/Healthy_add', fileName_add.h(i).name));
%     
%     stats = findGlcmStatistic(he);
%     
%     tests.h = incrementHealthyComponents(tests.h, stats);
%     
% %     tests.h = checkStatsNan(tests.h);
%     
%     if ((mod(i, groupValue) == 0) && (i >= groupValue))
%         res = writeGroupResult(resFileName, ...
%                                tests.h, ...
%                                marks.leaves.h, ...
%                                fileName_add.h(i - groupValue + 1).name, ...
%                                fileName_add.h(i).name, ...
%                                attribute, ...
%                                count, ...
%                                res);
%                            
%         tests = setNullTestStats();
%         iterCount = iterCount + 1;
%     end
%     
%     clear stats r g b rgb_image;
%     clear fR fG fB fRG fRB fGB glcm;
%     clear he hef;
% end
% 
% fprintf(resFileName, ...
%         '\n Final percent correct recognition: %3.2f%% \n', ...
%         res.h / iterCount * 100);
% fprintf(resFileName, ...
%         ' Final percent failed recognition: %3.2f%% \n\n\n', ...
%         res.(diseaseCode) / iterCount * 100);
% 
    

%Start testing ill plantics

groupTable = initializeGroupTable();
TableColumns = initializeTableColumns();

resFileName = fopen(fullFileName, 'a');

diseaseCode = 'nh1';

Statistics = initializeGroupStatistics(diseaseCode, 0);

iterCount = 0;

tests = initializeSampleTestPlGroups();

for i = 1:length(fileName_add.(diseaseCode)(:))

    he = imread(fullfile('Material/Diseased_1_add', ...
                fileName_add.(diseaseCode)(i).name));
    
    stats = findGlcmStatistic(he);
    
    tests.(diseaseCode) = incrementDiseasedComponents(tests. ...
                                                      (diseaseCode), ...
                                                      stats);
    
%     tests.nh = checkStatsNan(tests.nh);
    
    if ((mod(i, iGroupValue) == 0) && (i >= iGroupValue))
        
        [Statistics, ...
         TableColumns] = writeGroupResult(resFileName, ...
                                          iGroupValue, ...
                                          diseaseCode, ...
                                          tests.(diseaseCode), ...
                                          marks, ...
                      fileName_add.(diseaseCode)(i-iGroupValue+1).name, ...
                                    fileName_add.(diseaseCode)(i).name, ...
                                          Statistics, ...
                                          TableColumns);
        
        groupTable = incrementGroupTable(groupTable, TableColumns);
                                      
%         writetable(groupTable, fullFileName);
        disp(groupTable);
        
        printGroupVerdict(resFileName, Statistics);
        
        TableColumns(:,:) = [];
        groupTable(:,:) = [];
        groupTable = clearGroupTable(groupTable);
        
        tests = setNullTestStats();
        iterCount = iterCount + 1;
    end
     
    clear stats r g b rgb_image;
    clear fR fG fB fRG fRB fGB glcm;
    clear he hef;
end

%fprintf(resFileName, ...
fprintf(...
        '\n Final percent correct recognition: %3.2f%% \n', ...
        Statistics.res.(diseaseCode) / iterCount * 100);
%fprintf(%resFileName, ...
fprintf(...
        ' Final percent failed recognition: %3.2f%% \n\n\n', ...
        Statistics.res.h / iterCount * 100);

fclose(resFileName);

end