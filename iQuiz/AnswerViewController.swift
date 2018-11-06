//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Juan Acevedo on 11/5/18.
//  Copyright © 2018 acevedoj. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var answer: String = ""
    var correctAnswer: String = ""
    var Answerindex: Int = 0
    var question: String = ""
    var correct: String = ""

    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var AnswerLabel: UILabel!
    
    @IBOutlet weak var CorrectAnswerLabel: UILabel!
    
    @IBOutlet weak var CorrectLabel: UILabel!
    
    
    @IBOutlet weak var ButtonText: UIButton!
    
    @IBAction func ActionButton(_ sender: Any) {
        if (Answerindex < 3 && Answerindex >= 0) {
            performSegue(withIdentifier: "backToQuiz", sender: self)

        } else if (Answerindex == 3) {
            performSegue(withIdentifier: "finished", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuestionLabel.text = question
        AnswerLabel.text = answer
        CorrectAnswerLabel.text = correctAnswer
        CorrectLabel.text = correct
        print(Answerindex)
        if (Answerindex < 3) {
            ButtonText.setTitle("Next", for: .normal)
        } else if (Answerindex == 3) {
            ButtonText.setTitle("Finish", for: .normal)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
