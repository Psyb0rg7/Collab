//
//  DataEntryViewController.swift
//  Collab
//
//  Created by Fredrik Fatemi on 2/26/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import UIKit

class DataEntryViewController: UIViewController {
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var input: UITextField!
    
    @IBAction func submitData(_ sender: Any) {
        UserDefaults.standard.set(input.text, forKey: "FavoriteColor")
        input.text = ""
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        input.resignFirstResponder()
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

extension DataEntryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
