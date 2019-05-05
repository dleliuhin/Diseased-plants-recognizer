function [ioGroupTable] = clearGroupTable(ioGroupTable)
%% CLEARGROUPTABLE 
% Summary of this function goes here. 
% 
% * Syntax 
% 
%	[OUTPUTARGS] = CLEARGROUPTABLE(INPUTARGS)
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
% * Date: 17/11/2018 01:01:30 
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

ioGroupTable.imageNames = [];
ioGroupTable.Attribute = [];
ioGroupTable.Component = [];
ioGroupTable.Healthy = [];
ioGroupTable.delta1 = [];
ioGroupTable.Test = [];
ioGroupTable.delta2 = [];
ioGroupTable.Ill = [];
ioGroupTable.Result = [];

end
