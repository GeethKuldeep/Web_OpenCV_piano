import 'Sound.dart';

void playsound_coordinates(int x,int y){
  if(0<x&&0<y && x<170&&y<804)
    {
      playSound(1);
    }
  if(170<=x&&706<y && x<380&&y<706)
    {
      playSound(1);
    }
  if(280<=x&&706<=y&&806>=y && x<548   ||  386<=x&&58<=y&&703>=y && x<705 )
  {
    playSound(2);
  }
  if(450<x&&61<y && x<656&&y<707)
  {
    playSound(2);
  }

}