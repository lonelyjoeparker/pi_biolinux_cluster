#get the output of a single command

#$command = "echo -e \">HWI-1KL107:34:C0M0KACXX:8:2307:14526:82585_1_101_-\\nASDDIGYNSGVGTSYVRLRIHVVDWGGDVKFQS\" | blastp -query - -db concatenated_CEGMA_aa.fa -outfmt \"6 qseqid sseqid evalue bitscore length\" -max_target_seqs 1";

#`echo -e \">HWI-1KL107:34:C0M0KACXX:8:2307:14526:82585_1_101_-\\nASDDIGYNSGVGTSYVRLRIHVVDWGGDVKFQS\" | blastp -query - -db concatenated_CEGMA_aa.fa -outfmt \"6 qseqid sseqid evalue bitscore length\" -max_target_seqs 1`;

#print "try system:\n[$command]\n";

#system($command);

#### OK try it as a seq

#print "\n"x5;

$seq_var = "\">HWI-1KL107:34:C0M0KACXX:8:2307:14526:82585_1_101_-\\nASDDIGYNSGVGTSYVRLRIHVVDWGGDVKFQS\"";
#system(`blast_tmp_var=$seq_var`);
#system(`echo -e 'poo' `);
#$com="echo $seq_var ";
#system($com);
#system(`echo -e $blast_tmp_var `);
#system(`echo -e $blast_tmp_var | blastp -query - -db concatenated_CEGMA_aa.fa -outfmt \"6 qseqid sseqid evalue bitscore length\" -max_target_seqs 1`);
#print "try direct \n";
#$com="echo $seq_var | blastp -query - -db concatenated_CEGMA_aa.fa -outfmt \"6 qseqid sseqid evalue bitscore length\" -max_target_seqs 1";
#system($com);
print "try backticks\n";
$com="echo $seq_var | blastp -query - -db concatenated_CEGMA_aa.fa -outfmt \"6 qseqid sseqid evalue bitscore length\" -max_target_seqs 1";
@fields=split(/\t+/,`$com`);
#foreach $output(@fields){
#	print "output\n$output\n";
#}
$qseqid=$fields[0];
$sseqid=$fields[1];
$evalue=$fields[2];
$bitscore=$fields[3];
$alength=chomp($fields[4]);
#get the gene id from the sseqid
$which_gene='null';
if($sseqid =~ /KOG[0-9]{1,5}/){$which_gene=$&};
print "
$qseqid=qseqid[0];
$sseqid=sseqid[1]; (which gene = [$which_gene])
$evalue=evalue[2];
$bitscore=bitscore[3];
$alength=alength[4];
";

