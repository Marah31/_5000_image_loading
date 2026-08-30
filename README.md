## the following is comparing between three cases 
1. ListView Builder
2. Sliver
3. Sliver with cached network image and cache extent

** note: the average FPS is taken after scrolling through approximately 1000 element in a steady pace

## ListView Builder:
general time:
![list_view](https://github.com/Marah31/_5000_image_loading/blob/main/flutter-5k-image-comparison/listview-general.png)

average FPS: 57 ,
higher janks number

worst case:
![list_view_worst_case](https://github.com/Marah31/_5000_image_loading/blob/main/flutter-5k-image-comparison/listview-worst-case.png)
UI time: 1.9ms ,
raster time: 82.0ms ,
total frame time: 83.9ms
-------------


---
## Sliver:
general time:
![list_view](https://github.com/Marah31/_5000_image_loading/blob/main/flutter-5k-image-comparison/sliver-general.png)

average FPS: 56
lower janks number

worst case:
![list_view_worst_case](https://github.com/Marah31/_5000_image_loading/blob/main/flutter-5k-image-comparison/sliver-worst-case.png)
UI time: 5.1ms ,
raster time: 32.7ms ,
total frame time: 37.8ms ,
-------------


---
##  Sliver with cached network image and cache extent :
general time:
![list_view](https://github.com/Marah31/_5000_image_loading/blob/main/flutter-5k-image-comparison/sliver-with-cached-image-newtwork-general.png)

average FPS: 58-59
lowest janks number

worst case:
![list_view_worst_case](https://github.com/Marah31/_5000_image_loading/blob/main/flutter-5k-image-comparison/sliver-with-chached-netwrok-worst-case.png)
UI time:< 0.2ms ,
raster time: 36.7ms ,
total frame time: ~ 37.9ms ,
-------------

