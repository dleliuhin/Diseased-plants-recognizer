function [] = remove_Nans(iPlants)
%% REMOVE_NANS 
% Remove all NaN values from each structure field. 
% 
% * Syntax 
% 
% [OUTPUTARGS] = REMOVE_NANS(INPUTARGS)
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
% * Date: 06/05/2019 00:10:31 
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

fn = fieldnames(iPlants);

for i = 1:numel(fn)
    fn_group = fieldnames(getfield(iPlants, fn{i}));
    
    for j = 1:numel(fn_group)
        fn_group_comp = fieldnames(getfield(iPlants, fn{i}, fn_group{j}));
        
        for k = 1:numel(fn_group_comp)
            fn_group_comp_stat = getfield(iPlants, fn{i}, fn_group{j}, fn_group_comp{k});
            
            fn_group_comp_stat = fn_group_comp_stat(~isnan(fn_group_comp_stat));
            
            iPl = setfield(iPlants, fn{i}, fn_group{j}, fn_group_comp{k}, fn_group_comp_stat);
        end
    end
end

end
