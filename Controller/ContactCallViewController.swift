//
//  ContactCallViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 23/08/22.
//

import UIKit

class ContactCallViewController: UIViewController {
    @IBOutlet weak var buttonCancel:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonActionCancel(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
