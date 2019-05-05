//
//  ViewController.swift
//  Body Mass Index (BMI)
//
//  Created by Jorge Giannotta on 07/02/2019.
//  Copyright © 2019 Jorge Giannotta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true) //per fare sparire la tastiera
        
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        self.weightTextField.text = ""
        self.heightTextField.text = ""
        self.ageTextField.text = ""
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        guard let height = Double(self.heightTextField.text!) else {return}
        guard let weight = Double(self.weightTextField.text!) else {return}
        let result = calculateBMI(weight: weight,height: height)
        
        let alert = UIAlertController(title: "Result", message: "\(result)", preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Cancel", style: .destructive) { (UIAlertAction) in
            self.weightTextField.text = ""
            self.heightTextField.text = ""
            self.ageTextField.text = ""
        }

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        alert.view.layer.cornerRadius = 10.0
        alert.addAction(cancelAlert)
        self.present(alert, animated: true)
        
        
    }
    
    
    func calculateBMI (weight: Double, height: Double) -> String {

        let bodyMassIndex = weight / pow((height/100), 2)

        let shortBMI = String(format: "%.2f", bodyMassIndex)

        var interpretationBMI : String = ""

        if bodyMassIndex > 30{

            interpretationBMI = "you are obese. EAT LESS"
        }else if bodyMassIndex > 25 && bodyMassIndex < 30{

            interpretationBMI = "you are overweight. EAT LESS"
        }else if bodyMassIndex > 18.5 && bodyMassIndex < 25{

            interpretationBMI = "you are normal weight. GOOD JOB"
        }else if bodyMassIndex < 18.5{

            interpretationBMI = "you are underweight. EAT MORE"
        }

        return "Your BMI is \((shortBMI)) and \((interpretationBMI))"
    }
    
}

