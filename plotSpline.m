function plotSpline(nhAttribute,hAttribute,nameHist,numbns)
[nh_num, nh_edges] = histcounts(nhAttribute, numbns,'Normalization','probability');
nh_edges = findInterBins(nh_edges);
nh_num = medfilt1(nh_num'); nh_edges = nh_edges';
nh_xx=linspace(min(nh_edges),max(nh_edges),length(nh_edges)*10);
nh_yy=spline(nh_edges,nh_num,nh_xx);
plot(nh_edges,nh_num,'r.',nh_xx,nh_yy,'r-');
xlim([0,1]); ylim([0,1]);
title(strcat('Spline ',nameHist),'fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
[h_num, h_edges] = histcounts(hAttribute, numbns,'Normalization','probability');
h_edges = findInterBins(h_edges);
h_num = medfilt1(h_num'); h_edges = h_edges';
h_xx=linspace(min(h_edges),max(h_edges),length(h_edges)*10);
h_yy=spline(h_edges,h_num,h_xx);
plot(h_edges,h_num,'b.',h_xx,h_yy,'b-');
legend('points','Больное растение','points','Здоровое растение','Location','Best');
hold off;
nh_xx = []; nh_yy = []; h_xx = []; h_yy = [];
nh_num = []; nh_edges = []; h_num = []; h_edges = [];
end