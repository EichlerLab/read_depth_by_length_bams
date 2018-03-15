options( echo = TRUE )

library( ggplot2)

szTitle <- "Depth Of Coverage (3G) vs. Read Length"

output.file <- "depthOfCoverage2.pdf"
standard.deviations <- 4


szInputFileCHM1 <- "coverage.txt"
df1 <- read.table( szInputFileCHM1, header = FALSE )


pdf( output.file, width = 10, height = 6 )

bp <- ggplot()
bp <- bp + geom_point(data=df1, aes(x=df1$V1, y=df1$V3, color =
"red")) 
bp <- bp + xlab( "read length" ) + ylab( "X coverage (3GB)" )
bp <- bp + scale_y_continuous( breaks = seq( 0, 100, by = 5 ) )
bp <- bp + scale_x_continuous( breaks = seq( 0, 60000, by = 5000 ) )
bp <- bp + ggtitle( szTitle ) + theme(legend.position="none")
bp

dev.off()
