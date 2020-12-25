//
//  ViewController.swift
//  QuizApp
//
//  Created by Dahou Meziane on 12/23/20.
//  Copyright © 2020 Meziane Dahou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var userScore: UILabel!
    
    var quizBrain = QuizBrain()

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let answerRight = quizBrain.checkAnswer(userAnswer)
        
        if answerRight {
            sender.backgroundColor = UIColor.green
            // Increment score
            quizBrain.updateScore()
            
        }else {
            sender.backgroundColor = UIColor.red
            
        }
        
        
        if (quizBrain.questionNb < quizBrain.questions.count-1){
            quizBrain.nextQuestion()
            
        }else {
            quizBrain.resetQuiz()
            
            
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUi(){
        
        questionText.text = quizBrain.currentQuestion()
        trueBtn.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.progress()
        userScore.text = "Score : "+String(quizBrain.score)
        
        
    }
}

