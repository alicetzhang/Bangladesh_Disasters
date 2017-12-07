#!/bin/sh

###################################################################
## EESC GR6901 Research Computing in Earth Science
## Final Project - Part 1
## Alice Tianbo Zhang (tz2218@columbia.edu)
## 2017/12/7
###################################################################

# Document settings
gmtset PS_PAGE_ORIENTATION portrait
gmtset MAP_FRAME_PEN 3
gmtset MAP_FRAME_WIDTH 0.1
gmtset MAP_FRAME_TYPE plain
gmtset PS_MEDIA=Custom_15ix12i
gmtset FONT_TITLE Helvetica-Bold
gmtset FONT_LABEL Helvetica-Bold 14p

# Use GMT to make a topography map showing the earthquake locations (color code by magnitude)
gmt grdinfo Data/bd.nc
gmt grdgradient Data/bd.nc -Ne0.8 -A100 -fg -GData/bd_i.nc
gmt makecpt -Crelief -T-1000/1000/10 -Z > Data/dem.cpt
gmt grdimage Data/bd.nc -IData/bd_i.nc -JM12i -Ba -CData/dem.cpt -K > Figure/BDEarthquake_mag.ps
gmt psscale -DjTC+w10i/0.25i+h+o0/-1i -Ba -RData/bd.nc -JM12i -CData/dem.cpt -I0.4 -By+lMeters -K -O >> Figure/BDEarthquake_mag.ps
gmt pscoast -RData/bd.nc -JM12i -N1/1p -K -O >> Figure/BDEarthquake_mag.ps
gmt pscoast -RData/bd.nc -JM12i -N2/0.5p -K -O >> Figure/BDEarthquake_mag.ps
gmt pscoast -RData/bd.nc -JM12i -Df -N2/3/0/0/0 -K -O -Lf86.5/21/22.5/250 -V >> Figure/BDEarthquake_mag.ps
gmt makecpt -Cseis -T4.5/7.5/0.5 -Iz > Data/earthquake_mag.cpt
gmt psxy Data/earthquake_mag.csv -RData/bd.nc -JM12i -Sc0.07i -W0.2p -CData/earthquake_mag.cpt -K -O >> Figure/BDEarthquake_mag.ps
gmt psscale -D12.5i/4i/12c/1.25c -RData/bd.nc -JM8i -CData/earthquake_mag.cpt -I0.4 -By+lRichter -O >> Figure/BDEarthquake_mag.ps

# Use GMT to make a topography map showing the earthquake locations (color code by depth)
gmt grdinfo Data/bd.nc
gmt grdgradient Data/bd.nc -Ne0.8 -A100 -fg -GData/bd_i.nc
gmt makecpt -Crelief -T-1000/1000/10 -Z > Data/dem.cpt
gmt grdimage Data/bd.nc -IData/bd_i.nc -JM12i -Ba -CData/dem.cpt -K > Figure/BDEarthquake_depth.ps
gmt psscale -DjTC+w10i/0.25i+h+o0/-1i -Ba -RData/bd.nc -JM12i -CData/dem.cpt -I0.4 -By+lMeters -K -O >> Figure/BDEarthquake_depth.ps
gmt pscoast -RData/bd.nc -JM12i -N1/1p -K -O >> Figure/BDEarthquake_depth.ps
gmt pscoast -RData/bd.nc -JM12i -N2/0.5p -K -O >> Figure/BDEarthquake_depth.ps
gmt pscoast -RData/bd.nc -JM12i -Df -N2/3/0/0/0 -K -O -Lf86.5/21/22.5/250 -V >> Figure/BDEarthquake_depth.ps
gmt makecpt -Chaxby -T5/100/10 -Iz > Data/earthquake_depth.cpt
gmt psxy Data/earthquake_depth.csv -RData/bd.nc -JM12i -Sc0.07i -W0.2p -CData/earthquake_depth.cpt -K -O >> Figure/BDEarthquake_depth.ps
gmt psscale -D12.5i/4i/12c/1.25c -RData/bd.nc -JM8i -CData/earthquake_depth.cpt -I0.4 -By+lm -O >> Figure/BDEarthquake_depth.ps