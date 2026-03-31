function y = CentralDiff(f,x,h)
  y = (f(x+h)-f(x-h))/(2*h)
endfunction
