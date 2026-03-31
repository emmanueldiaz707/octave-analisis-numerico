function y = Diff2(f,x,h)
  y = (f(x+h)+f(x-h)-2*f(x))/(h^2)
endfunction
