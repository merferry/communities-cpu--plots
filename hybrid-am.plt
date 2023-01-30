set term pdf
set terminal pdf size 5in,3in
set output 'hybrid-am.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 45 right
set logscale x 10
set logscale y 10
set format x "%g"
set grid   y
set key above font ",12"
set xlabel  'Batch fraction'
set ylabel  'Runtime (s)'
set y2label 'Modularity'
set y2range [0:1]
set y2tics  0.2


## Set line styles
# set boxwidth 0.20 abs
# set style line 13 linewidth 2 dashtype 2 linetype 7 pointtype 7 pointsize 1 dashtype 2
set style line  1 linewidth 2 linetype 8 pointtype 5
set style line  2 linewidth 2 linetype 7 pointtype 7
set style line  3 linewidth 2 linetype 6 pointtype 9
set style line  4 linewidth 2 linetype 1 pointtype 2
set style line 11 linewidth 2 linetype 8 pointtype 5 dashtype 2
set style line 12 linewidth 2 linetype 7 pointtype 7 dashtype 2
set style line 13 linewidth 2 linetype 6 pointtype 9 dashtype 2
set style line 14 linewidth 2 linetype 1 pointtype 2 dashtype 2


## Draw plot
# set title 'AM time for all batch sizes (omp)' offset 0,-0.8
plot 'hybrid-am.csv' \
       using 7:($14/1000) title 'Dyn. Frontier Louvain'     linestyle 2 with linespoints, \
    '' using 7:($16/1000) title 'Dyn. Frontier RAK'         linestyle 3 with linespoints, \
    '' using 7:($18/1000) title 'Dyn. Frontier Louvain-RAK' linestyle 4 with linespoints, \
    '' using 7:25 title '' linestyle 12 with linespoints axes x1y2, \
    '' using 7:27 title '' linestyle 13 with linespoints axes x1y2, \
    '' using 7:29 title '' linestyle 14 with linespoints axes x1y2, \
    '' using 7:($18/1000):(sprintf("%.2f", $14/$18)) with labels notitle offset character 0,character 1




## Columns in CSV file.
# 01. graph
# 02. order
# 03. size
# 04. batch_deletions_size
# 05. batch_insertions_size
# 06. batch_size
# 07. batch_fraction
# 08. seqstal-t
# 09. seqstar-t
# 10. seqstars-t
# 11. ompstal-t
# 12. ompstar-t
# 13. ompstars-t
# 14. ompfrol-t
# 15. ompfror-t
# 16. ompfrors-t
# 17. ompfrolr-t
# 18. ompfrolrs-t
# 19. seqstal-m
# 20. seqstar-m
# 21. seqstars-m
# 22. ompstal-m
# 23. ompstar-m
# 24. ompstars-m
# 25. ompfrol-m
# 26. ompfror-m
# 27. ompfrors-m
# 28. ompfrolr-m
# 29. ompfrolrs-m


## How it works
# set termoption linewidth 3
# set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 5 ps 5.5   # blue
# set style line 2 lc rgb '#dd181f' lt 1 lw 2 pt 7 ps 1.5   # red
# do for [i=1:100] {
#   set style line i linewidth 30
# }
# set key autotitle columnhead
# plot [500:10000] 'data/arabic-2005.csv'


## Using boxes with plot
#   ''  using 1:13:xtic(2) title 'Dynamic Levelwise'  with boxes fill pattern 2, \
#   ''  using ($1+0.20):19 title 'Dynamic HyPR (CPU)' with boxes fill pattern 3 noborder, \
#   ''  using ($1+0.40):11 title 'Static Levelwise'   with boxes fill pattern 3 noborder, \
#   ''  using ($1+0.20):(0.9*$19):21 title '' with labels font ",12" rotate right, \
#   ''  using ($1+0.40):(0.9*$11):20 title '' with labels font ",12" rotate right
