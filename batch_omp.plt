# set termoption linewidth 3
# set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 5 ps 5.5   # blue
# set style line 2 lc rgb '#dd181f' lt 1 lw 2 pt 7 ps 1.5   # red
# do for [i=1:100] {
#   set style line i linewidth 30
# }
# set key autotitle columnhead
# plot [500:10000] 'data/arabic-2005.csv'
set term pdf
set terminal pdf size 5in,3in
set output 'output.pdf'

set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set boxwidth 0.20 abs
set xtics rotate by 45 right
set grid y
set key above font ",8"
set logscale y 10
set ylabel 'Speedup'

# set title 'AM time for all batch sizes (omp)' offset 0,-0.8
plot 'data.csv' \
      using ($1-0.20):8  title '500'   with boxes fill pattern 3, \
  ''  using 1:9:xtic(2)  title '1000'  with boxes fill pattern 3, \
  ''  using ($1+0.20):10 title '5000'  with boxes fill pattern 3, \
  ''  using ($1+0.40):11 title '10000' with boxes fill pattern 3
