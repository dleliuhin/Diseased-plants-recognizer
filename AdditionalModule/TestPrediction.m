typeApproximation = 'gauss1';
coefStd = 3;

h_edges = [0.64        0.72         0.8        0.88        0.96]';
h_num = [0.025       0.225       0.275       0.275       0.175]';

nh_edges = [0.505       0.615       0.725       0.835       0.945]';
nh_num = [0.075       0.175       0.325       0.325       0.075]';

nh_mean = mean(nh_edges);
nh_std = std(nh_edges);

h_mean = mean(h_edges);
h_std = std(h_edges);

nh_f = fit(nh_edges, nh_num, typeApproximation);
h_f = fit(h_edges, h_num, typeApproximation);

xx = min(nh_edges):0.001:max(nh_edges);
yy = nh_f(xx);

nh_mean = xx(find(yy==max(yy)));
nh_std = std(xx);
nh_edges = xx;
nh_edges = nh_edges(nh_edges >= nh_mean-coefStd*nh_std & nh_edges <= nh_mean+coefStd*nh_std)';
nh_num = nh_f(nh_edges);

xx = min(h_edges):0.001:max(h_edges);
yy = h_f(xx);

h_mean = xx(find(yy==max(yy)));
h_std = std(xx);
h_edges = xx;
h_edges = h_edges(h_edges >= h_mean-coefStd*h_std & h_edges <= h_mean+coefStd*h_std)';
h_num = h_f(h_edges);

[nh_f,nh_edges,nh_num]=fitIncremention(nh_f,nh_edges,nh_num,nh_mean,nh_std,typeApproximation,coefStd);
[h_f,h_edges,h_num]=fitIncremention(h_f,h_edges,h_num,h_mean,h_std,typeApproximation,coefStd);

clear xx yy;

figure
plot(nh_f,'r-',nh_edges, nh_num,'r.');
hold on
xlim([min([min(h_edges) min(nh_edges)]),max([max(h_edges) max(nh_edges)])]);
plot(h_f,'b-',h_edges, h_num,'b.');
hold off
