//
//  GotoViewController.swift
//  PersistantSelections
//
//  Created by Sukumar Anup Sukumaran on 18/05/18.
//  Copyright © 2018 Sukumar Anup Sukumaran. All rights reserved.
//

import UIKit

class GotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
