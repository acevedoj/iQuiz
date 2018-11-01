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
    
    let categories = [["BFF Test", "See if we were meant to be bffs", "bff.png"],["Best Dog Quiz", "What dog is the best dog?", "dog.png"], ["UW Trivia", "Let's see how much you know about UW", "uw.png"]]
    
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
}

