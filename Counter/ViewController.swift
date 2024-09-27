//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Соколов on 26.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logField: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    var count = 0
    var logs: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "\(count)"
        logField.isEditable = false
        logField.isSelectable = false
        // Do any additional setup after loading the view.
    }
    
    func makeLog(message: String) -> String {
        let format = DateFormatter()
        let date = Date()
        format.dateFormat = "dd-MM-yyy HH:mm"
        let timeStamp = format.string(from: date)
        return "\(timeStamp): \(message) \n"
    }

    @IBAction func resetBtn(_ sender: Any) {
        count = 0
        counterLabel.text = "\(count)"
        logField.text = makeLog(message: "значение сброшено") + logField.text
    }
    @IBAction func minusBtn(_ sender: Any) {
        if count <= 0 {
            logField.text = makeLog(message: "попытка уменьшить значение счётчика ниже 0") + logField.text
        } else {
            count -= 1
            counterLabel.text = "Значение счётчика: \(count)"
            logField.text = makeLog(message: "значение изменено на -1") + logField.text
        }
    }
    @IBAction func plusBtn(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счётчика: \(count)"
        logField.text = makeLog(message: "значение изменено на +1") + logField.text
    }
    
}

