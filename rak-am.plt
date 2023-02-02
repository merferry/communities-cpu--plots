set term pdf
set terminal pdf size 4in,3.7in
set output 'rak-am.pdf'


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
set y2range [0.7:0.85]
set y2tics  0.05


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
plot 'rak-am.csv' \
       using 7:($11/1000) title '    Static LPA'           linestyle 1 with linespoints, \
    '' using 7:($13/1000) title '    Naive-dyn. LPA'       linestyle 2 with linespoints, \
    '' using 7:($15/1000) title '    Dyn. Δ-screening LPA' linestyle 3 with linespoints, \
    '' using 7:($17/1000) title '    Dyn. Frontier LPA'    linestyle 4 with linespoints, \
    '' using 7:21 title '' linestyle 11 with linespoints axes x1y2, \
    '' using 7:23 title '' linestyle 12 with linespoints axes x1y2, \
    '' using 7:25 title '' linestyle 13 with linespoints axes x1y2, \
    '' using 7:27 title '' linestyle 14 with linespoints axes x1y2, \
    '' using 7:($17/1000):(sprintf("%.2f", $15/$17)) with labels notitle offset character 0,character 1




## Columns in CSV file.
# 01. graph
# 02. order
# 03. size
# 04. batch_deletions_size
# 05. batch_insertions_size
# 06. batch_size
# 07. batch_fraction
# 08. seqsta-t
# 09. seqstas-t
# 10. ompsta-t
# 11. ompstas-t
# 12. ompnai-t
# 13. ompnais-t
# 14. ompdel-t
# 15. ompdels-t
# 16. ompfro-t
# 17. ompfros-t
# 18. seqsta-m
# 19. seqstas-m
# 20. ompsta-m
# 21. ompstas-m
# 22. ompnai-m
# 23. ompnais-m
# 24. ompdel-m
# 25. ompdels-m
# 26. ompfro-m
# 27. ompfros-m


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
