//
//  FinishViewController.swift
//  iQuiz
//
//  Created by Juan Acevedo on 11/5/18.
//  Copyright © 2018 acevedoj. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
    
    @IBOutlet weak var correctLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func startOver(_ sender: Any) {
        amountCorrect = 0
        questionIndex = 0
        myIndex = 0
        performSegue(withIdentifier: "goback", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctLabel.text = String(amountCorrect)
        if (amountCorrect < 2) {
            messageLabel.text = "You tried.."
        } else if (amountCorrect == 3) {
            messageLabel.text = "Almost!"
        } else {
            messageLabel.text = "Wow, Good Job!"
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
