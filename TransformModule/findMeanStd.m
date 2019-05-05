function [mn]=findMeanStd(edges, num)
    if all(num ~= 0)
        mn = edges(num == max(num));
    else
        mn = mean(edges);
    end
end