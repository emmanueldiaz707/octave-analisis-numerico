function x = Jacobi(A,b,e)

    n = length(b);
    X = zeros(n,1);
    xn = X;
    aux = true;

    D = diag(diag(A));
    L = tril(A,-1);
    U = triu(A,1);

    while aux 
        X = -inv(D)*(L+U)*xn + inv(D)*b;
        if norm(X - xn, inf) < e
            aux = false
        else
            xn = X;
        end
    end
end