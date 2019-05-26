function [plNhAttrinute, ...
          plHAttrinute] = plotHist(nhAttribute, ...
                                        hAttribute, ...
                                        nameHist, ...
                                        numbns)
%% PLOTHIST 
% Summary of this function goes here. 
% 
% * Syntax 
% 
%	[OUTPUTARGS] = PLOTHIST(INPUTARGS) Explain usage here
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
% * Date: 12/10/2018 09:51:43 
% * Version: 0.1 $ 
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


histogram(nhAttribute,'FaceColor','b','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nhAttribute, ...
                                numbns, ...
                                'Normalization', ...
                                'probability');
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; 
nh_edges = nh_edges';
title(strcat('Historgram ', nameHist), 'fontsize', 10);
xlabel('x'); 
ylabel('f(x)', 'rotation', 1);
hold on;
plNhAttrinute.nums = nh_num;
plNhAttrinute.edges = nh_edges;

histogram(hAttribute,'FaceColor','r','NumBins',numbns);
[h_num, h_edges] = histcounts(hAttribute, ...
                              numbns, ...
                              'Normalization', ...
                              'probability');
h_edges = findInterBins(h_edges);
h_num = h_num'; 
h_edges = h_edges';
title(strcat('Historgram ', nameHist), 'fontsize', 10);
xlabel('x'); 
ylabel('f(x)', 'rotation', 1);
hold on;
plHAttrinute.nums = h_num;
plHAttrinute.edges = h_edges;

xlim([min([min(h_edges) min(nh_edges)]), ...
      max([max(h_edges) max(nh_edges)])]);
legend('points', 'Больное растение', ...
       'points', 'Здоровое растение', ...
       'Location', 'Best');
hold off;
plHAttrinute.nums = h_num;
plHAttrinute.edges = h_edges;

nh_f = []; h_f = []; 
nh_num = []; nh_edges = []; h_num = []; h_edges = [];
end


