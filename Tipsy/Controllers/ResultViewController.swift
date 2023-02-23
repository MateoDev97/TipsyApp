//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Mateo Ortiz on 23/02/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var resultByPerson: String?
    var numberOfPeople: String?
    var percentage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = resultByPerson
        
        guard let numberOfPeople = numberOfPeople,
        let percentage = percentage else { return }
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(percentage) tip."
        
    }
    

    @IBAction func recalculateAction(_ sender: UIButton) {
        dismiss(animated: true)
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
