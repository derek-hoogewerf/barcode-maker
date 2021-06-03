#!/usr/bin/perl 
use warnings;
use strict;

my $param = &convert();
my @cmd = ('/usr/bin/python3');
push @cmd, '/home/derek/Documents/GH/barcode/barcode_gen.py';

system(@cmd, $param);

# to convert full ASCII into Code 39
sub convert {
   print "Enter barcode string:\n";
   my $ascii_str = <>;
   chomp($ascii_str);
   my ($char, $code39);
   $code39 = "";
   foreach $char (split('', $ascii_str)) 
   {
      if($char =~/[A-Z]/)
      {
         $code39 .= $char;
      }
      elsif($char =~ /[a-z]/)
      {
         $code39 .= "+";
         $code39 .= uc($char);
      }
      elsif($char =~ /^[0-9]+$/)
      {
         $code39 .= $char;
      }
      elsif($char eq "!")
      {
         $code39 .= "/A";
      }
      elsif($char eq "\"")
      {
         $code39 .= "/B";
      }
      elsif($char eq "#")
      {
         $code39 .= "/C";
      }
      elsif($char eq "\$")
      {
         $code39 .= "/D";
      }
      elsif($char eq "\%")
      {
         $code39 .= "/E";
      }
      elsif($char eq "&")
      {
         $code39 .= "/F";
      }
      elsif($char eq "\‘")
      {
         $code39 .= "/G";
      }
      elsif($char eq "(")
      {
         $code39 .= "/H";
      }
      elsif($char eq ")")
      {
         $code39 .= "/I";
      }
      elsif($char eq "*")
      {
         $code39 .= "/J";
      }
      elsif($char eq "\+")
      {
         $code39 .= "/K";
      }
      elsif($char eq ",")
      {
         $code39 .= "/L";
      }
      elsif($char eq "–")
      {
         $code39 .= "/M";
      }
      elsif($char eq "\.")
      {
         $code39 .= "/N";
      }
      elsif($char eq "\/")
      {
         $code39 .= "/O";
      }
      elsif($char eq "\:")
      {
         $code39 .= "/Z";
      }
      else
      {
         # Invalid Character: Do Not Include
      }
   }
   # print "$code39";
   return $code39;
}

=python inline code
use Inline Python => <<'END_OF_PYTHON_CODE';
from barcode import Code39

from barcode.writer import ImageWriter
my_code = Code39({$barcode}, writer=ImageWriter())

my_code.save("new_code1")

 
END_OF_PYTHON_CODE
=cut
