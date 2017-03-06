How it works
=

1. The original image is drawn with a certain direction (in this case a line facing left).
2. The original, as well as an image formed by rotating the original by 90 degrees and flipping (up --> down, left --> right and vice versa) is drawn.
3. The original and image become the new "original" together.
4. The new "original" is once again rotated, drawn, and made into the old "original."
5. Steps 2 to 5 are repeated about twenty times.

![the fractal going thru 16 recursions](http://i.imgur.com/GAgpdaJ.gif)

``` 
Note: Each additional recursion takes twice as much memory and time to run, so the fractal can easily crash the webpage.
```
