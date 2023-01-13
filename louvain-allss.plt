set term pdf
set terminal pdf size 10in,6in
set output 'louvain-allss.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set title noenhanced
set style fill solid border lt -1
set style textbox opaque noborder
set xtics 2
set xtics rotate by 45 right
set logscale x 10
set format x "%g"
set grid   y
set key off
# set xlabel  'Threads'
# set ylabel  'Speedup'
# set y2label 'Modularity'
set y2range [0:1]
# set y2tics  0.2
set multiplot layout 3,5


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
files='indochina-2004 uk-2002 arabic-2005 uk-2005 webbase-2001 it-2004 sk-2005 com-LiveJournal com-Orkut asia_osm europe_osm kmer_A2a kmer_V1r'
do for [i=1:words(files)] {
set title word(files, i) # offset 0,-0.8
plot 'louvain-allss/'.word(files, i).'.csv' \
       using 8:10 title 'Static'           linestyle 1 with linespoints, \
    '' using 8:11 title 'Naive-dyn.'       linestyle 2 with linespoints, \
    '' using 8:12 title 'Dyn. Δ-screening' linestyle 3 with linespoints, \
    '' using 8:13 title 'Dyn. Frontier'    linestyle 4 with linespoints, \
    '' using 8:15 title '' linestyle 11 with linespoints axes x1y2, \
    '' using 8:16 title '' linestyle 12 with linespoints axes x1y2, \
    '' using 8:17 title '' linestyle 13 with linespoints axes x1y2, \
    '' using 8:18 title '' linestyle 14 with linespoints axes x1y2,
}


set key center center
set border 0
unset tics
unset title
set yrange [0:1]
plot 2 t 'Static'           linestyle 1 with linespoints, \
     2 t 'Naive-dyn.'       linestyle 2 with linespoints, \
     2 t 'Dyn. Δ-screening' linestyle 3 with linespoints, \
     2 t 'Dyn. Frontier'    linestyle 4 with linespoints
unset multiplot




## Names of CSV files.
# 01. indochina-2004
# 02. uk-2002
# 03. arabic-2005
# 04. uk-2005
# 05. webbase-2001
# 06. it-2004
# 07. sk-2005
# 08. com-LiveJournal
# 09. com-Orkut
# 10. asia_osm
# 11. europe_osm
# 12. kmer_A2a
# 13. kmer_V1r


## Columns in CSV file.
# 01. graph
# 02. order
# 03. size
# 04. batch_deletions_size
# 05. batch_insertions_size
# 06. batch_size
# 07. batch_fraction
# 08. num_threads
# 09. seqsta-s
# 10. ompsta-s
# 11. ompnai-s
# 12. ompdel-s
# 13. ompfro-s
# 14. seqsta-m
# 15. ompsta-m
# 16. ompnai-m
# 17. ompdel-m
# 18. ompfro-m


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
