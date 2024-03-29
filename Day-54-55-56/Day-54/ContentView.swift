//
//  ContentView.swift
//  Day-54
//
//  Created by Ojas Gupta on 14/1/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title, order: .reverse)
    ]) var books: FetchedResults<Book>

    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            HStack {
                                EmojiRatingView(rating: book.rating)
                                    .font(.largeTitle)
                                
                                VStack(alignment: .leading){
                                    Text(book.title ?? "Unknown Title")
                                        .font(.headline)

                                    Text(book.author ?? "Unknown Author")
                                        .foregroundColor(.secondary)
                                }
                            }
                            
                            if (book.rating == 1) {
                                Spacer()
                                
                                HStack {
                                    Capsule()
                                        .fill(Color.red)
                                        .overlay(
                                            Text("Low Rating").foregroundColor(.white).bold()
                                        )
                                        .frame(width: 100, height: 25)
                                        .padding()
                                }
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
//        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
