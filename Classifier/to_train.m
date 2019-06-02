function [] = to_train(iGroup)
%% TO_TRAIN 
% Function which get feature vector. 
% 
% * Syntax 
% 
% [] = TO_TRAIN(IOGROUP)
% 
% * Input 
% 
% -- iGroup - structure with allocated memory for healthy and
%             diseased part of a plants.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% TO_TRAIN_GROUP
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 05/05/2019 19:12:31 
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

iGroup.h = to_train_group('Dataset/Wheat/Train/Healthy/', iGroup.h);

iGroup.nh1 = to_train_group('Dataset/Wheat/Train/Diseased_1/', iGroup.nh1);
iGroup.nh2 = to_train_group('Dataset/Wheat/Train/Diseased_2/', iGroup.nh2);
iGroup.nh3 = to_train_group('Dataset/Wheat/Train/Diseased_3/', iGroup.nh3);
iGroup.nh4 = to_train_group('Dataset/Wheat/Train/Diseased_4/', iGroup.nh4);
iGroup.nh5 = to_train_group('Dataset/Wheat/Train/Diseased_5/', iGroup.nh5);
iGroup.nh6 = to_train_group('Dataset/Wheat/Train/Diseased_6/', iGroup.nh6);
iGroup.nh7 = to_train_group('Dataset/Wheat/Train/Diseased_7/', iGroup.nh7);
iGroup.nh8 = to_train_group('Dataset/Wheat/Train/Diseased_8/', iGroup.nh8);
iGroup.nh9 = to_train_group('Dataset/Wheat/Train/Diseased_9/', iGroup.nh9);
iGroup.nh10 = to_train_group('Dataset/Wheat/Train/Diseased_10/', iGroup.nh10);

plants = iGroup;

save('Workspaces/cutPlants.mat', 'plants');

end
