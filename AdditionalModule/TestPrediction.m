typeApproximation = 'gauss1';
coefStd = 3;

h_edges = [0.0185,0.0555,0.0925,0.1295,0.1665]';
h_num = [0.0750,0.2250,0.2750,0.2750,0.0250]';

nh_edges = [0.0450,0.1350,0.2250,0.3150,0.4050]';
nh_num = [0.0750,0.3500,0.3500,0.1250,0.0250]';

nh_mean = mean(nh_num);
nh_std = std(nh_num);

h_mean = mean(h_num);
h_std = std(h_num);

nh_f = fit(nh_edges, nh_num, typeApproximation);
h_f = fit(h_edges, h_num, typeApproximation);

[nh_f,nh_edges,nh_num]=fitIncremention(nh_f,nh_edges,nh_num,nh_mean,nh_std,typeApproximation,coefStd);
[h_f,h_edges,h_num]=fitIncremention(h_f,h_edges,h_num,h_mean,h_std,typeApproximation,coefStd);

figure
plot(nh_f,'r-',nh_edges, nh_num,'r.');
hold on
plot(h_f,'b-',h_edges, h_num,'b.');
hold off
