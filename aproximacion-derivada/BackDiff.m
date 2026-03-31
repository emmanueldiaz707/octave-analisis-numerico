function y = BackDiff(f,x,h)
  y = (f(x)-f(x-h))/h
endfunction
