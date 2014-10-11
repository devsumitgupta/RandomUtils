#!/usr/bin/perl 
               
# dir1 is the place where you want all the data (superset)
#dir2 is the place from where you want to copy (not copied data ) to dir1
#$dir = "./mp3s";
#$dir1 = "C:/Users/sumitgup/Documents/BACKUP/Desktop\ Backup";
$dir1 = "C:/Downloads/Test/1";
opendir DIR, $dir1 or die " Couldnt open $dir1";
my @files1 = readdir DIR;
closedir DIR;
my %params = map { $_ => 1 } @files1;

#$dir2 = "C:/Users/sumitgup/Documents/BACKUP/Desktop\ Backup/Desktop";
$dir2 = "C:/Downloads/Test/2";

opendir DIR, $dir2 or die "Coudnt open $dir2";
my @files2 = readdir DIR;
closedir DIR;

open(MYFILE, '>diffT.txt');
open(SIZEDIFF,'>sizeDiff.txt');

my $size1 = 0;
my $size2 = 0;
foreach my $file (@files2) {
$size1 = 0;
$size2 = 0;
print " checking for $file in $dir1 with $dir2\n";
if(!exists($params{$file})) {
print MYFILE "\n";
print MYFILE "\n fxcopy $dir2/$file $dir1 /S";
print " file $file is not in dir1\n";
if(((-d "$dir1$file")&&(-f "$dir2$file"))||((-d "$dir2$file") && (-f "$dir1$file"))  )
{
print "FILE TYPE MISSMATCH $dir1$file \n";
}
else {
# THIS MEANS BOTH ARE OF SAME TYPE : FILE OR DIR
print "inside else \n";
if(-d "$dir1$file") {
print "checking for file $dir1$file";
opendir GETSIZE, "$dir1$file" or die "Couldnt open $dir1$file";
foreach(readdir(GETSIZE)) {
$size1 += (stat("$dir1$file/$_"))[7] unless /^\.\.?$/;
}
print SIZEDIFF "size of dir $dir1$file is $size1"; 
close(GETSIZE);
}

if(-d "$dir2$file") {
opendir GETSIZE, "$dir2$file" or die "Couldnt open $dir2$file";
foreach(readdir(GETSIZE)) {
$size2 += (stat("$dir2$file/$_"))[7] unless /^\.\.?$/;
}
print SIZEDIFF " size of dir $dir2$file is $size2";
close(GETSIZE);
}
print "both are not dir \n";
$size1 = (stat("$dir1$file"))[7];
$size2 = (stat("$dir2$file"))[7];
if($size1 == $size2) {
print SIZEDIFF " size of $dir1/$file = $size1 \n size of $dir2/$file = $size2";
}
}

}
else {

#print MYFILE "$file \n";

}

}
close(MYFILE);
close(SIZEDIFF);
#foreach my $file (@files) { print "$file\n"; }

