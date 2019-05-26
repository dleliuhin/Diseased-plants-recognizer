function [oGroupTable] = initializeGroupTable()
%% INITIALIZEGROUPTABLE 
% Summary of this function goes here. 
% 
% * Syntax 
% 
%	[OUTPUTARGS] = INITIALIZEGROUPTABLE(INPUTARGS)
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
% * Date: 16/11/2018 21:04:49 
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

oGroupTable = table;

oGroupTable.imageNames = '';
oGroupTable.Attribute = '';
oGroupTable.Component = '';
oGroupTable.Healthy = zeros(0);
oGroupTable.delta1 = zeros(0);
oGroupTable.Test = zeros(0);
oGroupTable.delta2 = zeros(0);
oGroupTable.Ill = zeros(0);
oGroupTable.Result = zeros(0);

end
