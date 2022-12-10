//
//  ContentView.swift
//  rock-paper-scissors
//
//  Created by Ojas Gupta on 10/12/2022.
//

import SwiftUI


struct ContentView: View {
    var options: [String] = ["Rock", "Paper", "Scissors"]
    @State public var aiChoice: String = ""
    @State public var playerResult: Bool? = false
    @State public var playerMove: String = ""
    @State public var playerScore: Int = 0
    
    @State public var gameFinished = false
    
    @State public var numberOfGamesPlayed: Int = 0
    var body: some View {
        VStack {
            Text("Player's Score: \(playerScore)")
            Text("App's move: \(aiChoice)")
            Text("Result: \((playerResult == true) ? "Player Won" : "Player Lost")")
            
            
            HStack {
                Button("Rock", action: {selectMove("Rock")})
                Button("Paper", action: {selectMove("Paper")})
                Button("Scissors", action: {selectMove("Scissors")})
            }

        }.alert("Game Over", isPresented: $gameFinished) {
            Button("Restart", action: restart)
        } message: {
            Text("Your score is: \(playerScore)")
        }
    }
    
    func restart() {
        aiChoice = ""
        playerScore = 0
        playerResult = nil
        playerMove = ""
        gameFinished = false
        numberOfGamesPlayed = 0
    }
    
    func displayResult() -> Void {
        if(playerMove == "Rock" && aiChoice == "Scissors") {
            playerResult = true
        } else if (playerMove == "Paper" && aiChoice == "Rock") {
            playerResult = true
        } else if (playerMove == "Scissors" && aiChoice == "Paper") {
            playerResult = true
        } else if (playerMove == aiChoice) {
            playerResult = true
        } else {
            playerResult = false
        }
        
        if(playerResult == true) {
            playerScore += 1
        } else {
            playerScore -= 1
        }
        
        if(numberOfGamesPlayed > 9) {
            gameFinished = true
        }
    }
    
    func selectAIMove() -> Void {
        aiChoice = options[Int.random(in: 0...2)]
        displayResult()
    }
    
    func selectMove(_ move: String) -> Void {
        playerMove = move
        numberOfGamesPlayed += 1
        selectAIMove()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
