function x = biseccion(f,a,b,e,maxiter)
    % Método de bisección (buscar raíces de la función)
    % f:        función continua
    % a,b:      intervalo (a,b)
    % e:        error / tolerancia
    % maxiter:  máximo de iteraciones
    % x:        raíz aproximada

    % f(a) y f(b) deben tener distinto signo
    if f(a)*f(b)>=0 
        error('no existe una raíz en el intervalo.'); 
    endif

    k = 1;
    while ((k<=maxiter) && (e < ((b-a)/2)))
        m = (a+b)/2;
        if (f(m)==0) % se encontró la raíz exacta
            a = m;
            b = m;
        elseif (f(m)*f(b)<0)
            a=m;
        else 
            b=m;
        endif
        k=k+1;
    endwhile

    if (k>maxiter)
        warning("off","backtrace","local");
        warning('se alcanzó el máximo de iteraciones!');
    endif
    x = (a+b)/2;
endfunction
