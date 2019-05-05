function main()
%% MAIN 
% Plant disease recognition program from images.
% 
% * Syntax
%
% [] = MAIN()
% 
% * Examples: 
% 
% Provide sample usage code here.
% 
% * See also: 
%
% INITIALIZEPLANTICGROUPS, FINDGLCMSTATISTIC, INITIALIZEMARKS, 
% INITIALIZEPLOTSVALUES, GRAPHGAUSSSUBMODULE, GETMARKS, 
% WRITEXLSXAVERAGES, WRITEXLSXEACHDATA, CHECKSAMPLETEST
%           
% * Authors: Dmitrii Leliuhin, Vladimir Tutigin
% * Email: dleliuhin@mail.ru 
% * Date: 17/07/2018 15:30:25 
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a  
% 
% * Warning: 
% 
% # Program works stable only for Windows.
% # Change adding subfolders given your system configurations.
% 
% * TODO: 
% 
% # Change parsing method for images from directories.
% 

%% Code 
clc;
clear;
close all;

% Adding module paths
addpath(strcat(pwd,'\TransformModule'),strcat(pwd,'\AdditionalModule'),'-end');
savepath;
addpath(strcat(pwd,'\GraphicalModule'),strcat(pwd,'\ReadnWriteModule'),'-end');
savepath;
addpath(strcat(pwd,'\InitializeModule'),'-end');
savepath;

% Reading image files from folders
f = dir('Material/Healthy/*.jpg');
fd = dir('Material/Diseased_1/*.jpg');

% Concatenating image files into one array
f=[f;fd];

% Creating array of image file names
fileName = {f.name};

% Allocate memory for dynamic arrays of structures h and nh.
leaves = initializePlanticGroups();

for i = 1:length(f(:))
%% 
    clc;

    if (i <= (length(f(:))/2))
        %%
        % Read image of a healthy leaf of a plant from graphics file
        he = imread(fullfile('Material/Healthy', f(i).name));
    else
        %%
        % Read image of a diseased leaf of a plant from graphics file
        he = imread(fullfile('Material/Diseased_1', f(i).name));
    end
    
    stats = findGlcmStatistic(he);
  
    if(i <= (length(f(:))/2))
        %%
        leaves.h = incrementHealthyComponents(leaves.h, stats);
    else
        %%
        leaves.nh1 = incrementDiseasedComponents(leaves.nh1, stats);        
    end
    
    % Writing statistical characteristics to <Result/Results.xlsx> file
    % on every loop iteration
    %writeXlsxData(fileName,i,stats);

    clear stats he;
    close all;
end

% leaves.h = checkStatsNan(leaves.h);
% leaves.nh = checkStatsNan(leaves.nh);

%-----------------------Finding averages attributes-------------------

% averAtrb(leaves.h, leaves.nh);

%-----------------------Finding mean and SKO of arrays----------------

% writeMeanSko(leaves.h, leaves.nh);

%----------------------Aligning ranges of arrays----------------------

% leaves = alignRanges(leaves);

%-----------------------Finding supremums--------------------------------

% sup = writeXlsxSup(numbns, leaves);

%% Initializing preplotting parameters
marks = initializeMarks();
plotGaussValues = initializePlotsValues();
% plotHistValues =  initializePlotsValues();

binsValue = 9; %> Number of histogram columns.
typeApproximation = 'gauss1'; %> Type of approximation.
coefStd = 3; %> Deviation coefficient of distribution density function.

%% Plot graphical results using Gaussian method
plotGaussValues = graphGaussSubModule(plotGaussValues, ...
                                      leaves, ...
                                      typeApproximation, ...
                                      binsValue, ...
                                      coefStd);
close all;
 
% plotHistValues = graphHistogramModule(leaves, ...
%                                       plotHistValues, ...
%                                       binsValue);
% close all;

marks = getMarks(marks, plotGaussValues);
% marks = getMarks(marks, plotHistValues);

% writeXlsxAverages('Averages', marks);
% 
% writeXlsxEachData('RecRes', strtok(fileName(:), '.'), leaves);

% writeXlsxMean(means);

%% Checking sample test
tic
groupValue = 10; %> Number of images in one group. 
% checkSampleTest(marks, groupValue);
toc
% Plot graphical results using Spline method
% graphSplineModule(h,nh,numbns);

close all;

end