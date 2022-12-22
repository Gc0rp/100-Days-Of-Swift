//
//  ContentView.swift
//  Day-35
//
//  Created by Ojas Gupta on 22/12/2022.
//

import SwiftUI

struct TimeTableSheet: View {
    let tablesSelected: Int
    let numberOfQuestionsSelected: Int
    
    @State var userAnswer: Int = 0
    @State var correctAnswer: Bool = false
    @State var submitTapped: Bool = false
    @State var rightHandSide: Int = Int.random(in: 2...12)
    @State var amountOfQuestionsAsked: Int = 0
    @State var score: Int = 0
    
    @Environment(\.dismiss) var gameOver
    
    var body: some View {
        
        if (numberOfQuestionsSelected != amountOfQuestionsAsked) {
            VStack {
                Text("What is \(tablesSelected) x \(rightHandSide)")
                TextField("Enter here", value: $userAnswer, format: .number).keyboardType(.numberPad)
                
                if(submitTapped) {
                    if(correctAnswer) {
                        Text("Correct!")
                    } else {
                        Text("Incorrect :(")
                    }
                }
                
                HStack {
                    Button("Submit") {
                        onSubmitTapped(answer_is: userAnswer)
                    }
                    .disabled(submitTapped == true)
                    
                    Button("Next") {
                        nextQuestion()
                    }.disabled(submitTapped == false)
                }
            }
        } else {
            VStack {
                Text("You had a total score of \(score) / \(amountOfQuestionsAsked)")
                
                Button("Play Again", action: playAgain)
            }
        }

    }
    
    func playAgain() {
        userAnswer = 0
        correctAnswer = false
        submitTapped = false
        rightHandSide = Int.random(in: 2...12)
        amountOfQuestionsAsked = 1
        score = 0
        
        gameOver()
    }
    
    func nextQuestion () {
        rightHandSide = Int.random(in: 2...12)
        submitTapped = false
    }
    
    func onSubmitTapped (answer_is number: Int) {
        submitTapped = true
        amountOfQuestionsAsked += 1
        if ((tablesSelected * rightHandSide) == number) {
            correctAnswer = true
            score += 1
        } else {
            correctAnswer = false
        }
    }
}

struct ContentView: View {
    @State private var tables = 2
    @State private var numberOfQuestions = 5
    
    @State var showSecondScreen = false
    
    var body: some View {
        VStack {
            Stepper("Select your times table: ", value: $tables, in: 2...12)
            Text("\(tables) times table selected")
            
            VStack {
                Picker("Number of questions", selection: $numberOfQuestions) {
                    Text("5").tag(5)
                    Text("10").tag(10)
                    Text("20").tag(20)
                }.pickerStyle(.segmented)
            }
            
            
            Button("Start") {
                showSecondScreen.toggle()
            }
            .sheet(isPresented: $showSecondScreen) {
                TimeTableSheet(tablesSelected: tables, numberOfQuestionsSelected: numberOfQuestions)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
