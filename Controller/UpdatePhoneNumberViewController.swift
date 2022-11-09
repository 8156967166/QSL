//
//  UpdatePhoneNumberViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 14/07/22.
//

import UIKit

class UpdatePhoneNumberViewController: UIViewController, UITextFieldDelegate {
//    @IBOutlet weak var viewBackgroundContent: UIView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var viewBottomStyle: UIView!
    @IBOutlet weak var textFieldFirstOtp: UITextField!
    @IBOutlet weak var textFieldSecondOtp: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentView()
//        setGradientBottomView()
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
    func setGradientBottomView() {
//        let colorTop = UIColor(red: 69.0/255.0, green: 6.0/255.0, blue: 42.0/255.0, alpha: 1.0).cgColor
//        let colorBottom = UIColor(red: 69.0/255.0, green: 6.0/255.0, blue: 42.0/255.0, alpha: 0.0).cgColor
        let colorTop = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 0.0).cgColor
        let colorBottom = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 0.5).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewBottomStyle.bounds
        viewBottomStyle.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func buttonActionClose(sender: UIButton) {
//        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }

}
