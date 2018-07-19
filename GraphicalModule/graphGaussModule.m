function graphGaussModule(h,nh,typeApproximation,numbns,coefStd)
%-----------------Stats_R histogram-----------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.R.Contrast,h.R.Contrast,' stats R.Contrast',typeApproximation,numbns,coefStd);

subplot(2,2,2);
plotGaussHist(nh.R.Correlation,h.R.Correlation,' stats R.Correlation',typeApproximation,numbns,coefStd);

subplot(2,2,3);
plotGaussHist(nh.R.Energy,h.R.Energy,' stats R.Energy',typeApproximation,numbns,coefStd);

subplot(2,2,4);
plotGaussHist(nh.R.Homogeneity,h.R.Homogeneity,' stats R.Energy',typeApproximation,numbns,coefStd);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/R.jpg');
saveas(gcf,'Result/graphGaussResults/R.fig');

%-----------------Stats_G histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.G.Contrast,h.G.Contrast,' stats G.Contrast',typeApproximation,numbns,coefStd);

subplot(2,2,2);
plotGaussHist(nh.G.Correlation,h.G.Correlation,' stats G.Correlation',typeApproximation,numbns,coefStd);

subplot(2,2,3);
plotGaussHist(nh.G.Energy,h.G.Energy,' stats G.Energy',typeApproximation,numbns,coefStd);

subplot(2,2,4);
plotGaussHist(nh.G.Homogeneity,h.G.Homogeneity,' stats G.Homogeneity',typeApproximation,numbns,coefStd);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/G.jpg');
saveas(gcf,'Result/graphGaussResults/G.fig');

%-----------------Stats_B histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.B.Contrast,h.B.Contrast,' stats B.Contrast',typeApproximation,numbns,coefStd);

subplot(2,2,2);
plotGaussHist(nh.B.Correlation,h.B.Correlation,' stats B.Correlation',typeApproximation,numbns,coefStd);

subplot(2,2,3);
plotGaussHist(nh.B.Energy,h.B.Energy,' stats B.Energy',typeApproximation,numbns,coefStd);

subplot(2,2,4);
plotGaussHist(nh.B.Homogeneity,h.B.Homogeneity,' stats B.Homogeneity',typeApproximation,numbns,coefStd);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/B.jpg');
saveas(gcf,'Result/graphGaussResults/B.fig');

%-----------------Stats_RG histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.RG.Contrast,h.RG.Contrast,' stats RG.Contrast',typeApproximation,numbns,coefStd);

subplot(2,2,2);
plotGaussHist(nh.RG.Correlation,h.RG.Correlation,' stats RG.Correlation',typeApproximation,numbns,coefStd);

subplot(2,2,3);
plotGaussHist(nh.RG.Energy,h.RG.Energy,' stats RG.Energy',typeApproximation,numbns,coefStd);

subplot(2,2,4);
plotGaussHist(nh.RG.Homogeneity,h.RG.Homogeneity,' stats RG.Homogeneity',typeApproximation,numbns,coefStd);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/RG.jpg');
saveas(gcf,'Result/graphGaussResults/RG.fig');

%-----------------Stats_RB histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.RB.Contrast,h.RB.Contrast,' stats RB.Contrast',typeApproximation,numbns,coefStd);

subplot(2,2,2);
plotGaussHist(nh.RB.Correlation,h.RB.Correlation,' stats RB.Correlation',typeApproximation,numbns,coefStd);

subplot(2,2,3);
plotGaussHist(nh.RB.Energy,h.RB.Energy,' stats RB.Energy',typeApproximation,numbns,coefStd);

subplot(2,2,4);
plotGaussHist(nh.RB.Homogeneity,h.RB.Homogeneity,' stats RB.Homogeneity',typeApproximation,numbns,coefStd);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/RB.jpg');
saveas(gcf,'Result/graphGaussResults/RB.fig');

%-----------------Stats_GB histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.GB.Contrast,h.GB.Contrast,' stats GB.Contrast',typeApproximation,numbns,coefStd);

subplot(2,2,2);
plotGaussHist(nh.GB.Correlation,h.GB.Correlation,' stats GB.Correlation',typeApproximation,numbns,coefStd);

subplot(2,2,3);
plotGaussHist(nh.GB.Energy,h.GB.Energy,' stats GB.Energy',typeApproximation,numbns,coefStd);

subplot(2,2,4);
plotGaussHist(nh.GB.Homogeneity,h.GB.Homogeneity,' stats GB.Homogeneity',typeApproximation,numbns,coefStd);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/GB.jpg');
saveas(gcf,'Result/graphGaussResults/GB.fig');
end