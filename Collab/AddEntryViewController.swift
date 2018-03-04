//
//  AddEntryViewController.swift
//  Collab
//
//  Created by Kevin Chung on 2/26/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import UIKit

class AddEntryViewController: UIViewController {
    
    let data = ["First Name", "Last Name"]
    @IBAction func btnClearData(_ sender: Any) {
        for d in data {
            UserDefaults.standard.removeObject(forKey: d)
        }
    }
    
    @IBAction func btnFeeding(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let feedingViewController = storyboard.instantiateViewController(withIdentifier: "Feeding")
        self.present(feedingViewController, animated: true, completion: nil)
    }
    @IBAction func btnDiaper(_ sender: Any) {
        
    }
    @IBAction func btnSleeping(_ sender: Any) {
        
    }
    @IBAction func btnPumping(_ sender: Any) {
        
    }
    @IBAction func Other(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
