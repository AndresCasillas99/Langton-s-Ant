//especificar el tablero

int pixelsize = 8;
int cols = 10*pixelsize;
int rows = 10*pixelsize;
int[][] board = new int[cols][rows];
int[] hormiga = new int[2]; //hormiga[0] = x, hormiga[1] = y
int direccion = 0; // 0 = arriba, 1 = derecha, 2 = abajo, 3 = izquierda


void randomIC(){
  
for(int x = 0; x < cols; x++){
  for(int y =0; y < rows; y++){
    board[x][y] = 0;
  }
}
  
  hormiga[0] = int(random(cols/3,2*cols/3));
  hormiga[1] = int(random(cols/3,2*cols/3));
  direccion = int(random(0,5)); //0,1,2,3,4
}

{
randomIC();
}

int modulo(int a, int n){ //a % n in {0,1,...,n-1}
  
  int k = 0;
  
  if (a >= 0){
    return(a%n);
  }else{
    while (n*k > a){
      k -= 1;
    } 
    return (a - n*k);
  }
}

//dibujar el tablero

void setup(){
  size(640,640); //size(pixelsize*cols, pixelsize*rows))
  frameRate(100);
}

//dibujar la pantalla 

void draw(){
     background(255,255,255); // blanco
     actualizarhormiga(); //<>//
     drawBoard();
     //saveFrame("Imagenes/LangtonsAnt_####.png"); Esto es pa guardar las fotos y hacer un video
}


//funcion evolucionar
void actualizarhormiga(){ //<>//
  
   // direccion: 0 = arriba, 1 = derecha, 2 = abajo, 3 = izquierda
  if(hormiga[0] < 0 || hormiga[0] >= cols || hormiga[1] < 0 || hormiga[1] >= rows){
    randomIC();
  }else{
    if (board[hormiga[0]][hormiga[1]] == 1){ //black square //<>//
      if (direccion == 0){  //arriba
        direccion = modulo(direccion-1, 4); //Turn 90 counter-clockwise
        board[hormiga[0]][hormiga[1]] = (board[hormiga[0]][hormiga[1]] + 1) % 2; //change color of cell
        hormiga[0] -= 1; //move forward one unit
        
         //<>//
      }else if (direccion == 1){ //derecha
        direccion = modulo(direccion-1, 4); //Turn 90 counter-clockwise
        board[hormiga[0]][hormiga[1]] = (board[hormiga[0]][hormiga[1]] + 1) % 2; //change color of cell
        hormiga[1] -= 1; //move forward one unit
       
        
      }else if(direccion == 2){ // abajo
        direccion = modulo(direccion-1, 4); //Turn 90 counter-clockwise
        board[hormiga[0]][hormiga[1]] = (board[hormiga[0]][hormiga[1]] + 1) % 2; //change color of cell
        hormiga[0] += 1; //move forward one unit
         
        
      }else if(direccion == 3){ //izquierda
        direccion =  modulo(direccion-1, 4); //Turn 90 counter-clockwise
        board[hormiga[0]][hormiga[1]] = (board[hormiga[0]][hormiga[1]] + 1) % 2; //change color of cell
        hormiga[1] += 1; //move forward one unit
        
      }
      
    }else if (board[hormiga[0]][hormiga[1]] == 0){ //white square
      if (direccion == 0){ //arriba
        direccion = modulo(direccion+1, 4); //Turn 90 clockwise
        board[hormiga[0]][hormiga[1]] = (board[hormiga[0]][hormiga[1]] + 1) % 2; //change color of cell
        hormiga[0] += 1; //move forward one unit
        
        
      }else if (direccion == 1){ //derecha
        direccion = modulo(direccion+1, 4);
        board[hormiga[0]][hormiga[1]] = (board[hormiga[0]][hormiga[1]] + 1) % 2; //change color of cell
        hormiga[1] += 1;
        
        
      }else if(direccion == 2){ //abajo
        direccion = modulo(direccion+1, 4);
        board[hormiga[0]][hormiga[1]] = (board[hormiga[0]][hormiga[1]] + 1) % 2; //change color of cell
        hormiga[0] -= 1; //puede haber problemas de dimension de la cuadricula. 
        
        
      }else if(direccion == 3){ //izquierda
        direccion = modulo(direccion+1, 4);
        board[hormiga[0]][hormiga[1]] = (board[hormiga[0]][hormiga[1]] + 1) % 2; //change color of cell
        hormiga[1] -= 1;
        
      }
    }
  }
}

//dibujar el tablero actualizado 

void drawBoard(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++){
        if (board[i][j] == 1){
          fill(255,255,0); //color de celda viva, (255,255,255) = negro
        }if (board[i][j] == 0){
          fill(0,0,0); //color de celda muerta, (0,0,0) = blanco
        }if(i == hormiga[0] && j == hormiga[1]){
          fill(255, 0, 0); //color de la hormiga;
        }
        rect(i*pixelsize,j*pixelsize,pixelsize,pixelsize);
        
    }
  }
}

//Interaccion con el usuario

void keyPressed(){
  if(key == 'f' || key == 'F'){
    saveFrame("Imagenes/LangtonsAnt_####.png");
  }else{
  randomIC();
  }
}
void mousePressed(){
  
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      if((i*pixelsize <= pmouseX && pmouseX <= (i+1)*pixelsize) && (j*pixelsize <= pmouseY && pmouseY <= (j+1)*pixelsize) && board[i][j] == 0){
        board[i][j] = 1;
        fill(255,255,0);
      }else if ((i*pixelsize <= pmouseX && pmouseX <= (i+1)*pixelsize) && (j*pixelsize <= pmouseY && pmouseY <= (j+1)*pixelsize) && board[i][j] == 1){
        board[i][j] = 0;
        fill(0,0,0);
      }
    }
  }
}

//contar pixeles despues de n iteraciones y asinar puntos

//mostrar ganador 
