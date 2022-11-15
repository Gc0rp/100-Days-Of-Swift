import Cocoa

// Regular variable
var name = "Oj"

print(name)
name = "Elmo"
print(name)

// Constant variable
let character = "Daphne"

// Multiline string
let movie = """
A day in
the life of an
Apple Engineer
"""

// Getting the length of a string
print(movie.count)

// Uppercasing string
print(movie.uppercased())

// Checking for prefix
print(movie.hasPrefix("A day"))

// Checking for suffix
print(movie.hasSuffix("Engineer"))

// Checking if a number is multiple of another number
var num = 120
print(num.isMultiple(of: 3))


// Typecasting int to double
var num1 = 1
print(Double(num1))

// Typecasting double to int
var num2 = 2.0
print(Int(num2))
