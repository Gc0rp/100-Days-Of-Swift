//
//  ContentView.swift
//  day-21
//
//  Created by Ojas Gupta on 6/12/2022.
//

import SwiftUI


struct FlagImage: View {
    var flagName: String
    var flagLabel: String
    
    var body: some View {
        Image(flagName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
            .accessibilityLabel(flagLabel)
    }
}

struct Heading: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.largeTitle).foregroundColor(.blue)
    }
}

extension View {
    func heading() -> some View {
        modifier(Heading())
    }
}


struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland",
    "Russia", "Spain", "UK", "US"]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    @State private var labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    
    @State var numberOfGames = 0
    @State var numberOfWrongs = 0
    @State var numberOfRights = 0
    @State private var showingAlert = false
    
    @State private var animationAmount = 360.0
    @State private var flagPosition = 0
    @State private var notSelected = 1.0
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Guess the Flag").font(.largeTitle.bold()).foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of").foregroundStyle(.secondary).font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer]).heading()
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            // flag was tapped
                            flagTapped(number)
                        } label : {
                            FlagImage(flagName: countries[number], flagLabel: labels[countries[number]]!).rotation3DEffect(.degrees(flagPosition == number ? animationAmount: 0), axis: (x: 0, y: 1, z: 0)).opacity((flagPosition != number) ? notSelected : 1).rotation3DEffect(.degrees(flagPosition != number ? animationAmount: 0), axis: (x: 1, y: 0, z: 0))
                        }
                    }
                }.frame(maxWidth: .infinity).padding(.vertical, 20).background(.regularMaterial).clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(currentScore)").foregroundColor(.white).font(.title.bold())
                
                Spacer()
            }.padding()
             .alert(scoreTitle, isPresented: $showingScore) {
                 if(numberOfGames < 8) {
                     Button("Continue", action: askQuestion)
                 } else {
                     Button("Restart", action: restart)
                     Button("Cancel", role: .cancel) {
                         notSelected = 1.0
                     }
                 }
            }  message: {
                if(numberOfGames < 8) {
                    if scoreTitle == "Wrong" {
                        Text("Wrong! That's the flag of \(scoreTitle) Your score is \(currentScore)")
                    } else {
                        Text("Correct! That's the flag of \(scoreTitle) Your score is \(currentScore)")
                    }
                } else {
                        Text("The game has concluded you have \(numberOfRights) right answers and \(numberOfWrongs) wrong answers.")

                }

            }
        }
    }
    
    func flagTapped(_ number: Int) {
        flagPosition = number
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
            numberOfRights += 1
            
            withAnimation {
                animationAmount += 360
                notSelected -= 0.85
            }
            
        } else {
            scoreTitle = "Wrong"
            currentScore -= 1
            numberOfRights -= 1
        }
        showingScore = true
    }
    
    
    func restart() {
        notSelected = 1.0
        numberOfGames = 0
        currentScore = 0
        numberOfRights = 0
        numberOfWrongs = 0
        
        askQuestion()
    }
    
    func askQuestion() {
        notSelected = 1.0
        if(numberOfGames < 8) {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            numberOfGames += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
