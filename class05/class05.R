
#Section 2 Customizing plots
#2A Line Plot------------------------

  #reading from flile

weight<-read.table('bimm143_05_rstats/weight_chart.txt', header=TRUE)

  #plotting weight
plot(weight,type="o",pch=15,cex=1.5,lwd=2,ylim=c(2,10),xlab="Age(months)",ylab="weight (kg)", main="Weight with age", col="blue")

#2B barplot---------------------------

fe_count<-read.table ('bimm143_05_rstats/feature_counts.txt', header=TRUE, sep="\t")

 par(mar=c(7,12,7,5))
 barplot(fe_count$Count,names.arg=fe_count$Feature,horiz=TRUE,col="skyblue",
         main="Features/Count",las=1, ylab="Features",xlab = "Count",xlim = c(0,90000))

#2C Histogram------------------------
 
 hist(c(rnorm(10000),rnorm(10000)+4),breaks=50, main="Histogram", xlab="x")

 
 
 
#Section 3---------------------------
 male_female<-read.delim('bimm143_05_rstats/male_female_counts.txt')
 
 #Rainbow coloring
 barplot(male_female$Count,names.arg = male_female$Sample,col=rainbow(nrow(male_female)),las=2)
 
 #Red Blue coloring
 
 redblue<-c("blue","red")
 barplot(male_female$Count,names.arg = male_female$Sample,col=redblue,las=2)
 
 #3B Coloring by Value-----------------------
 
 genes<-read.delim('bimm143_05_rstats/up_down_expression.txt')
 #size
 nrow(genes)
 
 #classifying 
 table(genes$State)
 
 #plotting the 2 condittions
 plot(genes$Condition1,genes$Condition2)
 
 #color coding
 plot(genes$Condition1,genes$Condition2,col=genes$State)
 
 #changing the color
 palette(c("red","green4","yellow2"))
 plot(genes$Condition1,genes$Condition2,col=genes$State)
 
 #3c Dynamic use of color---------------------
 
 meth<-read.delim('bimm143_05_rstats/expression_methylation.txt')
 
 plot(meth$gene.meth,meth$expression)
 
 #making new color vector
 dcols<-densCols(meth$gene.meth,meth$expression)
 plot(meth$gene.meth,meth$expression, col=dcols, xlab = "Genes",ylab = "Expression",pch=20)
 
 #selecting genes that have more than 0 value of expression 
 inds<-meth$expression>0
 dcols<-densCols(meth$gene.meth[inds],meth$expression[inds])
 plot(meth$gene.meth[inds],meth$expression[inds],col=dcols, pch=20,xlab = "Genes",ylab = "Expression")
 
 #changing colors 
 dcol2<-densCols(meth$gene.meth[inds],meth$expression[inds],colramp = colorRampPalette(c("blue2","green2","red","yellow")))
 par(mar=c(1,9,7,1))
 plot(meth$gene.meth[inds],meth$expression[inds],col=dcol2, pch=20,xlab = "Genes",ylab = "Expression")
 