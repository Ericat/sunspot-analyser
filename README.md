:sunny: Sunspot Test :sunny:
============================

NASA wishes to analyse areas of the Sun for thermal activity. Their sensors provide raw data which can visualised as a n by n grid of raw heat measurements that represent the Sun's surface.

This data needs to be analysed to find likely areas of increased solar activity. The analysis consists of generating an **Solar Activity Score** for each location on the grid. The score is determined by adding the location's own raw heat value to its surrounding raw heat values. For instance, the score of location (1,1) is as follows:

5 + 3 + 1 + 4 + 1 + 1 + 2 + 3 + 2 = 22

When dealing with locations **around the edge of the grid** the score should ignore values outside the grid. For instance the score of location (0,0) is as follows:

5 + 3 + 4 + 1 = 13

Example output: 

(1,1 score:20)

|:low_brightness:|:low_brightness:|:low_brightness:|
|:--------------:|:--------------:|:--------------:|
|:low_brightness:|:low_brightness:|:high_brightness:|
|:high_brightness:|:low_brightness:|:high_brightness:|

Visualisation 
=============
:small_red_triangle_down: Gems: Sinatra, Sass, Haml.

JQuery Tooltip plugin displays scores on hover:

![Interface](https://raw.github.com/Ericat/sunspot-analyser/master/public/images/jquery-hover.png)
