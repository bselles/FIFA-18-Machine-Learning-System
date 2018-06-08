#Devuelve un vector  de valores aleatorios de 
#dimensiones L_in+1 x L_out.
function W= pesosAleatorios (L_in, L_out)
  e_ini=0.12;
  #Generamos una matriz de vectores con numeros entre 0 y 1.
  W=rand(L_out, L_in+1); 
  
  #https://octave.sourceforge.io/octave/function/mod.html
  #https://stackoverflow.com/questions/3680637/generate-a-random
  #-double-in-a-range
  W=mod(W,2*e_ini) - e_ini;
endfunction


