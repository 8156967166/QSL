//
//  UpdateEmailViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 14/07/22.
//

import UIKit
import SJFrameSwift

class UpdateEmailViewController: SJViewController, UITextFieldDelegate {
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var viewInvalidEmail: UIView!
    @IBOutlet weak var labelInvalidEmail: UILabel!
    var validation = Validation()
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return true;
    }
    func setContentView() {
        let colorTop = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        viewContent.layer.insertSublayer(gradientLayer, at: 0)
    }
    func setValidation() {
        guard let email = textFieldEmail.text
        else {
            return
        }
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
            if isValidateEmail == false {
                print("Invalid email")
                viewInvalidEmail.isHidden = false
                self.labelInvalidEmail.text = SJLocalisedString["key_EmailNotEnterAlert"]
        }
    }
    @IBAction func buttonActionClose(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
