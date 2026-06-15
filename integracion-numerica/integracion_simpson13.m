function x = integracion_simpson13(f,a,b,h)
    % Aproximación de la integral definida (Método de Simpson 1/3)
    % f:    función continua 
    % a,b:  intervalo [a,b]
    % h:    espaciado entre nodos (ancho subintervalos)

    nodos = [a:h:b];

    n = length(nodos)-1;    % cantidad de subintervalos

    if (mod(n,2)!=0) 
        error('cantidad impar de nodos');
    endif

    % evaluar f en cada nodo 
    y = f(nodos);
    
    % nodos impares
    I = sum(y(2:2:n));

    % nodos pares
    P = sum(y(3:2:n-1));

    x = (h/3) * (y(1)+y(n+1)+4*I+2*P);

endfunction
