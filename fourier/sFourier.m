function y = sFourier(f,x,nmax)
    % Serie de Fourier con senos y cosenos en [-pi,pi]
    % (esta implementación no aprovecha la paridad de f)
    % f:    función integrable con período 2pi
    % x:    vector con puntos
    % nmax:    iteraciones
    % Intervalo: 
    a = -pi;
    b = pi;
  
    a0 = (1/pi) * integral(f,a,b);
    y = (a0/2);
    for n=1:nmax 
        an = (1/pi) * integral(@(x) f(x).*cos(n*x),a,b);
        bn = (1/pi) * integral(@(x) f(x).*sin(n*x),a,b);
        y = y + an * cos(n*x) + bn * sin(n*x);  
    endfor
endfunction
