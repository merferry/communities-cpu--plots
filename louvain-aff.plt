set term pdf
set terminal pdf size 4in,2.7in
set output 'louvain-del-aff.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 45 right
set logscale x 10
set logscale y 10
set format x "10^{%L}"
set format y "10^{%L}"
set grid   y
set key above font ",12"
set xlabel  '{/:Bold Batch fraction}'
set ylabel  '{/:Bold Fraction of Affected vertices}'


## Set line styles
set style line  1 linewidth 2 linetype 8 pointtype 5
set style line  2 linewidth 2 linetype 7 pointtype 7
set style line  3 linewidth 2 linetype 6 pointtype 9
set style line  4 linewidth 2 linetype 1 pointtype 2
set style line 11 linewidth 2 linetype 8 pointtype 5 dashtype 2
set style line 12 linewidth 2 linetype 7 pointtype 7 dashtype 2
set style line 13 linewidth 2 linetype 6 pointtype 9 dashtype 2
set style line 14 linewidth 2 linetype 1 pointtype 2 dashtype 2


## Draw plot
plot 'louvain-del-am.csv' \
       using 4:13 title 'Static_L' linestyle 1 with linespoints, \
    '' using 4:14 title 'P-ND_L'   linestyle 2 with linespoints, \
    '' using 4:15 title 'P-DDS_L'  linestyle 3 with linespoints, \
    '' using 4:16 title 'P-DF_L'   linestyle 4 with linespoints, \
    '' using 4:16:($4< 1e-6? sprintf("%.1f", $15/$16) : "") with labels notitle offset character 5.6,character 0.5, \
    '' using 4:16:($4>=1e-6 && $4<1e-4? sprintf("%.1f", $15/$16) : "") with labels notitle offset character 1.6,character -0.7, \
    '' using 4:16:($4>=1e-4 && $4<0.1 ? sprintf("%.1f", $15/$16) : "") with labels notitle offset character 0,character 0.7, \
    '' using 4:16:($4>=0.1 ? sprintf("%.1f", $15/$16) : "") with labels notitle offset character -3,character 0




## Columns in CSV file.
# 01. graph
# 02. batch_deletions_fraction
# 03. batch_insertions_fraction
# 04. batch_fraction
# 05. lousta-t
# 06. lounai-t
# 07. loudel-t
# 08. loufro-t
# 09. lousta-m
# 10. lounai-m
# 11. loudel-m
# 12. loufro-m
# 13. lousta-aff
# 14. lounai-aff
# 15. loudel-aff
# 16. loufro-aff
