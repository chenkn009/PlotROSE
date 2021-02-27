# Custom script for plotting ROSE results with Selected genes annotated.
# ==================
library(ggplot2)
library(grid) # for arrow function
# read parsed ROSE results 
df <- read.table(file="./ROSE_results.txt",header=T,sep="\t")
# ==================
pdf(file="./superEnhancer_plot_annotated.pdf")
# do the plotting
ggplot(df,aes(x=Rank,y=Signal,label=Gene)) +
    geom_point(color="red",size=3) +
    geom_line(color="red") +
    geom_point(x=0.931902375245151, y=0.0893046125027873,color="blue",size=5) +
    geom_text(aes(x=0.8,y=LabelY,label=Gene),size=4,hjust=1) +
    annotate("segment",x=0.81,y=0.95,xend=0.985,yend=1, size=0.3) +annotate("segment",x=0.81,y=0.899945521900196,xend=0.985,yend=0.934078710926972, size=0.3) +annotate("segment",x=0.81,y=0.849891043800392,xend=0.985,yend=0.910025517842973, size=0.3) +annotate("segment",x=0.81,y=0.799836565700588,xend=0.985,yend=0.898652466260831, size=0.3) +annotate("segment",x=0.81,y=0.749782087600784,xend=0.985,yend=0.816948590254032, size=0.3) +annotate("segment",x=0.81,y=0.699727609500981,xend=0.985,yend=0.80460093728689, size=0.3) +annotate("segment",x=0.81,y=0.649673131401177,xend=0.985,yend=0.796764893822245, size=0.3) +annotate("segment",x=0.81,y=0.599618653301373,xend=0.985,yend=0.779811067978434, size=0.3) +annotate("segment",x=0.81,y=0.549564175201569,xend=0.985,yend=0.748269481260659, size=0.3) +annotate("segment",x=0.81,y=0.498365657005884,xend=0.985,yend=0.52885277729369, size=0.3) +annotate("segment",x=0.81,y=0.448256700806276,xend=0.985,yend=0.524126188234082, size=0.3) +annotate("segment",x=0.81,y=0.395750708215297,xend=0.985,yend=0.37851355401118, size=0.3) +annotate("segment",x=0.81,y=0.331695358465897,xend=0.985,yend=0.197665132999731, size=0.3) +
    geom_hline(yintercept=0.0893046125027873,linetype="dashed") +
    geom_vline(xintercept=0.931902375245151,linetype="dashed") +
    theme_bw() +
    theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(),panel.border=element_blank()) +
    theme(axis.line = element_line(color = 'black')) +
    geom_segment(aes(x=1.05, y= 0.0893046125027873, xend=1.05, yend = 1), size =0.1, arrow =arrow(end="both",length = unit(0.5,"cm"),type="closed",angle=10)) +
    annotate("text",label="1251 SEs", x=1.09, y=0.6,angle=90) +
    scale_y_continuous(name="K27ac signal normalized") +
    scale_x_continuous(name="Enhancers ranked by\nK27ac signal", breaks=c(0,0.217912399215515,0.435824798431031,0.653737197646546,0.871649596862061), labels=c(0,4000,8000,12000,16000))
dev.off()
# ================
