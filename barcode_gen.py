import sys
# import Code39 from barcode module
from barcode import Code39

# import ImageWriter to generate an image file
from barcode.writer import ImageWriter

# Make sure to pass the number as string
number = sys.argv[1]

# create an object of EAN13 class and
# pass the number with the ImageWriter() as the
# writer
my_code = Code39(str(number), writer=ImageWriter())

# ready barcode
my_code.save("new_code1")
