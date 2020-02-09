# superpie
A superior pie chart in MATLAB

<div align=center><img src="outfig_superpie.jpg" style="display: block; margin: auto;" ></div>

```matlab
% 1-click running superpie

% Input test data:
T = readtable('input_superpie.txt');

% Usage: hp = superpie(percentage, color, text);
hp = superpie(T.Percentage_of_samples, table2array(T(:,[3,4,5])), T.Category);
```
