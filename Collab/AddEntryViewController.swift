//
//  AddEntryViewController.swift
//  Collab
//
//  Created by Kevin Chung on 2/26/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import UIKit

class AddEntryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dataEntryViewController = storyboard.instantiateViewController(withIdentifier: "DataEntry")
        self.present(dataEntryViewController, animated: true, completion: nil)
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
