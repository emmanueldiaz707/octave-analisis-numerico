function a = interpolacion_v_grafico(x,y,x0,y0)
    a = interpolacion_vandermonde(x,y);
    p = polyval(fliplr(a'),x0);
    plot(x,y,'*',x0,y0,'b',x0,p,'r');
endfunction