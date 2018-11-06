//
//  QuestionTableViewController.swift
//  iQuiz
//
//  Created by Juan Acevedo on 11/5/18.
//  Copyright © 2018 acevedoj. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController {
    
    var answerSelected: String = ""
    
    @IBOutlet var QuestionTable: UITableView!
    @IBOutlet weak var QuestionLabel: UILabel!

    let textCellIdentifier = "QuestionCell"
    
    var questionsArray: [QuestionStruct]!
    
    var answers : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (myIndex == 0) {
            self.questionsArray = bffQuestions
            self.answers = questionsArray[questionIndex].answers
        } else if (myIndex == 1) {
            self.questionsArray = bestDogQuestions
            self.answers = questionsArray[questionIndex].answers
        } else {
            self.questionsArray = uwTrivia
            self.answers = questionsArray[questionIndex].answers
        }
        QuestionTable.delegate = self
        QuestionTable.dataSource = self
        QuestionLabel.text = questionsArray[questionIndex].question
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = answers[indexPath.row]
        
        return cell
    }
    
    @IBAction func settingsPress(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Nothing to see here", message: "Check back for settings!", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        answerSelected = answers[indexPath.row]
        performSegue(withIdentifier: "answer", sender: self)
        questionIndex = questionIndex + 1
        print(questionIndex)
        
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AnswerViewController
        {
            let vc = segue.destination as? AnswerViewController
            vc?.answer = answerSelected
            vc?.correctAnswer = questionsArray[questionIndex].correctAnswer
            vc?.question = questionsArray[questionIndex].question
            vc?.Answerindex = questionIndex
            if (answerSelected == questionsArray[questionIndex].correctAnswer) {
                vc?.correct = "You were correct!"
                amountCorrect = amountCorrect + 1
            } else {
                vc?.correct = "You were wrong!"
            }
        }
    }
    
    // @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

}
