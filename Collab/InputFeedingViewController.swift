//
//  InputFeedingViewController.swift
//  Collab
//
//  Created by Fredrik Fatemi on 3/20/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import UIKit

class InputFeedingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var children = ["Select...", "TestChild"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return children.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return children[row]
    }
    
    
    @IBOutlet weak var datepicker: UIPickerView!
    @IBAction func btnAddEntry(_ sender: Any) {
        let didSave = self.saveData()
        if didSave {
            self.dismiss(animated: true, completion: nil)
        } else {
            warningLabel!.isHidden = false
        }
    }
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var comments: UITextView!
    @IBOutlet weak var warningLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var childPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childPicker.dataSource = self
        childPicker.delegate = self
        comments!.layer.borderColor = UIColor.black.cgColor
        comments!.layer.borderWidth = 2
        warningLabel!.isHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func saveData() -> Bool { // TODO: Create Entry class
        if self.childPicker.selectedRow(inComponent: 0) != 0 {
            return true
        } else {
            return false
        }
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
