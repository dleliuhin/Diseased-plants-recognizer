function [] = writeTestResultsTxt(iLogsFile, iMarks, iGroup, decis)
%% WRITETESTRESULTSTXT
% Summary of this function goes here.
%
% * Syntax
%
% [OUTPUTARGS] = WRITETESTRESULTSTXT(INPUTARGS)
%
% * Input
%
% -- iLogsFile - file for output result logs.
%
% -- iMarks - filed structure of statistic "averages" and indicators
%             including mean, std, median, mode, range, minRange, maxRange
%             according to plot values.
%             Every indicator contains R, G, B, RG, RB, GB components.
%             Every component contains Contrast, Correlation, Energy,
%             Homogeneity properties.
%
% -- iGroup - filled structure for specific group of plant leaves 
%             by mean values.
%
% -- decis -
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
% * Date: 12/05/2019 19:13:46
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

fn = fieldnames(iGroup);
fn_group = fieldnames(iMarks);

index = 0;

for i = 1:length(fn)
    fn_stats = fieldnames(getfield(iGroup, fn{i}));
    
    for j = 1:length(fn_stats)
        
        index = index + 1;
        
        fn_stat_str = fn_stats{j};
        if (length(fn_stat_str) < 11)
            fn_stat_str = sprintf('%s  \t',fn_stat_str);
        end
        
        test_val = iGroup.(fn{i}).(fn_stats{j});
        
        if isnan(test_val)
            test_val_str = sprintf(' %s ', test_val);
        else
            test_val_str = sprintf('%1.3f', test_val);
        end
        
        fprintf(iLogsFile, strcat('\t\t\t|\t', ...
            sprintf('%s', fn{i}), ' \t  | ', ...
            sprintf('\t %s ||', fn_stat_str), ...
            sprintf(' %s ||', test_val_str)));
        
        for k = 1:length(fn_group)
            fn_group_mean_stats = fieldnames(getfield(iMarks, ...
                fn_group{k}, ...
                'means', ...
                fn{i}));
            
            if isnan(decis.(fn_group{k}).d(index))
                d_str = sprintf(' %s ', decis.(fn_group{k}).d(index));
            else
                d_str = sprintf('%1.3f', decis.(fn_group{k}).d(index));
            end
            
            if isnan(decis.(fn_group{k}).in(end))
                in_str = sprintf(' %s ', decis.(fn_group{k}).in(index));
            else
                in_str = sprintf(' %s ', num2str(decis.(fn_group{k}).in(index)));
            end
            
            if isnan(decis.(fn_group{k}).r(index))
                r_str = sprintf(' %s ', decis.(fn_group{k}).r(index));
            else
                r_str = sprintf(' %s ', num2str(decis.(fn_group{k}).r(index)));
            end
            
            fprintf(iLogsFile, ...
                strcat(sprintf(' %1.2f |', iMarks. ...
                (fn_group{k}). ...
                ('means'). ...
                (fn{i}). ...
                (fn_stats{j}) ), ...
                sprintf('%s |', in_str), ...
                sprintf(' %s |', d_str), ...
                sprintf('%s||', r_str)));
            
            
            %             if  (~isempty(iMarks.(fn_group{k}).('minRanges').(fn{i}).(fn_stats{j})) && ...
            %                     ~isempty(test_val) && ...
            %                     ~isempty(iMarks.(fn_group{k}).('maxRanges').(fn{i}).(fn_stats{j})))
            %
            %                 %                 if (~isnan(iMarks.(fn_group{k}).('minRanges').(fn{i}).(fn_stats{j})) && ...
            %                 %                     ~isnan(test_val) && ...
            %                 %                     ~isnan(iMarks.(fn_group{k}).('maxRanges').(fn{i}).(fn_stats{j})))
            %
            %                 if ((iMarks.(fn_group{k}).('minRanges').(fn{i}).(fn_stats{j}) < test_val) && ...
            %                         (test_val < iMarks.(fn_group{k}).('maxRanges').(fn{i}).(fn_stats{j})))
            %
            %                     %                     decis.(fn_group{k}).in(end + 1) = 1;
            %                     %                     %                     end
            %                     %                 else
            %                     %                     decis.(fn_group{k}).in(end + 1) = 0;
            %                     %                 end
            %                     %
            %                     %                 decis.(fn_group{k}).d(end + 1) = abs(iMarks. ...
            %                     %                     (fn_group{k}). ...
            %                     %                     ('means'). ...
            %                     %                     (fn{i}). ...
            %                     %                     (fn_stats{j}) - ...
            %                     %                     test_val);
            %
            %                 end
            %
            %             end
        end
        
        fprintf(iLogsFile, '\n');
    end
end

fprintf(iLogsFile, '\t\t\t\t\t\t\t\t\t || \t  ||');

bin_res_in = [];
bin_res_r = [];

for i = 1:length(fn_group)
    nnz_in = nnz(decis.(fn_group{i}).in == 1);
    nnz_r = nnz(decis.(fn_group{i}).r == 1);
    
    bin_res_in(end + 1) = nnz_in;
    bin_res_r(end + 1) = nnz_r;
    
    fprintf(iLogsFile, ...
        strcat(sprintf('  -   |'), ...
        sprintf(' %s |', num2str(nnz_in)), ...
        sprintf('   -   |'), ...
        sprintf(' %s ||', num2str(nnz_r))));
end
fprintf(iLogsFile, '\n');

max_val_in = max(bin_res_in);
idx_in = find(bin_res_in == max_val_in);

max_val_r = max(bin_res_r);
idx_r = find(bin_res_r == max_val_r);

fprintf(iLogsFile, strcat(sprintf('Result: \t'), ...
                          sprintf('\tCount in ranges = %s ;\t', num2str(max_val_in)), ...
                          sprintf('\tCount bin result = %s ;\t', num2str(max_val_r)), ...
                          sprintf('\tDiseased plant number = %s.', strcat(fn_group{idx_r}))));

fprintf(iLogsFile, '\n');                      

end
