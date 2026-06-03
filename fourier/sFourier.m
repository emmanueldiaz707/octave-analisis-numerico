function y = sFourier(f,x,n)
  a = -pi;
  b = pi;
  k = 1;
  a0 = (1/pi) * integral(f,a,b);
  y = (a0/2);
  f_x = f(x);
  for k=1:n 
    an = (1/pi) * integral(@(x) f(x).*cos(k*x),a,b);
    bn = (1/pi) * integral(@(x) f(x).*sin(k*x),a,b);
    y = y + an * cos(k*x) + bn * sin(k*x);  
  endfor
endfunction