//
//  UserGuessingViewModel.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import Foundation

class UserGuessingViewModel {

    var tryNumber = Dynamic("")
    var computerNumberIs = Dynamic("")
    var tapRecognizerAccessibility = Dynamic(false)
    var resultScore = Dynamic((0, 0, ""))

    // MARK: - Methods

    func startGame() {
        Score.computerScore.hiddenNumber = Int.random(in: 1...100)
        Score.computerScore.numberOfTry = 1
    }

    func userGuessButtonTapped(text: String) {

        if let number = Int(text) {
            Score.computerScore.numberOfTry += 1
            tryNumber.value = "Try № \(Score.computerScore.numberOfTry)"

            switch number {
            case ..<Score.computerScore.hiddenNumber:
                computerNumberIs.value = "No, it is higher than \(number) 🙄"
            case (Score.computerScore.hiddenNumber + 1)...:
                computerNumberIs.value = "My number is less than \(number) 🤭"
            default:
                computerNumberIs.value = "Wow! 😮 you guessed it!"
                tapRecognizerAccessibility.value = true
            }
        } else {
            computerNumberIs.value = "Hey! 😡 You entered characters"
        }
    }

    func resultsOfGame() {
        resultScore.value.1 = Score.userScore.numberOfTry
        resultScore.value.0 = Score.computerScore.numberOfTry

        if resultScore.value.1 > resultScore.value.0 {
            resultScore.value.2 = "You Win"
        } else if resultScore.value.1 == resultScore.value.0 {
            resultScore.value.2 = "Draw"
        } else {
            resultScore.value.2 = "Computer Win"
        }
    }
}
