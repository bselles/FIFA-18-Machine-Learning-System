#Devuelve la derivada sigmoide de un vector Z.
function result= derivadaSigmoide(Z)
  result=sigmoide(Z).*(1-sigmoide(Z));  
endfunction