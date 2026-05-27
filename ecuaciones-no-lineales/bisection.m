% Recibe función, intervalo [a,b] y error
% Suponiendo que f(x) es continua y que f(a) y f(b) tienen distinto signo
function x = bisection(f,a,b,e)
    i = a;
    j = b;
    k = 1;

    while (((j-i)/(2^k) > e))
        m = (i+j)/2;
        if (f(m)>0) 
            j = m;
        elseif (f(m)<0)
            i = m;
        else
            i = j;
        endif
        k=k+1;
    endwhile
    x = m
end
