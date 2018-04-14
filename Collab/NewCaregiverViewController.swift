//
//  NewCaregiverViewController.swift
//  Collab
//
//  Created by Kevin Chung on 4/9/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import UIKit

class NewCaregiverViewController: UIViewController {

    @IBOutlet weak var missingDataLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    var labelList: Array<UILabel>!
    var labelDefaults: Array<String>!
    var textFieldList: Array<UITextField>!
    var dataNames: Array<String>!
    
    func getLabelFromTextField(textField: UITextField) -> UILabel {
        return labelList[textFieldList.index(of: textField)!]
    }
    
    func getDefaultLabelText(label: UILabel) -> String {
        return labelDefaults[labelList.index(of: label)!]
    }
    
    func getKeyFromTextField(textField: UITextField) -> String {
        let numCaregivers = UserDefaults.standard.object(forKey: "NumExtraCaregivers")
        return dataNames[textFieldList.index(of: textField)!] + String(describing: numCaregivers)
    }
    
    @IBAction func addCaregiver(_ sender: Any) {
        var missingData = false
        for textField in textFieldList {
            let label = getLabelFromTextField(textField: textField)
            if textField.text == "" {
                label.textColor = UIColor.init(red: 0.945, green: 0.4, blue: 0.133, alpha: 1.0)
                label.font = UIFont.init(name: "Montserrat-Semibold", size: 22.0)
                label.text = "*" + getDefaultLabelText(label: label)
                missingData = true
            } else {
                label.textColor = UIColor.white
                label.font = UIFont.init(name: "Montserrat-Regular", size: 22.0)
                label.text = getDefaultLabelText(label: label)
            }
        }
        if missingData {
            missingDataLabel.text = "*Please fill out all required fields!"
        } else {
            let numCaregivers = UserDefaults.standard.object(forKey: "NumExtraCaregivers") as! Int
            UserDefaults.standard.set(numCaregivers + 1, forKey: "NumExtraCaregivers")
            for textField in textFieldList {
                UserDefaults.standard.set(textField.text, forKey: getKeyFromTextField(textField: textField))
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        
        self.labelList = [firstNameLabel, lastNameLabel, emailAddressLabel, phoneNumberLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel]
        self.textFieldList = [firstNameTextField, lastNameTextField, emailAddressTextField, phoneNumberTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField]
        self.labelDefaults = ["FIRST NAME", "LAST NAME", "EMAIL ADDRESS",  "PHONE NUMBER", "STREET ADDRESS", "CITY", "STATE", "ZIP CODE"]
        self.dataNames = ["OtherFirstName", "OtherLastName", "OtherEmail", "OtherPhoneNumber", "OtherStreetAddress", "OtherCity", "OtherState", "OtherZipCode"]
        
        for textField in textFieldList {
            textField.delegate = self
        }

        // Do any additional setup after loading the view.
        if UserDefaults.standard.object(forKey: "NumExtraCaregivers") == nil {
            UserDefaults.standard.set(0, forKey: "NumExtraCaregivers")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension NewCaregiverViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

