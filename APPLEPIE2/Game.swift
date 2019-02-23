//
//  Game.swift
//  APPLEPIE2
//
//  Created by student17 on 2/19/19.
//  Copyright © 2019 student17. All rights reserved.
//

import Foundation

struct Game
{
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character)
    {
        guessedLetters.append(letter)
       
        if !word.characters.contains(letter)
        {
            incorrectMovesRemaining -= 1
        }
    }
    
    var formattedWord: String
    {
        var guessedWord = ""
        for letter in word.characters
        {
            if guessedLetters.contains(letter)
            {
                guessedWord += "\(letter)"
            }
            else
            {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
}
