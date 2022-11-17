import Cocoa

var movies: [String] = ["GI Joe", "Lord of the Rings", "Lord of the Rings", "Harry Potter"]

var uniqueMovies = Set<String>()

print("Number of movies \(movies.count)")

print("Number of unique movies \(Set(movies).count)")
