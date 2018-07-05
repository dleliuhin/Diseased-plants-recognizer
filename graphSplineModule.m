function graphSplineModule(h,nh,numbns)
%-----------------Stats_R histogram-----------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotSpline(nh.R.Contrast,h.R.Contrast,' stats R.Contrast',numbns);

subplot(2,2,2);
plotSpline(nh.R.Correlation,h.R.Correlation,' stats R.Correlation',numbns);

subplot(2,2,3);
plotSpline(nh.R.Energy,h.R.Energy,' stats R.Energy',numbns);

subplot(2,2,4);
plotSpline(nh.R.Homogeneity,h.R.Homogeneity,' stats R.Homogeneity',numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphSplineResults/R.jpg');
saveas(gcf,'Result/graphSplineResults/R.fig');

%-----------------Stats_G histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotSpline(nh.G.Contrast,h.G.Contrast,' stats G.Contrast',numbns);

subplot(2,2,2);
plotSpline(nh.G.Correlation,h.G.Correlation,' stats G.Correlation',numbns);

subplot(2,2,3);
plotSpline(nh.G.Energy,h.G.Energy,' stats G.Energy',numbns);

subplot(2,2,4);
plotSpline(nh.G.Homogeneity,h.G.Homogeneity,' stats G.Homogeneity',numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphSplineResults/G.jpg');
saveas(gcf,'Result/graphSplineResults/G.fig');

%-----------------Stats_B histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotSpline(nh.B.Contrast,h.B.Contrast,' stats B.Contrast',numbns);

subplot(2,2,2);
plotSpline(nh.B.Correlation,h.B.Correlation,' stats B.Correlation',numbns);

subplot(2,2,3);
plotSpline(nh.B.Energy,h.B.Energy,' stats B.Energy',numbns);

subplot(2,2,4);
plotSpline(nh.B.Homogeneity,h.B.Homogeneity,' stats B.Homogeneity',numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphSplineResults/B.jpg');
saveas(gcf,'Result/graphSplineResults/B.fig');

%-----------------Stats_RG histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotSpline(nh.RG.Contrast,h.RG.Contrast,' stats RG.Contrast',numbns);

subplot(2,2,2);
plotSpline(nh.RG.Correlation,h.RG.Correlation,' stats RG.Correlation',numbns);

subplot(2,2,3);
plotSpline(nh.RG.Energy,h.RG.Energy,' stats RG.Energy',numbns);

subplot(2,2,4);
plotSpline(nh.RG.Homogeneity,h.RG.Homogeneity,' stats RG.Homogeneity',numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphSplineResults/RG.jpg');
saveas(gcf,'Result/graphSplineResults/RG.fig');

%-----------------Stats_RB histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotSpline(nh.RB.Contrast,h.RB.Contrast,' stats RB.Contrast',numbns);

subplot(2,2,2);
plotSpline(nh.RB.Correlation,h.RB.Correlation,' stats RB.Correlation',numbns);

subplot(2,2,3);
plotSpline(nh.RB.Energy,h.RB.Energy,' stats RB.Energy',numbns);

subplot(2,2,4);
plotSpline(nh.RB.Homogeneity,h.RB.Homogeneity,' stats RB.Homogeneity',numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphSplineResults/RB.jpg');
saveas(gcf,'Result/graphSplineResults/RB.fig');

%-----------------Stats_GB histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotSpline(nh.GB.Contrast,h.GB.Contrast,' stats GB.Contrast',numbns);

subplot(2,2,2);
plotSpline(nh.GB.Correlation,h.GB.Correlation,' stats GB.Correlation',numbns);

subplot(2,2,3);
plotSpline(nh.GB.Energy,h.GB.Energy,' stats GB.Energy',numbns);

subplot(2,2,4);
plotSpline(nh.GB.Homogeneity,h.GB.Homogeneity,' stats GB.Homogeneity',numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphSplineResults/GB.jpg');
saveas(gcf,'Result/graphSplineResults/GB.fig');
end