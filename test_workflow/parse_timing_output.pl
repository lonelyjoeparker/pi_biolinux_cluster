open(IN,$ARGV[0]);
open(OUT,'>',$ARGV[1]);

print "ID\tblast_real\tblast_user\tblast_sys\tphylo";
$in_phylo_analyses = 0;
$current_ID;
while(<IN>){
	chomp($line = $_);
	if($line =~ /RAxML_analysis|muscle_analysis/){
		$in_phylo_analyses = 1;
		print OUT "\n$current_ID\t$&\t";
	}
	if($line =~ /phylotime/){
		$in_phylo_analyses = 0;
		if($line =~ /[0-9]+s/){
			print substr($&,0,-1)."\t";
		}
	}
	if($line =~ /ID[0-9\-a-z]+/){
		print "\n$&\t";
		#print OUT "\n$&\t";
		$current_ID = $&;
	}
	if($line =~ /real|user|sys/){
		if($line =~ /[0-9\.]+/){
			if($in_phylo_analyses == 0){
				print "$&\t";
			}else{
				print OUT "$&\t";
			}
		}
	}
}
close(IN);
close(OUT);
print "\n";