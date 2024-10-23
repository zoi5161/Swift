//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progessBar: UIProgressView!
    @IBOutlet weak var process: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        if(quizBrain.checkAnswer(userAnswer)){
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }

        quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            self.updateUI()
        }
    }
    
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        aButton.setTitle(quizBrain.getAnswerText().aAnswer, for: .normal)
        bButton.setTitle(quizBrain.getAnswerText().bAnswer, for: .normal)
        cButton.setTitle(quizBrain.getAnswerText().cAnswer, for: .normal)
        
        process.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        aButton.backgroundColor = UIColor.clear
        bButton.backgroundColor = UIColor.clear
        cButton.backgroundColor = UIColor.clear
    }
}

