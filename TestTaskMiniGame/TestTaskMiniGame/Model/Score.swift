//
//  Score.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 26.01.23.
//

import Foundation


struct Score {
    var numberOfTry: Int
    var hiddenNumber: Int
}

extension Score {
    static var userScore = Score(numberOfTry: 0, hiddenNumber: 0)
    static var computerScore = Score(numberOfTry: 0, hiddenNumber: 0)
}
