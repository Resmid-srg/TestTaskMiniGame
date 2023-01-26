//
//  File.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 24.01.23.
//

import Foundation

class EnterNumberViewModel {
    
    var userScore = Score(numberOfTry: 0, hiddenNumber: -1)
    
    var validationInputText = Dynamic("")
    var colorValidationText = Dynamic("")
    var buttonAccessibility = Dynamic(false)
    
    func userButtonTapped(number: Int) {
        userScore.hiddenNumber = number
    }
    
    func userDidChangedTextField(text: String) {
        
        //TODO: - Вынести в отдельный валидатор и переработать компактнее
        if text == ""  {
            validationInputText.value = "Enter a number from 1 to 100"
            colorValidationText.value = "textColor"
            buttonAccessibility.value = false
        } else if Int(text) == nil {
            validationInputText.value = "Don't enter any characters"
            colorValidationText.value = "wrongValidationTextColor"
            buttonAccessibility.value = false
        } else if Int(text)! < 1 || Int(text)! > 100 {
            validationInputText.value = "Enter a number less than 101"
            colorValidationText.value = "wrongValidationTextColor"
            buttonAccessibility.value = false
        } else {
            validationInputText.value = "Great! Lest's start?"
            colorValidationText.value = "rightValidationTextColor"
            buttonAccessibility.value = true
        }
    }
}
