#Elimina los ejemplos de entrenamiento que la clase traducida (de atributo no
#numérico a numérico) no es válida, es decir, es menor que 0 o mayor que 13.

function x = deleteWrongSamples(X)
  #Eliminamos los ejemplos de entrenamiento que pueden generar problemas.
  rtd=[]; #Rows to Delete.
  x=X;
  for i=1: length(x)
    if (x(i,end) < 0)
      rtd= vertcat(rtd,i);    #Concatena a la lista el valor de i.
    elseif (x(i,end) >13)
      rtd= vertcat(rtd,i);    #Concatena a la lista el valor de i.
    endif
  endfor
  
  j=0;
  for i=1: length (rtd)
    x(rtd(i)-j,:)=[];         #Eliminamos los elementos de las columnas.
    j=j+1;                    #También tenemos en cuenta que al eliminar una columna, 
  endfor                      #su posición la ocupa otro ejemplo, de modo que hay que actualizar los valores 
                              #de las columnas a eliminar.  
endfunction
