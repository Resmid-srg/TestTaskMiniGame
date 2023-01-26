//
//  UserGuessingViewModel.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import Foundation

class UserGuessingViewModel {
    
    var computerScore = Score(numberOfTry: 0, hiddenNumber: 0)
    
    var tryNumber = Dynamic("")
    var computerNumberIs = Dynamic("")
    var tapRecognizerAccessibility = Dynamic(false)
    
    func startGame() {
        computerScore.hiddenNumber = Int.random(in: 1...100)
        print(computerScore.hiddenNumber)
        computerScore.numberOfTry = 1
    }

    func userGuessButtonTapped(text: String) {
        
        if let number = Int(text) {
            computerScore.numberOfTry += 1
            tryNumber.value = "Try № \(computerScore.numberOfTry)"

            switch number {
            case ..<computerScore.hiddenNumber:
                computerNumberIs.value = "No, it is higher than \(number) 🙄"
            case (computerScore.hiddenNumber + 1)... :
                computerNumberIs.value = "My number is less than \(number) 🤭"
            default:
                computerNumberIs.value = "Wow! 😮 you guessed it!"
                tapRecognizerAccessibility.value = true
            }
        } else {
            computerNumberIs.value = "Hey! 😡 You entered characters"
        }
    }
}



