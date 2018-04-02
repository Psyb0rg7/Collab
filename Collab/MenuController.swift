//
//  MenuController.swift
//  Collab
//
//  Created by Fredrik Fatemi on 3/4/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    let data = ["First Name", "Last Name"]
    @IBAction func btnAddEntry(_ sender: Any) {
        if Child.loadChildData().count == 0 {
            errorLabel!.isHidden = false
        } else {
            let storyboard = UIStoryboard(name: "Main",   bundle: nil)
            let mainMenu = storyboard.instantiateViewController(withIdentifier: "AddEntry")
            self.present(mainMenu, animated: true, completion: nil)
        }
        
    }
    @IBAction func btnAddChild(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addchild = storyboard.instantiateViewController(withIdentifier: "AddChild")
        self.present(addchild, animated: true, completion: nil)
    }
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        if Child.loadChildData().count > 0 {
            errorLabel!.isHidden = true
        }
        var dataIn = true
        for d in data {
            if UserDefaults.standard.object(forKey: d) == nil {
                dataIn = false
                break
            }
        }
        if !dataIn {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let dataEntryViewController = storyboard.instantiateViewController(withIdentifier: "DataEntry")
            self.present(dataEntryViewController, animated: true, completion: nil)
        }
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
