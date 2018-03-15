set -x
szLengths="read_lengths.txt"
rm -f $szLengths
touch $szLengths
while read szLine
do
    echo $szLine | xargs -I@ sh -c "samtools view @" | awk '{print $1" has "length( $10 )" bases" }' >>$szLengths
done <input_bams.fofn


# the funny stuff below is to not store all of the cumulative read depth points but enough so that the curve contains enough points to look continuous
cat read_lengths.txt | awk '{print $3}'  | sort -nr | awk '{x += $1; print $1, x, x / 3200000000}' | awk '{ if ( ( $3 > ( nOldDepth + 0.2 )) || ( $1 < ( nOldReadLength - 200) ) ) { print $0; nOldDepth = $3 ; nOldReadLength = $1 } } END {print $0}' >coverage.txt

Rscript depthOfCoverage.R
