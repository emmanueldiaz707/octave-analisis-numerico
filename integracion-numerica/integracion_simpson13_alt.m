function x = integracion_simpson13_alt(f,a,b,h)
    % Aproximación de la integral definida (Método de Simpson 1/3)
    % f:    función continua 
    % a,b:  intervalo [a,b]
    % h:    espaciado entre nodos (ancho subintervalos)

    nodos = [a:h:b];
    
    n = length(nodos)-1;    % cantidad de subintervalos

    if (mod(n,2)!=0) 
        error('cantidad impar de nodos');
    endif
    
    % nodos impares
    I=0;
    for i=2:2:n
        I = I + f(nodos(i));
    endfor

    % nodos pares
    P = 0;
    for i=3:2:n-1
        P = P + f(nodos(i));
    endfor

    x = (h/3) * (f(nodos(1))+f(nodos(n+1))+4*I+2*P);

endfunction
