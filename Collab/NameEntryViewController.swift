//
//  NameEntryViewController.swift
//  Collab
//
//  Created by Fredrik Fatemi on 2/26/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import UIKit

class NameEntryViewController: UIViewController {
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
        return dataNames[textFieldList.index(of: textField)!]
    }
    
    @IBAction func submitData(_ sender: Any) {
        print("Hello")
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
            for textField in textFieldList {
                UserDefaults.standard.set(textField.text, forKey: getKeyFromTextField(textField: textField))
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func addCaregiver(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        
        self.labelList = [firstNameLabel, lastNameLabel, emailAddressLabel, phoneNumberLabel, streetAddressLabel, cityLabel, stateLabel, zipCodeLabel]
        self.textFieldList = [firstNameTextField, lastNameTextField, emailAddressTextField, phoneNumberTextField, streetAddressTextField, cityTextField, stateTextField, zipCodeTextField]
        self.labelDefaults = ["FIRST NAME", "LAST NAME", "EMAIL ADDRESS",  "PHONE NUMBER", "STREET ADDRESS", "CITY", "STATE", "ZIP CODE"]
        self.dataNames = ["PrimaryFirstName", "PrimaryLastName", "PrimaryEmail", "PrimaryPhoneNumber", "PrimaryStreetAddress", "PrimaryCity", "PrimaryState", "PrimaryZipCode"]
        
        for textField in textFieldList {
            textField.delegate = self
        }
    
        // Do any additional setup after loading the view.
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

extension NameEntryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
