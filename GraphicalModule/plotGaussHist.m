%The function that plot Gaussians different order
function plotGaussHist(nhAttribute,hAttribute,nameHist,typeApproximation,numbns,coefStd)

%histogram(nh_R_Contrast1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nhAttribute, numbns,'Normalization','probability');
nh_edges = findInterBins(nh_edges);
nh_num = medfilt1(nh_num'); nh_edges = nh_edges';
%ar=trapz(nh_edges,nh_num);
%nh_num = nh_num./ar;
nh_f = fit(nh_edges, nh_num, typeApproximation);
[nh_f,nh_edges,nh_num] = fitByMeanStd(nh_f,nh_edges,nh_num,typeApproximation,coefStd);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([-1,2]); ylim([0,1]);
title(strcat('Gaussian ',nameHist),'fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;

%histogram(h_R_Contrast1,'FaceColor','b','NumBins',numbns);
[h_num, h_edges] = histcounts(hAttribute, numbns,'Normalization','probability');
h_edges = findInterBins(h_edges);
h_num = medfilt1(h_num'); h_edges = h_edges';
%ar=trapz(h_edges,h_num);
%h_num = h_num./ar;
h_f = fit(h_edges, h_num, typeApproximation);
[h_f,h_edges,h_num] = fitByMeanStd(h_f,h_edges,h_num,typeApproximation,coefStd);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение','Location','Best');
%annotation('textbox',[.1 .2 .2 .2],'String',['Супремум: ', num2str(round(sup_R_Contrast1,3))],'HorizontalAlignment','left');
hold off;

%ar = []; h_mean = []; nh_mean = []; nh_std = []; h_std = [];
nh_f = []; h_f = []; 
nh_num = []; nh_edges = []; h_num = []; h_edges = [];
end