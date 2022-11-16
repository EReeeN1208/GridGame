import 'dart:io';

import '../../GridGame/src/GridGameFunctions.dart';
import 'package:image/image.dart';

void main() {

  //Configs:


  var mapImage = decodePng(File('GridGame\\src\\mapDebug.png').readAsBytesSync());//you can change the png image, and the program will display the different maps

  int cameraSize = 9; //Single Digits




/*
Map Info:
Maps should be pngs,
With 0, 255, 0 (green) for filled tiles and
With 0, 0, 255 (blue) for empty tiles

The program will add another pixel worth of borders on each side

Example:
╔════════╗
║ ▓▓██▓▓ ║
║ ██  ██ ║
║ ▓▓  ▓▓ ║
╚════════╝
This map is generated with a 3x3 image, with all tiles being green other than the center and the center bottom
There is a pixel worth of borders on each side.
There are a total of 25 pixels. (A pixel is 2 characters side by side forming a square)

NOTE: MAPS SHOULD BE ODD AMOUNTS OF PIXELS IN BOTH DIMENSIONS

Map1 - Small
Map2 - Large
Map3 - Small Debug

0, 0 is the center coordinate

 */


  int camX = 0;
  int camY = 0;

  int rows = 2 + mapImage.height;//Y
  int columns = 2 + mapImage.width;//X

  print("Welcome to grid game!\n==========");

  print("The map will be $columns pixels wide and $rows pixels tall (not including borders)");




  print("Generating Map");



  var mapArray = List.filled(rows, List.filled(columns, "oo"), growable: true);

  for (int i = 0; i<mapArray.length; ++i) {
    mapArray[i] = List.filled(columns, "oo");
  }

  print("Map Array Created");

  //Generates Tiles
  for(int y = 0; y<mapArray.length - 2; ++y) {
    for(int x = 0; x<mapArray[y].length - 2; ++x) {
      switch((x + y) % 2) {
        case 0: {mapArray[y + 1][x + 1] = "▓▓"; break;}
        case 1: {mapArray[y + 1][x + 1] = "██"; break;}
      }
    }
  }

  GenerateBorders(mapArray, rows, columns);


  print("Base Map Generated");

  EncodeTile(mapArray, mapImage);
  print("Map Features added");

  print("Map:");
  printWorld(mapArray);

  print(mapArray[((rows - 1) / 2).round()][((columns - 1) / 2).round()]);

  String direction = "";
  print("Enter the direction that you want to move in.");
  print("You can use wasd to move around.");

  camX = ((rows - 1) / 2).round();
  camY = ((columns - 1) / 2).round();

  while(true) {
    printCamera(mapArray, cameraSize, camX, camY, rows, columns);
    while(true) {

      print("X: $camX | Y: $camY");

      String direction = stdin.readLineSync();
      direction = direction.toLowerCase();
      if(direction == "w") {
        --camY;
        break;
      }
      else if(direction == "a") {
        --camX;
        break;
      }
      else if(direction == "s") {
        ++camY;
        break;
      }
      else if(direction == "d") {
        ++camX;
        break;
      }


    }

  }


}

