//
//  ViewController.swift
//  randomNameGenerator
//
//  Created by Sandra Kocic on 27.03.20.
//  Copyright © 2020 Sandra Kocic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var enterNameLabel: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var list = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterNameLabel.delegate = self
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
        list.append(enterNameLabel.text!)
        print(list)
        textView.text = textView.text! + "\n" + "\(enterNameLabel.text!)"
        enterNameLabel.text = ""
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let winner = list.randomElement()
        winnerLabel.text = winner
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        list.removeAll()
        textView.text = ""
        winnerLabel.text = ""
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        enterNameLabel.resignFirstResponder()
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

