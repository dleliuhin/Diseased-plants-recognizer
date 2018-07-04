function [A,B]=histdimcompare(A, B)
%Метод добавления "фальшивых точек" для выравнивания диапазонов
%двух массивов (для здорового и больного растения), по которым
%строим гистограммы

    assert(length(A)==length(B),'Differents arrays dimensions');
    
% 1 - |____A____|__|____B____|
    if ((min(A) < min(B))&&(min(B) < max(A))&&(max(A) < max(B)))
        A(end+1) = max(B);
        B(end+1) = min(A);
    elseif ((min(B) < min(A))&&(min(A) < max(B))&&(max(B) < max(A)))
        B(end+1) = max(A);
        A(end+1) = min(B);
    end

% 2 - |___A___|   |___B___|
    if ((min(A) < min(B))&&(max(A) < min(B)))
        A(end+1) = min(B);
        B(end+1) = max(A);
    elseif ((min(B) < min(A))&&(max(B) < min(A)))
        B(end+1) = min(A);
        A(end+1) = max(B);        
    end
    
% 3 - |B____|__A__|____B|
    if ((min(B) < min(A))&&(max(A) < max(B)))
        A(end+1) = min(B);
        A(end+1) = max(B);
        B(end+1) = min(B);
        B(end+1) = max(B);
    elseif ((min(A) < min(B))&&(max(B) < max(A)))
        B(end+1) = min(A);
        B(end+1) = max(A);    
        A(end+1) = min(A);
        A(end+1) = max(A);
    end
    
    assert(length(A)==length(B),'Differents arrays dimensions');
    
    A = sort(A);
    B = sort(B);
end