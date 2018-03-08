//
//  Game.swift
//  LastBalloonStanding
//
//  Created by MACUser on 2018/03/06.
//  Copyright © 2018 MACUser. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectGuessesAllowed: Int
    
    var guessedLetters: [Character]

    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.characters.contains(letter) {
            incorrectGuessesAllowed -= 1
        }
    }
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word.characters {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}
