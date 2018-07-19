function [f,edges,num]=fitIncremention(f,edges,num,mean,std,typeApproximation,coefStd)
i = -coefStd:coefStd;
for i = i(i~=0)
    buf = mean+i*std;
    if (i < 0)
        index = find(buf > edges);
        edges = insertAtLeft(edges, buf, index);
        index = find(buf == edges);
        num = insertAtLeft(num, f(edges(index)), index);
        f = fit(edges, num, typeApproximation);
    elseif (i > 0)
        index = find(buf < edges);
        edges = insertAtRight(edges, buf, index);
        index = find(buf == edges);
        num = insertAtRight(num, f(edges(index)), index);
        f = fit(edges, num, typeApproximation);
    end
    buf = []; index = [];
end
end