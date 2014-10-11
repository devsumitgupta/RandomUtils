#!/usr/bin/perl -w
#
# $dir1 is : The place you want all data (superset)
# $dir2 is : The place from where all the data should be copied to $dir1


#$dir1 = "C:/Users/sumitgup/Documents/BACKUP/Desktop\ Backup";
#$dir1 = "G:/Downloads/";
$dir1 = "G:/Songs/Hindi";
opendir DIR, $dir1 or die " Couldnt open $dir1";
my @files1 = readdir DIR;
closedir DIR;
my %params = map { $_ => 1 } @files1;

#$dir2 = "C:/Users/sumitgup/Documents/BACKUP/Desktop\ Backup/Desktop";
#$dir2 = "C:/Users/Sumit/Downloads/Movies";
#$dir2 = "C:/Downloads";
$dir2 = "C:/Users/Sumit/Documents/Songs/Hindi\ Songs";

opendir DIR, $dir2 or die "Coudnt open $dir2";
my @files2 = readdir DIR;
closedir DIR;

open(MYFILE, '>diff1.txt');
print MYFILE "Comparing $dir1(superset) with $dir2\n\n";

foreach my $file (@files2) {
unless(exists($params{$file})) {
print MYFILE "$file\n";

}

}
close(MYFILE);
#foreach my $file (@files) { print "$file\n"; }

