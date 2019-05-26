function [ioGroup] = to_train_group(iPath, ioGroup)
%% TO_TRAIN_GROUP
% Function which get feature vector for specific plant group. 
% 
% * Syntax 
% 
% []=TO_TRAIN_GROUP(INPUTARGS)
% 
% * Input 
% 
% -- iPath - the relative path to dataset subfolder.
% 
% -- ioGroup - input specific group of plant leaves.
% 
% * Output 
% 
% -- ioGroup - output filled specific group of plant leaves.
% 
% * Examples: 
% 
% to_train('Dataset/Wheat/Train/Healthy/', leaves.h);
% 
% * See also: 
% 
% List related files here 
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 05/05/2019 18:16:48 
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

% Reading train dataset images from subfolders
f = dir(strcat(iPath, '*.jpg'));

for i = 1:length(f(:))
    clc;

    he = imread(fullfile(iPath, f(i).name));

%     he = adaptiveGammaCorrection(he);
    
    stats = findGlcmStatistic(he);
    
    ioGroup = incrementGroupComponents(ioGroup, stats);
    
    clear stats he;
end

end
