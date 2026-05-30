% Recibe función, intervalo [a,b] y error
% Suponiendo que f(x) es continua
function x = bisection(f,a,b,e)
    if f(a)*f(b)>=0
      error('f(a) y f(b) deben tener distinto signo');
    endif

    k = 1;

    while (((b-a)/(2^k) > e))
        m = (a+b)/2;
        if (f(a)*f(m)<0) 
            b = m;
        elseif (f(a)*f(m)>0)
            a = m;
        else
            a = b;
        endif
        k=k+1;
    endwhile
    x = m
end
