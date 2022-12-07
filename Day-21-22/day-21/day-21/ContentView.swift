//
//  ContentView.swift
//  day-21
//
//  Created by Ojas Gupta on 6/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland",
    "Russia", "Spain", "UK", "US"]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State var numberOfGames = 0
    @State var numberOfWrongs = 0
    @State var numberOfRights = 0
    @State private var showingAlert = false
    
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
                        Text(countries[correctAnswer]).font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            // flag was tapped
                            flagTapped(number)
                        } label : {
                            Image(countries[number]).renderingMode(.original).clipShape(Capsule()).shadow(radius: 5)
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
                     Button("Cancel", role: .cancel) {}
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
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
            numberOfRights += 1
        } else {
            scoreTitle = "Wrong"
            currentScore -= 1
            numberOfRights -= 1
        }
        showingScore = true
    }
    
    
    func restart() {
        numberOfGames = 0
        currentScore = 0
        numberOfRights = 0
        numberOfWrongs = 0
        
        askQuestion()
    }
    
    func askQuestion() {
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
