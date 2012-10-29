#!/usr/bin/perl

 # vmclone.pl
 # ----------
 #
 # vmclone.pl is a perl script that was written to address the deficiencies
 # in ESX server when you want to create a complete duplicate of a Virtual
 # Machine.  Usually you would have had to clone the disk, then recreate
 # the virtual machine to use that disk.  With vmclone.pl you change to the
 # directory where your VMs are stored (usually /vmfs/volumes/storage1)
 # and run the command: vmclone.pl "source dir" "destination dir".
 #
 # If any of the filenames within the source dir contain "source dir"
 # then they will be replaced with "destination dir".  The vmx VM
 # specification file, and related snapshot description files will be
 # modified automatically to point to the correct new filenames.
 #
 # This also maintains any snapshots in the cloned VM so you can see them
 # in the Snapshot Manager and still revert to earlier snaps.
 #
 # No warranty is implied or given - use at your own risk. Keep backups.
 # If you screw it up, it is not my fault. Use of this tool constitutes
 # your acceptance of these terms.
 #
 # Source website: http://www.pgregg.com/projects/vmclone/
 # Version 1.1
 #
 # This software is Donationware - if you feel you have benefited from
 # the use of this tool then please consider a donation. The value of
 # which is entirely left up to your discretion.
 # http://www.pgregg.com/donate/
 #
 # Installation: Copy this file to /usr/local/bin/vmclone.pl, make it
 # executable and then ensure it is in your path. e.g.:
 #   mkdir -p /usr/local/bin
 #   cp vmclone.pl /usr/local/bin/
 #   chmod a+rx /usr/local/bin/vmclone.pl
 #   ln -s /usr/local/bin/vmclone.pl /usr/bin/vmclone
 #
 # Type "vmclone" on its own for usage guidelines.
 #
 # Thank you and enjoy.
 # Paul Gregg
 # (c) Paul Gregg, 2007 - All rights reserved.



if ( $< + $> != 0 ) {
  print "Error: $0 needs to be run as the root user.\n";
  exit 1;
}

usage() if ($#ARGV < 1);
$source = shift @ARGV;
$dest = shift @ARGV;

unshift @ARGV, "s/$source/$dest/"; # default to replace in text files

if ( ! -d "$source" ) {
  print "Error: Source directory '$source' does not exist.\nPlease specify a relative path to CWD or the full path\n";
  exit 2;
}

if ( -d "$dest" ) {
  print "Error: Destination directory '$dest' already exists.\nYou cannot overwrite an existing VM image with this tool.\n";
  exit 3;
}

my $regexwarn = 0;
foreach (@ARGV) {
  if ( ! /^s\/[^\/]+\/[^\/]+\/$/ ) {
    $regexwarn = 1;
    warn "Error: Invalid regex pattern in: $_\n";
  }
}
exit 4 if $regexwarn == 1;



# If we get here then $source and $dest are good

if ( ! mkdir "$dest" ) {
  print "Error: Failed to create destination directory '$dest': $!\n";
  exit 4;
}


# Now get a list of all the files in each directory and copy them to dest
@files = listdir($source);
#print @files;

foreach $srcfile (@files) {
  # we want to copy $srcfile from $src to $dest

  # but first check if we need to rename the file
  $destfile = $srcfile;
  if ($destfile =~ /$source/ ) {
    # source filename contains the source dir name, rename it
    $destfile =~ s/$source/$dest/gi;
  }
  $istext = is_vmtextfile($srcfile);

  printf("Copying %s: %s/%s -> %s/%s\n",
    ($istext ? "text" : "binary"),
    $source, $srcfile,
    $dest, $destfile);

  if ($istext == 0) { # do binary copy - no need to check regexreplace args
    copy_file_bin("$source/$srcfile", "$dest/$destfile");
  } else { # text copy - need to string replace on each line.
    copy_file_regex("$source/$srcfile", "$dest/$destfile", @ARGV);
    chmod 0755, "$dest/$destfile" if ($destfile =~ /\.vmx$/); # file needs to be mode 0755
  }

}


exit 0;

sub copy_file_regex {
  my $src = shift;
  my $dst = shift;
  my @regexs = @_;
  my $buf = '';
  my $regex = '';

  open(COPYIN, "<$src")  || warn "Can't read $src: $!\n";
  open(COPYOUT, ">$dst") || warn "Can't write $dst: $!\n";
  binmode COPYIN;
  binmode COPYOUT;

  while ( read(COPYIN, $buf, 65536) ) {
   #while ($buf = <COPYIN>) {
    foreach $regex (@regexs) {
      (undef, $search, $replace) = split("/", $regex);
      $buf =~ s/$search/$replace/g;
    }
    print COPYOUT $buf;
  }

  close COPYOUT || warn "Can't close $dst: $!\n";
  close COPYIN  || warn "Can't close $src: $!\n";
}

sub copy_file_bin {
  my ($src, $dst) = @_;
  my $buf;

  open(COPYIN, "<$src")  || warn "Can't read $src: $!\n";
  open(COPYOUT, ">$dst") || warn "Can't write $dst: $!\n";
  binmode COPYIN;
  binmode COPYOUT;

  while ( read(COPYIN, $buf, 65536) and print COPYOUT $buf ) {};
  warn "Could not complete copy: $!\n" if $!;

  close COPYOUT || warn "Can't close $dst: $!\n";
  close COPYIN  || warn "Can't close $src: $!\n";
}


sub is_vmtextfile {
  my $file = shift;
  my $istxt = 0;
  $istxt = 1 if ( $file =~ /\.(vmdk|vmx|vmxf|vmsd|vmsn)$/ );
  $istxt = 0 if ( $file =~ /-flat\.vmdk$/ );
  $istxt = 0 if ( $file =~ /-delta\.vmdk$/ );
  return $istxt;
}

sub listdir {
  my $dir = shift;
  my @nfiles = ();
  opendir(FH, $dir) || warn "Can't open $dir: $!\n";
  @nfiles = grep { (-f "$dir/$_" && !-l "$dir/$_") } readdir(FH);
  closedir(FH);
  return @nfiles;
}






sub usage {
  print <<EOUSAGE;
$0: Tool to "quickly" clone a VMware ESX guest OS

Usage: $0 sourcedir destdir
       $0 "source dir" "dest dir"
       $0 sourcedir destdir [regexreplace [...]]

e.g. vmclone "winxp" "uscuv-clone" 's/memsize = "512"/memsize = "256"/'

Clones a vmware image located in sourcedir to the destdir directory.
The source machine must be powered off for this to correctly clone it.

By default, if any filenames have "sourcedir" as part of their filename,
then it is renamed to "destdir".

The optional regexreplace argument will cause that regular expression
to be performed on all the text files being copied. A default regexreplace
of s/sourcedir/destdir/ is done by default. You may use multiple regexs.

Author: Paul Gregg <pgregg\@pgregg.com>
        Jan 7, 2007
EOUSAGE
  exit 1;
}
