function arrOut = insertAtLeft(arrIn,val,index)
    if isempty(index)
        arrOut = vertcat(val, arrIn);
    else
        arrOut = vertcat(arrIn(1:index-1), val, arrIn(index:end));
    end
end