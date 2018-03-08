//
//  ViewController.swift
//  LastBalloonStanding
//
//  Created by MACUser on 2018/03/06.
//  Copyright © 2018 MACUser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var wordList = ["light","fun","colourful","clowns","party"]
    var incorrectGuessesRemaining = 3
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    @IBOutlet weak var balloonImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButons: [UIButton]!

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButons {
            button.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
 
    var currentGame: Game!
    
    func newRound() {
        if !wordList.isEmpty {
            let correctWord = wordList.removeFirst()
            
            currentGame = Game(word: correctWord, incorrectGuessesAllowed: incorrectGuessesRemaining, guessedLetters: [])

            enableLetterButtons(true)
            updateUI()
        }   else  {
            enableLetterButtons(false)
           
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord.characters {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins)  Losses: \(totalLosses)"
        balloonImageView.image = UIImage(named: "Balloon \(currentGame.incorrectGuessesAllowed)")
       
    }
    
    func updateGameState() {
        if currentGame.incorrectGuessesAllowed == 0 {
            totalLosses -= 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

