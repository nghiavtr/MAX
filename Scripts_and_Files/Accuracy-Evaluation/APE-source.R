	
err = function(result_est,true){##salmon and true are expanded

	seq_err = matrix(0,nrow(result_est),1)
	rownames(seq_err) = rownames(result_est)

	for(i in 1:nrow(result_est))
	{
	seq_err2 = abs(result_est[i,] - true[i,])/(true[i,]+1)
	seq_err[i] = median(seq_err2,na.rm=TRUE)
	}
	return(seq_err)
}


expand = function(result_est,salmon)
{##result_est from sequgio , salmon from different methods
salmon1 = matrix(0,length(unique(unlist(strsplit(rownames(result_est)," ")))),100)
rownames(salmon1) = unique(unlist(strsplit(rownames(result_est)," ")))
colnames(salmon1) = colnames(result_est)
salmon1[rownames(salmon1),] = salmon[rownames(salmon1),]

salmon = matrix(0,nrow(result_est),100)
rownames(salmon) = rownames(result_est)
colnames(salmon) = colnames(result_est)
rowname = rownames(result_est)
tx = strsplit(rownames(result_est)," ")
ntx = sapply(tx,length)
rowname_salmon = rownames(salmon)[ rownames(salmon) %in% rowname]
salmon[rowname_salmon,] = salmon[rowname_salmon,]
pick = ntx>1
tx2 = tx[pick]
for(i in 1:length(tx2)){
 tmp = salmon1[tx2[[i]],];tmp2 = colSums(tmp);salmon[paste(tx2[[i]],collapse=" "),] = tmp2;
 			}
## salmon 
return(salmon)
}


