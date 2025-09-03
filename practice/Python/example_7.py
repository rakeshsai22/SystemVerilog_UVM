# Map / Filter / Reduce


# Map is used to apply the given function to all the items in the iterable
def square (num):
    return num ** 2

numbers = [1,2,3,5,6,7]

squares = map(square,numbers)

print(list(squares))

# Filter is used to filter elements from an iterable based on a condition defined byb a function

def is_even(num):
    return num %2 == 0

even_numbers = filter(is_even,numbers)

print(list(even_numbers))

# Reduce is used to apply a binary function that takes in two arguments cumulatively to the items of an iterable
#   from left to right to reduce the iterable to a single value
from functools import reduce

def multiply(x,y):
    return x*y
product = reduce(multiply,numbers)
print(product)

even_squares = filter(is_even,squares)
print(list(even_squares))