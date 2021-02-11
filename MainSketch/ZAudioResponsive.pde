//---------------------------------------------
//variables
float specLow = 0.03; // 3% 0.03
float specMid = 0.125;  // 1 = 0.12 52.5% 0.125
float specHi =  5.20;   //  = 5.2 020% 5.20

float scoreLow = 255;
float scoreMid = 0;
float scoreHi = 0;

float oldScoreLow = scoreLow;
float oldScoreMid = scoreMid;
float oldScoreHi = scoreHi;

float scoreDecreaseRate = 25;//25

int nbCubes;
Cube[] cubes;

//---------------------------------------------

void InitBackgroundCubes()
{

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //setUp
  minim = new Minim(this);

  main = minim.loadFile("Start.mp3");

  fft = new FFT( main.bufferSize(), main.sampleRate());

  //Un cube par bande de fréquence
  nbCubes = 300; // (int)(fft.specSize()*specHi)
  cubes = new Cube[nbCubes];

  for (int i = 0; i < nbCubes; i++) {
    cubes[i] = new Cube();
  }


//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//draw
void ShowCubes()
{

  fft.forward(main.mix);

  //Calcul des "scores" (puissance) pour trois catégories de son
  //D'abord, sauvgarder les anciennes valeurs
  oldScoreLow = scoreLow;
  oldScoreMid = scoreMid;
  oldScoreHi = scoreHi;

  //Réinitialiser les valeurs
  scoreLow = 0;
  scoreMid = 0;
  scoreHi = 0;

  //Calculer les nouveaux "scores"
  for (int i = 0; i < fft.specSize()*specLow; i++)
  {
    scoreLow += fft.getBand(i);
  }

  for (int i = (int)(fft.specSize()*specLow); i < fft.specSize()*specMid; i++)
  {
    scoreMid += fft.getBand(i);
  }

  for (int i = (int)(fft.specSize()*specMid); i < fft.specSize()*specHi; i++)
  {
    scoreHi += fft.getBand(i);
  }

  //Faire ralentir la descente.
  if (oldScoreLow > scoreLow) {
    scoreLow = oldScoreLow - scoreDecreaseRate;
  }

  if (oldScoreMid > scoreMid) {
    scoreMid = oldScoreMid - scoreDecreaseRate;
  }

  if (oldScoreHi > scoreHi) {
    scoreHi = oldScoreHi - scoreDecreaseRate;
  }

  //Volume pour toutes les fréquences à ce moment, avec les sons plus haut plus importants.
  //Cela permet à l'animation d'aller plus vite pour les sons plus aigus, qu'on remarque plus
  float scoreGlobal = 0.66*scoreLow + 0.8*scoreMid + 1*scoreHi;

  //Couleur subtile de background
  background(scoreLow/100, scoreMid/100, scoreHi/100);

  //Cube pour chaque bande de fréquence
  for (int i = 0; i < nbCubes; i++)
  {
    //Valeur de la bande de fréquence
    float bandValue = fft.getBand(i);

    //La couleur est représentée ainsi: rouge pour les basses, vert pour les sons moyens et bleu pour les hautes. 
    //L'opacité est déterminée par le volume de la bande et le volume global.
    cubes[i].display(scoreLow, scoreMid, scoreHi, bandValue, scoreGlobal);
  }
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
