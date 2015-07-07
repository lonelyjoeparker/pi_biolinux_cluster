comps = read.table("~/Documents/all_work/pi_project_pipeline/results/collated.out",header=T,sep="\t")
str(comps)
par(cex=1)
plot(log(blast_real[machine=="raspi"]) ~ log(nBlast[machine=="raspi"]),pch="+",xlab="log (num. blast queries)",ylab="log(time, real s)",main="Blast compute time")
points(log(blast_real[machine=="MBP"]) ~ log(nBlast[machine=="MBP"]),pch="+",col="red")
points(log(blast_real[machine=="AWSmicro"]) ~ log(nBlast[machine=="AWSmicro"]),pch="+",col="blue")
points(log(blast_real[machine=="AWSlarge"]) ~ log(nBlast[machine=="AWSlarge"]),pch="x",col="green")
#legend()
#quartz()

#plot(log(blast_user[machine=="raspi"]) ~ log(nBlast[machine=="raspi"]),pch="+",xlab="log (num. blast queries)",ylab="log(time, user s)",main="Blast compute time")
#points(log(blast_user[machine=="MBP"]) ~ log(nBlast[machine=="MBP"]),pch="+",col="red")
#points(log(blast_user[machine=="AWSmicro"]) ~ log(nBlast[machine=="AWSmicro"]),pch="+",col="blue")
#points(log(blast_user[machine=="AWSlarge"]) ~ log(nBlast[machine=="AWSlarge"]),pch="x",col="green")##

#quartz()
#plot(log(phylo[machine=="raspi"]) ~ (nTree[machine=="raspi"]),pch="+",xlab="num. alignments/phylogenies",ylab="log(time, user s)",main="Phylo compute time")
#points(log(phylo[machine=="MBP"]) ~ (nTree[machine=="MBP"]),pch="+",col="red")
#points(log(phylo[machine=="AWSlarge"]) ~ (nTree[machine=="AWSlarge"]),pch="x",col="green")
#points(log(phylo[machine=="AWSmicro"]) ~ (nTree[machine=="AWSmicro"]),pch="+",col="blue")

#counts=table(blast_real[nBlast==100000],machine[nBlast==100000])
#barplot(counts,col=rainbow(4))


#counts2=table(phylo[nBlast==100000],machine[nBlast==100000])
#barplot(counts2,col=rainbow(4))

