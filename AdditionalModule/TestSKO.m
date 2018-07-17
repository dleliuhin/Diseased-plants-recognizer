
m1=0.19;
m2=0.175;
sko1=0.15;
sko2=0.12;

x1=[];x2=[];
y1=[];y2=[];

x1=-0.4:0.003:0.8;
x2=x1;

for i=1:length(x1)
    y1(i)=exp(-((x1(i)-m1)^2)/(2*sko1^2))/(sqrt(2*pi)*sko1);
    y2(i)=exp(-((x2(i)-m2)^2)/(2*sko2^2))/(sqrt(2*pi)*sko2);
end

amp1=1/(sqrt(2*pi)*sko1);
amp2=1/(sqrt(2*pi)*sko2);

ar1=trapz(x1,y1);
ar2=trapz(x2,y2);

plot(x1,y1./ar1,'r-',x2,y2./ar2,'b-');
xlim([min(x1),max(x1)]);