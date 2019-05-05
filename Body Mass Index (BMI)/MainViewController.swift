//
//  MainViewController.swift
//  Body Mass Index (BMI)
//
//  Created by Jorge Giannotta on 05/05/2019.
//  Copyright © 2019 Jorge Giannotta. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func continueButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToCalculator", sender: self)
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
