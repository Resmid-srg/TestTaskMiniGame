//
//  File.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 24.01.23.
//

import Foundation

class ViewModel {
    var statusText = Dynamic("")
    
    func userButtonPressed() {
        statusText.value = "On"
    }
}
