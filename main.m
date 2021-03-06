function main()
%% MAIN 
% Plant's leaf disease recognition program from images.
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
% INITIALIZEPLANTICGROUPS, TO_TRAIN, INITIALIZEMARKS, 
% INITIALIZEPLOTSVALUES, GRAPHGAUSSSUBMODULE, GETMARKS, 
% GETSTDAVERVALUE, TO_TEST
%           
% * Authors: Dmitrii Leliuhin, Vladimir Tutigin
% * Email: dleliuhin@gmail.com
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
addpath(strcat(pwd,'\NormalizeModule'),'-end');
savepath;
addpath(strcat(pwd,'\TransformModule'),strcat(pwd,'\AdditionalModule'),'-end');
savepath;
addpath(strcat(pwd,'\GraphicalModule'),strcat(pwd,'\ReadnWriteModule'),'-end');
savepath;
addpath(strcat(pwd,'\InitializeModule'),strcat(pwd,'\Classifier'),'-end');
savepath;

%% INIT FEATURE DATASET
plants = initializePlanticGroups();
to_train(plants);

%% LOAD FEATURE DATASET

% load('Workspaces/plants.mat');
% load('Workspaces/normalizedplants.mat');
% load('Workspaces/cutPlants.mat');

% remove_Nans(plants);

%-----------------------Finding averages attributes-------------------

% averAtrb(leaves.h, leaves.nh);

%-----------------------Finding mean and SKO of arrays----------------

% writeMeanSko(leaves.h, leaves.nh);

%----------------------Aligning ranges of arrays----------------------

% leaves = alignRanges(leaves);

%-----------------------Finding supremums--------------------------------

% sup = writeXlsxSup(numbns, leaves);


%% PLOT BLOCK
% Initializing preplotting parameters
marks = initializeMarks();
plotGaussValues = initializePlotsValues();
% plotHistValues =  initializePlotsValues();

binsValue = 9; %> Number of histogram columns.
typeApproximation = 'gauss1'; %> Type of approximation.
coefStd = 2; %> Deviation coefficient of distribution density function.

% Plot graphical results using Gaussian method
plotGaussValues = graphGaussSubModule(plotGaussValues, ...
                                      plants, ...
                                      typeApproximation, ...
                                      binsValue, ...
                                      coefStd);
close all;
 
% plotHistValues = graphHistogramModule(leaves, ...
%                                       plotHistValues, ...
%                                       binsValue);
% close all;

%% ADD FEATURES

% load('Workspaces/cutMarks.mat');
marks = getMarks(marks, plotGaussValues);
% marks = getMarks(marks, plotHistValues);

average_cnt = getStdAverValue(marks);

% writeXlsxAverages('Averages', marks);
% 
% writeXlsxEachData('RecRes', strtok(fileName(:), '.'), leaves);

% writeXlsxMean(means);

%% TEST DATASET
tic
groupValue = average_cnt^2; %> Number of images in one group. 

to_test('Dataset/Wheat/Test/All/', marks, groupValue);

% checkSampleTest(marks, groupValue);
toc
% Plot graphical results using Spline method
% graphSplineModule(h,nh,numbns);

close all;

end