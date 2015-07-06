open(IN,$ARGV[0]);

#nb alignment destinations are in /Users/joeparker/Documents/all_work/pi_project_pipeline/concat_alignment_hits
#nb source multifiles are in /Users/joeparker/Documents/all_work/pi_project_pipeline/single_sequences
#nb e.g. single_sequence_HWI-1KL107:34:C0M0KACXX:8:1101:14616:42866_1_101_-
#nb e.g. alignment destinations by_gene_KOG349

while(<IN>){
	chomp($line=$_);
	@fields = split(/\t/,$line);
	$gene = $fields[1];
	print "seq: $fields[0]\n";
	if($fields[1] =~ /KOG[0-9]{1,5}/){$gene=$&;}
	print "gene: $gene\n";
	
	print "cat ../single_sequences/single_sequence_".$fields[0]." >> ../concat_alignment_hits/by_gene_".$gene."\n";
	$cmd = "cat ../single_sequences/single_sequence_".$fields[0]." >> ../concat_alignment_hits/by_gene_".$gene."\n";
	system($cmd);
}

close(IN);