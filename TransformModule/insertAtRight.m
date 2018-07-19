function arrOut = insertAtRight(arrIn,val,index)
    if isempty(index)
        arrOut = vertcat(arrIn, val);
    else
        arrOut = vertcat(arrIn(1:index-1), val, arrIn(index:end));
    end
end