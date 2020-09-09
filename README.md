
***Processing demo to demonstrate algorithms for mapping between two quads.***

Using a perspective transform (homography / projective geometry)

![screenshot-homographic](https://user-images.githubusercontent.com/720669/92593675-ceb75800-f2a1-11ea-968e-a36e6e3b06cd.jpg)

Using bilineaer interpolation (rubber-sheet / lerping between quads)

![screenshot-bilinear](https://user-images.githubusercontent.com/720669/92593680-cfe88500-f2a1-11ea-9c01-cc3fbddd3bec.jpg)

This technique is used in projection mapping, laser projections etc.
It re-uses some code from Benjamin Maus' laserschein project for calculating the perspective transform / homographic projections.

## Mouse Interaction

Move the mouse to see how the mouse position maps from one quad to the other.
The blue dot shows what happens to the mouse position when mapped from blue quad onto the red one.
The red dot shows what happens to the mouse position when mapped from the red quad to the blue one.

## Keyboard Interaction

- `[SPACE]` to switch between perspective and bilinear mappings
- `[r]` to reset / randomize
- `[LEFT]` and `[RIGHT]` to change the number of columns in a grid
- `[UP]` and `[DOWN]` to change the number of rows in a grid

## License

Benjamin Maus' laserschein code is LGPL licensed.  
Everything else in this sketch MIT licensed.

## Links

The two mappings are also available via the JAI (Java Advanced Imaging):

- [Perspective Transform](https://download.java.net/media/jai/javadoc/1.1.3/jai-apidocs/javax/media/jai/PerspectiveTransform.html)
- [InterpolationBilinear](https://download.java.net/media/jai/javadoc/1.1.3/jai-apidocs/javax/media/jai/InterpolationBilinear.html)

Projection Mapping Libraries for Processing:

- [keystone](https://github.com/davidbouchard/keystone)
- [sketchmapper](https://github.com/josephtaylor/sketch-mapper)

