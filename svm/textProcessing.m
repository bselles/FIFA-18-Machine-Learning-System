#directory contendrá una referencia al directorio donde se encuentran los ficheros a 
#transformar y numFiles contedrá el número de ficheros que contiene.
function  textProcessing(directory, numFiles)
  
  X=[];
  
  vl=getVocabList();
  
  #Generamos la estructura descrita en el enunciado.
  #https://octave.org/doc/v4.2.1/Creating-Structures.html
  for i=1:length(vl)
    structure.(vl{i})=i;
    
  endfor
  
  
  for i= 1:numFiles
    #https://octave.org/doc/v4.2.1/Formatted-Output.html
    file=sprintf("%s/%04d.txt",directory, i); 
    #Procesamos el correo. Ahora tendrá el formato descrito en el enunciado.
    email= processEmail(readFile(file));
    #Ahora estudiamos si cada una de las palabras del fichero de esta iteración
    #está contenida en la estructura creada anteriormente.
    
    #Para ello, leemos todas las palabras del fichero (almacenado en email)
    #y buscamos si están en structure.
    
    #Matriz donde se almacenarán los resultados. Lo inicializamos con ceros en 
    #todas las posiciones y, en el caso de que la palabra de dicha posición se 
    #encuentre en el mail, lo ponemos a 1. 
    matrix=zeros(1,length(vl));
    
    while ~isempty(email)
        #https://octave.org/doc/v4.0.3/Manipulating-Strings.html
        [str,email] = strtok(email, [' ']); #Cogemos una palabra del email.
        #El email resultante se encontrará en email (un string que representa
        #el mail entero, ahora con una palabra menos).

        #Evaluamos si se encuentra en la estructura structure que contendrá, como
        #campos, las palabras contenidas en el fichero  vocab.txt.
        if isfield(structure,str)
          matrix(structure.(str))=1;  #Si se encuentra en el mail, ponemos un 1.
        endif
    endwhile
    
    #Añadimos el resultado a la X final.
    X=[X;matrix];
    
  endfor
  
  #Al terminar, almacenamos los resultados en un fichero .mat
  #https://octave.org/doc/v4.2.0/Simple-File-I_002fO.html
  save result.mat X #Renombrar al terminar para no sobreescribir el resultado.
  
endfunction