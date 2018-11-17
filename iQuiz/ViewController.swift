//
//  ViewController.swift
//  iQuiz
//
//  Created by Juan Acevedo on 10/31/18.
//  Copyright © 2018 acevedoj. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    let textCellIdentifier = "ListCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row][0]
        cell.detailTextLabel?.text = categories[indexPath.row][1]

        let image = UIImage(named: categories[indexPath.row][2])
        cell.imageView?.image = image

        return cell
    }
    
    @IBAction func settingsPress(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Nothing to see here", message: "Check back for settings!", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "quiz", sender: self)
    }
}

struct QuestionStruct {
    var question: String
    var answers: [String]
    var correctAnswer: String
}

// The number for the quiz we selected
var myIndex: Int = 0

// The index for the question we are on
var questionIndex: Int = 0

// Questions the user got right
var amountCorrect: Int = 0

let categories = [["BFF Test", "See if we were meant to be bffs", "bff.png", "bffQuestions"],["Best Dog Quiz", "What dog is the best dog?", "dog.png", "bestDogQuestions"], ["UW Trivia", "Let's see how much you know about UW", "uw.png", "uwTrivia"]]

let bffQuestions = [
    QuestionStruct(question: "What's my favorite color?", answers: ["Dark Red", "Baby Blue", "Black", "Lime Green"], correctAnswer: "Dark Red"),
    QuestionStruct(question: "What's my favorite animal?", answers: ["Zebra", "Cheetah", "Fox", "Penguin"], correctAnswer: "Fox"),
    QuestionStruct(question: "Where do I go to school?", answers: ["WSU", "UW", "Whitman", "Gonzaga"], correctAnswer: "UW"),
    QuestionStruct(question: "Is JJ the best TA?", answers: ["Yes", "No", "Maybe", "Yes he is best TA"], correctAnswer: "Yes he is best TA")
]

let bestDogQuestions = [
    QuestionStruct(question: "What dog  breed is biggest?", answers: ["Great Dane", "Golden Retriever", "German Shepard", "They're all perfect"], correctAnswer: "They're all perfect"),
    QuestionStruct(question: "Which dog breed is your favorite from this list?", answers: ["Pug", "Labrador", "Husky", "All of the above"], correctAnswer: "All of the above"),
    QuestionStruct(question: "Are all dogs perfect?", answers: ["Ew, no", "Dogs are ugly", "YES", "Nope"], correctAnswer: "YES"),
    QuestionStruct(question: "What animal is the cutest animal?", answers: ["Dog", "Cat", "Whales", "Lemurs"], correctAnswer: "Dog")
]

let uwTrivia = [
    QuestionStruct(question: "What does the Darth vader guy usually talk about in front of the By George Statue?", answers: ["Coffee Enemas", "The Devil's Lettuce", "The Purge", "Competitive majors"], correctAnswer: "The Devil's Lettuce"),
    QuestionStruct(question: "Which event has occurred at UW?", answers: ["Man set himself on fire", "Snail eating competition", "Obama rap battle", "Penguin sled races"], correctAnswer: "Man set himself on fire"),
    QuestionStruct(question: "What is the UW mascot", answers: ["Husky man", "Huzky", "Husky", "Huski"], correctAnswer: "Husky"),
    QuestionStruct(question: "What does the UW president like?", answers: ["Leaves", "White pebbles", "Pink and Green Kites", "Jojos Bizarre adventure"], correctAnswer: "Leaves")
]
