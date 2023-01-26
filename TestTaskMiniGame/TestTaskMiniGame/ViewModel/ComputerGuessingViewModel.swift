//
//  ComputerGuessingViewModel.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import Foundation

class ComputerGuessingViewModel {
    
    var userScore = EnterNumberViewModel().userScore
    
    var userNumberIs = Dynamic("")
    var tryNumber = Dynamic("")
    var resultRound = Dynamic("")
    var buttonAccessibility = Dynamic(true)
    
    var maxNumber = 100
    var minNumber = 0
    var randomNumber = Int.random(in: 1...100)
    
    func startGame() {
        userNumberIs.value = "Your number is - \(randomNumber)?"
        userScore.numberOfTry = 1
    }
    
    func userButtonTapped(result: String) {
        
        switch result {
        case "<":
            maxNumber = randomNumber - 1
            if minNumber >= maxNumber { fallthrough }
            userScore.numberOfTry += 1
            randomNumber = Int.random(in: minNumber...maxNumber)
            userNumberIs.value = "Your number is - \(randomNumber)?"
        case ">":
            minNumber = randomNumber + 1
            if minNumber >= maxNumber { fallthrough }
            userScore.numberOfTry += 1
            randomNumber = Int.random(in: minNumber...maxNumber)
            userNumberIs.value = "Your number is - \(randomNumber)?"
        default:
            buttonAccessibility.value = false
            if result == "=" {
                userNumberIs.value = "Wow 🤯 The computer guessed the number"
            } else {
                userNumberIs.value = "Hmm 🤔 It seems that you lied somewhere..."
            }
        }
        tryNumber.value = "Try № \(userScore.numberOfTry)"
    }
}
