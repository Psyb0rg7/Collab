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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainMenu = storyboard.instantiateViewController(withIdentifier: "AddEntry")
        self.present(mainMenu, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
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
