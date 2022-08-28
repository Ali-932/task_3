import 'dart:math';
double ran(){
  Random random = new Random();
  double randomNumber = random.nextInt(5).toDouble(); // from 0 upto 99 included
  return randomNumber;
}
