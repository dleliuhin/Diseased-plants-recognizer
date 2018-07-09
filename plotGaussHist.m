function plotGaussHist(nhAttribute,hAttribute,nameHist,typeApproximation,numbns)
%histogram(nh_R_Contrast1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nhAttribute, numbns,'Normalization','probability');
nh_edges = findInterBins(nh_edges);
nh_num = medfilt1(nh_num'); nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
ar=trapz(nh_edges,nh_num);
plot(nh_f,'r-',nh_edges, nh_num./ar,'r.');
xlim([0,1]); ylim([0,1]);
title(strcat('Gaussian ',nameHist),'fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_R_Contrast1,'FaceColor','b','NumBins',numbns);
[h_num, h_edges] = histcounts(hAttribute, numbns,'Normalization','probability');
h_edges = findInterBins(h_edges);
h_num = medfilt1(h_num'); h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
ar=trapz(h_edges,h_num);
plot(h_f,'b-',h_edges, h_num./ar,'b.');
legend('points','Больное растение','points','Здоровое растение','Location','Best');
%annotation('textbox',[.1 .2 .2 .2],'String',['Супремум: ', num2str(round(sup_R_Contrast1,3))],'HorizontalAlignment','left');
hold off;
ar = []; nh_f = []; h_f = []; 
nh_num = []; nh_edges = []; h_num = []; h_edges = [];
end