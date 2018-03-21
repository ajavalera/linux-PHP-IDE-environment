import math

def printing():
    print("This is a {} that is being {}".format("string", "formated"))
    print("This is the number pi {0:.4f} with 4 decimal spaces.".format(math.pi))

    formatValues = {'first one': 'value is a text', 'second': 566, 'third': 222}
    print("This is a string: '{0[first one]:s}', this is a number: {0[second]:d}, and this is an integer as float: {0[third]:.2f}".format(formatValues))
    print("The same but using different format notation: {first one:s}, {second:d}, {third:.3f}".format(**formatValues))

