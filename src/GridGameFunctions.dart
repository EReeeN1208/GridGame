import 'package:image/image.dart';

void printWorld(printArray) {
  for(int y = 0; y<printArray.length; ++y) {
    String rowString = "";
    for(int x = 0; x<printArray[y].length; ++x) {
      rowString = rowString + printArray[y][x];
    }
    print(rowString);
  }
}


void EncodeTile(mapArray, mapImage){

  int pixel = 0;

  for(int y = 0; y<mapArray.length - 2; ++y) {
    for(int x = 0; x<mapArray[y].length - 2; ++x) {
      pixel = mapImage.getPixelSafe(x.toInt(), y.toInt());
      if(pixel == 4294901760) {
        mapArray[y + 1][x + 1] = "  ";
      }
    }

      //mapArray[y][x] = GenerateTile(x, y);
    }
}

void GenerateBorders(mapArray, rows, columns) {

  for(int i = 0; i<columns; ++i) {
    mapArray[0][i] = "══";
    mapArray[rows - 1][i] = "══";
  }

  for(int i = 0; i<rows; ++i) {
    mapArray[i][0] = "║ ";
    mapArray[i][rows - 1] = " ║";
  }

  mapArray[0][0] = "╔═";
  mapArray[0][columns - 1] = "═╗";
  mapArray[rows - 1][columns - 1] = "═╝";
  mapArray[rows - 1][0] = "╚═";
}


//print(mapArray[((rows - 1) / 2).round()][((columns - 1) / 2).round()]); THIS IS THE CENTER

void printCamera(printArray, cameraSize, camX, camY, rows, columns) {

  int centerX = ((columns - 1) / 2).round();
  int centerY = ((rows - 1) / 2).round();

  int camRad = ((cameraSize - 1) / 2).round();//


  for(int y = 0; y<cameraSize; ++y) {

    String rowString = "";
    for(int x = 0; x<cameraSize; ++x) {

      rowString = rowString + printArray[camY - camRad + y][camX - camRad + x];
    }
    print(rowString);
  }


}


