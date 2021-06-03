from os import write
import sys
# import Code39 from barcode module
from barcode.codex import Code39, Code128

# import ImageWriter to generate an image file
from barcode.writer import ImageWriter

# Make sure to pass the number as string
number = sys.argv[1]

choice = input("Code 39 or Code 128")

# create an object of EAN13 class and
# pass the number with the ImageWriter() as the
# writer
if(choice == "128"):
   my_code = Code128(str(number), writer=ImageWriter())
else:
   my_code = Code39(str(number), writer=ImageWriter())

# ready barcode
my_code.save("new_code1")
