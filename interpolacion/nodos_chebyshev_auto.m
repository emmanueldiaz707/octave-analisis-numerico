function nodos = nodos_chebyshev_auto(intervalo)
    % Obtiene n y los extremos del intervalo automáticamente.
    % Recibe un vector con nodos equiespaciados 
    % y devuelve otro con nodos de Chebyshev.

    n = length(intervalo);
    a = min(intervalo);
    b = max(intervalo);

    nodos = nodos_chebyshev(a,b,n);
endfunction