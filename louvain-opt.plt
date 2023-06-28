set term pdf
set terminal pdf size 10in,2.0in
set output 'louvain-opt.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 45 right
set grid   y
set key above font ",12"
set ylabel  '{/:Bold Relative runtime}'
set y2label '{/:Bold Modularity}'
set y2tics  0.01
set xtics rotate by 45 right
set tmargin 2
set bmargin 3.5
set boxwidth 5 relative
# set format x "%g"
# set xlabel  '{/:Bold Relative runtime}'
# set y2range [0.85:0.95]


## Draw plot
set label "{/:Bold OpenMP}\n{/:Bold schedule}"       at screen 0.14,0.97 center font "Tahoma,11" textcolor rgb "#6000A0"  # "#9100D0"
set label "{/:Bold Max.}\n{/:Bold iterations}"       at screen 0.26,0.97 center font "Tahoma,11" textcolor rgb "#006030"  # "#009E73"
set label "{/:Bold Tolerance}\n{/:Bold drop}"        at screen 0.38,0.97 center font "Tahoma,11" textcolor rgb "#2080C0"  # "#56B4E9"
set label "{/:Bold Tolerance}\n{/:Bold (initial)}"   at screen 0.47,0.97 center font "Tahoma,11" textcolor rgb "#B07000"  # "#E69F00"
set label "{/:Bold Aggregation}\n{/:Bold tolerance}" at screen 0.58,0.97 center font "Tahoma,11" textcolor rgb "#A09010"  # "#F0E442"
set label "{/:Bold Pruning}"                         at screen 0.67,0.97 center font "Tahoma,11" textcolor rgb "#004080"  # "#0072B2"
set label "{/:Bold Community}\n{/:Bold vertices}"    at screen 0.76,0.97 center font "Tahoma,11" textcolor rgb "#B00000"  # "#E51E10"
set label "{/:Bold Hashtable}"                       at screen 0.86,0.97 center font "Tahoma,11" textcolor rgb "#000000"  # "#000000"
plot "louvain-opt.csv" \
     using ($1==1? $6 : 1/0):xtic(3) title '' with histogram fill pattern 3, \
  '' using ($1==2? $6 : 1/0):xtic(3) title '' with histogram fill pattern 3, \
  '' using ($1==3? $6 : 1/0):xtic(3) title '' with histogram fill pattern 3, \
  '' using ($1==4? $6 : 1/0):xtic(3) title '' with histogram fill pattern 3, \
  '' using ($1==5? $6 : 1/0):xtic(3) title '' with histogram fill pattern 3, \
  '' using ($1==6? $6 : 1/0):xtic(3) title '' with histogram fill pattern 3, \
  '' using ($1==7? $6 : 1/0):xtic(3) title '' with histogram fill pattern 3, \
  '' using ($1==8? $6 : 1/0):xtic(3) title '' with histogram fill pattern 3, \
  '' using ($1==9? $6 : 1/0):xtic(3) title '' with histogram fill pattern 3, \
  '' using 5:xtic(3) title '' with lines linestyle 5 lw 3 lc rgb "#0000FF" axes x1y2




## Columns in CSV file.
# 01. technique
# 02. time
# 03. modularity
