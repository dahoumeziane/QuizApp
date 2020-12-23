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
    
    let questions = [ ["One plus five equals to six","True"]
                      ,["Five plus Two equals to six","False"],
                       ["One is greater than zero","True"]]
    var questionNb = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = questions[questionNb][1]
        
        if userAnswer == actualAnswer {
            print("Right")
        }else {
            print("Wrong")
        }
        updateUi()
        if (questionNb < questions.count-1){
            questionNb += 1
        }else {
            questionNb = 0
        }
        
        
    }
    
    func updateUi(){
        
        questionText.text = questions[questionNb][0]
        
    }
}

