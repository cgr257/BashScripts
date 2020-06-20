echo -e "using wc -w on bash:    \c" 
pdftotext $1 - | wc -w

echo -e "Monteray (estimate):\c" 
calc `pdftotext $1 - | wc -w` -13

echo -e "Overleaf (estimate):\c" 
calc `pdftotext $1 - | wc -w` -696
