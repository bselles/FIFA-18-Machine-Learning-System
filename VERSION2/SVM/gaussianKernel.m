function sim= gaussianKernel(x1,x2,sigma)
  sim= exp(((x1-x2)*(x1-x2)')/(-2*(sigma.^2)));
endfunction