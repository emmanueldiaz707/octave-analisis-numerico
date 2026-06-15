function x = integracion_trapecio(f,nodos)
    % Aproximación de integral definida (Método del trapecio)
    % f:        función continua
    % nodos:    puntos (no necesitan estar equiespaciados)

    n = length(nodos)-1;  % cantidad de subintervalos

    x = 0;
    for i=1:n   % de 0 a n-1
        A = ((nodos(i+1)-nodos(i))/2)*(f(nodos(i+1))+f(nodos(i))); % área del trapecio local
        x = x + A;
    endfor
endfunction
