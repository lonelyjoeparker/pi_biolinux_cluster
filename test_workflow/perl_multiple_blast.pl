#iterate through an alignment BLASTING it


$last_name='';
$last_seq='';
$counter = 0;

open(IN,$ARGV[0]);
while(<IN>){
	chomp($line=$_);
	if($line =~ />/){
		#we're in a name, print (BLAST) the old one
		$seq_var = "\"$last_name\\n$last_seq\"";
		$com="echo $seq_var | blastp -query - -db concatenated_CEGMA_aa.fa -outfmt \"6 qseqid sseqid evalue bitscore length\" -max_target_seqs 1 -evalue 1e-10";

		#read output
		@fields=split(/\t+/,`$com`);
		$qseqid=$fields[0];
		$sseqid=$fields[1];
		$evalue=$fields[2];
		$bitscore=$fields[3];
		$alength=chomp($fields[4]);

		#get the gene id from the sseqid
		$which_gene='null';
		if($sseqid =~ /KOG[0-9]{1,5}/){$which_gene=$&};

		#only bother printing stuff with e < 10^-10 and score > 1
		if($bitscore>1){
			
			#indented print
			#print "
			#$qseqid=qseqid[0];
			#$sseqid=sseqid[1]; (which gene = [$which_gene])
			#$evalue=evalue[2];
			#$bitscore=bitscore[3];
			#$alength=alength[4];
			#";
	
			#tabulated print
			print "[$counter]\t$qseqid\t$sseqid\t[$which_gene]\t$evalue\t$bitscore\talen=$alength\n";
		}


		#then set up the new name/seq to blank
		$last_name = $line;
		$last_seq = '';
		$counter++;
	}else{
		#in a sequence
		$last_seq .= $line;
	}
}
close(IN);