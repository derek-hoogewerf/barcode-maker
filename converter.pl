#!/usr/bin/perl 
use warnings;
use strict;
use GD::Barcode;
use GD::Barcode::Code39;
binmode(STDOUT);
print "Content-Type: image/png\n\n";
print GD::Barcode::Code39->new('*CODE39IMG*')->plot->png;

my $oGdBar = GD::Barcode::Code39->new('*123456789;*');
die $GD::Barcode::Code39::errStr unless($oGdBar);     #Invalid Characters

# &convert;

# to convert full ASCII into Code 39
sub convert {
   my $ascii_str = "Monkey 123";
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
   print "$code39";
   
}