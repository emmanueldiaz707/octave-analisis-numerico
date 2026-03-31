function y = ForwardDiff(f,x,h)
   y = (f(x+h)-f(x))/h
endfunction
