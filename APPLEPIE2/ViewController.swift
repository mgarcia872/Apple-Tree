//
//  ViewController.swift
//  APPLEPIE2
//
//  Created by student17 on 2/19/19.
//  Copyright © 2019 student17. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // Creating an array
    
    var listOfWords = ["koi", "urchins","corals", "islands","plankton"]
    
    var totalWins = 0
    {
        didSet
        {
            newRound()
        }
    }
    var totalLosses = 0
    {
        didSet
        {
            newRound()
        }
    }
    
    let incorrectMovesAllowed = 7
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction private func buttonPressed(_ sender: UIButton)
    {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        newRound()
    }
    
    var currentGame: Game!
    
    func newRound()
    {
        if !listOfWords.isEmpty
        {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        enableLetterButtons(true)
        updateUI()
        }
        else
        {
            enableLetterButtons(false)
        }
    }
    
    func updateUI()
    {
        var letters = [String]()
        for letter in currentGame.formattedWord.characters
        {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func updateGameState()
    {
        if currentGame.incorrectMovesRemaining == 0
        {
            totalLosses += 1
        }
        else if currentGame.word == currentGame.formattedWord
        {
            totalWins += 1
        }
        else
        {
            updateUI()
        }
    }
    
    func enableLetterButtons(_ enable: Bool)
    {
        for button in letterButtons
        {
            button.isEnabled = enable
        }
    }
}

