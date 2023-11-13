//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Gideon Boateng on 11/13/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var FirstNameText: UITextField!
    @IBOutlet weak var LastNameText: UITextField!
    @IBOutlet weak var schoolTextfield: UITextField!
    
    @IBOutlet weak var morePetsLabel: UILabel!
    
    @IBOutlet weak var morePetSwitch: UISwitch!
    @IBOutlet weak var morePetStepper: UIStepper!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        morePetsLabel.text = "\(Int(sender.value))"
    }
    @IBAction func Introduceself(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        // Define fonts for different parts of the introduction
        let nameFont = UIFont(name: "HelveticaNeue-Bold", size: 16)
        let otherFont = UIFont(name: "HelveticaNeue", size: 16)
        
        // Create attributed strings with the specified fonts
        let nameAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: nameFont!]
        let _: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: otherFont!]
        
        // Create attributed strings for different parts of the introduction
        let nameString = NSAttributedString(string: "My name is \(FirstNameText.text!) \(LastNameText.text!) and I attend ", attributes: nameAttributes)
        let schoolString = NSAttributedString(string: "\(schoolTextfield.text!). I am currently in my ", attributes: nameAttributes)
        let yearString = NSAttributedString(string: "\(year!) year and I own ", attributes: nameAttributes)
        let petsString = NSAttributedString(string: "\(morePetsLabel.text!) dogs. It is \(morePetSwitch.isOn) that I want more pets.", attributes: nameAttributes)
        
        // Combine the attributed strings
        let introductionAttributedString = NSMutableAttributedString()
        introductionAttributedString.append(nameString)
        introductionAttributedString.append(schoolString)
        introductionAttributedString.append(yearString)
        introductionAttributedString.append(petsString)
        
        // Create the alert with the attributed message
        let alertController = UIAlertController(title: "My Introduction", message: nil, preferredStyle: .alert)
        alertController.setValue(introductionAttributedString, forKey: "attributedMessage") // Set the attributed message
        
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
        
        print("Name Font: \(String(describing: nameFont))")
        print("Other Font: \(String(describing: otherFont))")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

