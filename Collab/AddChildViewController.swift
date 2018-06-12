//
//  AddChildViewController.swift
//  Collab
//
//  Created by Fredrik Fatemi on 3/20/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import UIKit

class AddChildViewController: UIViewController {

    
    @IBAction func btnAddChild(_ sender: Any) {
        print("Here")
        if inputFirstName.text == nil || inputLastName.text == nil {
            self.errorLabel.isHidden = false
            return
        } else {
            self.errorLabel.isHidden = true
        }
        let babyDate = inputDate.date
        let c: Child = Child(firstName: inputFirstName.text!, lastName: inputLastName.text!, babyDate: babyDate)
        Child.addChild(child: c)
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    @IBOutlet weak var inputDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.errorLabel!.isHidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
