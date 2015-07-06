# input alignments are ordered by species
# we need to append the input species name to each of two outputs; 
#	- concatenated of all (simple append-and-cat)
#	- concatenated by gene

# parse inputs
chomp($filename=$ARGV[0]);
open(IN,$filename) or die("unable to open filename $filename\n");

#loopthrough
$prev_name = 'NULL';
$prev_sequence = 'NULL';
while(<IN>){
	chomp($line=$_);
	# test: are we in a name line ('>foo_bar_etc')
	if($line =~ />/){
		# we are in a name
		# write out the sequence (name, buffer)
		$sequence = $prev_name ."\n".$prev_sequence."\n";
		open(GENE,'>','../single_sequences/single_sequence_'.substr($prev_name,1,length($prev_name)-1)) or die("unable to open single_sequence_$prev_name");
		print GENE $sequence;
		close(GENE);
		
		# parse the new name
		$prev_name = $line;
		$prev_sequence = '';
	}else{
		# this is just a sequence line; append to buffer
		$prev_sequence .= $line;
	}
}

#tidy up
close(IN);
