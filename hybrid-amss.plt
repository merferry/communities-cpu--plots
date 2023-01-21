set term pdf
set terminal pdf size 5in,3in
set output 'hybrid-amss.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics 2
set xtics rotate by 45 right
set logscale x 10
set format x "%g"
set grid   y
set key above font ",12"
set xlabel  'Threads'
set ylabel  'Speedup'
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
plot 'hybrid-amss.csv' \
       using 8:15 title 'Dyn. Frontier Louvain'     linestyle 2 with linespoints, \
    '' using 8:17 title 'Dyn. Frontier RAK'         linestyle 3 with linespoints, \
    '' using 8:19 title 'Dyn. Frontier Louvain-RAK' linestyle 4 with linespoints, \
    '' using 8:26 title '' linestyle 12 with linespoints axes x1y2, \
    '' using 8:28 title '' linestyle 13 with linespoints axes x1y2, \
    '' using 8:30 title '' linestyle 14 with linespoints axes x1y2,




## Columns in CSV file.
# 01. graph
# 02. order
# 03. size
# 04. batch_deletions_size
# 05. batch_insertions_size
# 06. batch_size
# 07. batch_fraction
# 08. num_threads
# 09. seqstal-t
# 10. seqstar-t
# 11. seqstars-t
# 12. ompstal-t
# 13. ompstar-t
# 14. ompstars-t
# 15. ompfrol-t
# 16. ompfror-t
# 17. ompfrors-t
# 18. ompfrolr-t
# 19. ompfrolrs-t
# 20. seqstal-m
# 21. seqstar-m
# 22. seqstars-m
# 23. ompstal-m
# 24. ompstar-m
# 25. ompstars-m
# 26. ompfrol-m
# 27. ompfror-m
# 28. ompfrors-m
# 29. ompfrolr-m
# 30. ompfrolrs-m


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
