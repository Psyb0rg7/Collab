//
//  AddEntryViewController.swift
//  Collab
//
//  Created by Kevin Chung on 2/26/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import UIKit

class AddEntryViewController: UIViewController {
    
    @IBAction func clearData(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "FavoriteColor")
    }
    
    @IBAction func btnFeeding(_ sender: Any) {
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        guard let x = UserDefaults.standard.object(forKey: "FavoriteColor") else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let dataEntryViewController = storyboard.instantiateViewController(withIdentifier: "DataEntry")
            self.present(dataEntryViewController, animated: true, completion: nil)
            return
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
