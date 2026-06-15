function x = newtonRaphson(f,x0,e,maxiter)
    % Método de Newton-Raphson (buscar raíces de la función)
    % f:        función continua y derivable
    % x0:       punto inicial (cercano a la raiz)
    % e:        error / tolerancia
    % maxiter:  máximo de iteraciones
    % x:        raíz aproximada

    addpath('../aproximacion-derivada'); 

    x = x0;
    d = CentralDiff(f,x,e);
    if (d==0)
        error('derivada igual a cero');
    endif
    hn = -f(x)/d;

    n=1;
    while ((n<=maxiter) && (abs(hn)>=e))
        x = x + hn;
        d = CentralDiff(f,x,e);
        if (d==0)
            error('derivada igual a cero');
        endif
        hn = -f(x)/d;
        n = n+1;
    endwhile
    
    if (n>maxiter)
        error('se alcanzó el máximo de iteraciones');
    endif
endfunction
