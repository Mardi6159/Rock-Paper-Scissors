//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by student on 7/17/24.
//

import UIKit

enum Choice: String, CaseIterable {
    case paper = "💵"
    case rock = "🗿"
    case scissors = "✂️"
}

enum Outcome: String {
    case tie = "You tied."
    case win = "You won!"
    case lose = "You lost :("
}


class ViewController: UIViewController {
    
    @IBOutlet weak var robotLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var rockButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var winStreak: UILabel!
    
    @IBAction func onRockClick(_ sender: Any) {
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        playRound(userChoice: .rock)
    }
    
    @IBAction func onPaperClick(_ sender: Any) {
        rockButton.isHidden = true
        scissorsButton.isHidden = true
        playRound(userChoice: .paper)
    }
    
    @IBAction func onScissorsClick(_ sender: Any) {
        rockButton.isHidden = true
        paperButton.isHidden = true
        playRound(userChoice: .scissors)
    }
    
    @IBAction func onPlayAgainClick(_ sender: Any) {
        view.backgroundColor = .lightGray
        robotLabel.text = "🤖"
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        playAgainButton.isHidden = true
        titleLabel.text = "Rock, Paper, Scissors?"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view .
    }
    
    func playRound(userChoice: Choice) {
        if playAgainButton.isHidden {
            
            let computerChoice = getComputerChoice()
            robotLabel.text = computerChoice.rawValue
            
            let outcome = decideOutcome(userChoice: userChoice, computerChoice: computerChoice)
            
            playAgainButton.isHidden = false
            titleLabel.text = outcome.rawValue
            
            switch outcome {
            case .tie:
                view.backgroundColor = .white
            case .win:
                view.backgroundColor = .green
            case .lose:
                view.backgroundColor = .red
            }
        }
        
        func getComputerChoice() -> Choice {
            return Choice.allCases[Int.random(in: 0...Choice.allCases.count - 1)]
        }
        
        func decideOutcome(userChoice: Choice, computerChoice: Choice) -> Outcome {
            switch (userChoice, computerChoice) {
            case (.paper, .paper), (.rock, .rock), (.scissors, .scissors):
                return .tie
            case (.paper, .rock), (.rock, .scissors), (.scissors, .paper):
                return .win
            case (.paper, .scissors), (.rock, .paper), (.scissors, .rock):
                return .lose
            }
        }
    }
}
