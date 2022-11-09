//
//  ResetPasswordViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 19/07/22.
//

import UIKit
import SJFrameSwift

class ResetPasswordViewController: SJViewController, UITextFieldDelegate {
    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var imageBottom: UIImageView!
    @IBOutlet weak var imagePasswordIcon: UIImageView!
    @IBOutlet weak var imageConfirmPassword: UIImageView!
    @IBOutlet weak var imageOuterConfirmPassword: UIImageView!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var viewPasswordEmpty: UIView!
    @IBOutlet weak var viewConfirmPasswordEmpty: UIView!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var labelConfirmPassword: UILabel!
    var getEmailOrPhone = String()
    var iconClick = true
    var validation = Validation()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPasswordEmpty.isHidden = true
        viewConfirmPasswordEmpty.isHidden = true
        imageOuterConfirmPassword.isHidden = true
        imageConfirmPassword.isHidden = true
        imagePasswordIcon.image = UIImage(named:"show")
        textFieldConfirmPassword.delegate = self
        // Do any additional setup after loading the view.
        textFieldPassword.addTarget(self, action: #selector(ResetPasswordViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldConfirmPassword.addTarget(self, action: #selector(ResetPasswordViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageTop.rotate()
        self.imageBottom.rotate()
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        imageOuterConfirmPassword.isHidden = true
        imageConfirmPassword.isHidden = true
            if textField == textFieldConfirmPassword {
                if textFieldPassword.text == textFieldConfirmPassword.text {
                    imageConfirmPassword.isHidden = false
                    imageOuterConfirmPassword.isHidden = false
                    viewConfirmPasswordEmpty.isHidden = true
                }
            }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return true;
    }
    func setGradientBackground() {
        let colorTop = UIColor(red: 69.0/255.0, green: 6.0/255.0, blue: 42.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 100.0/255.0, green: 1.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if(textField == textFieldConfirmPassword) {
//            if textFieldPassword.text == textFieldConfirmPassword.text {
//                imageOuterConfirmPassword.isHidden = false
//                imageConfirmPassword.image = UIImage(named: "show")
//            }
//        }
//            print("TextField should end editing method called")
//            return true;
//    }
    @IBAction func buttonActionSavePassword(sender: UIButton) {
        viewPasswordEmpty.isHidden = true
        viewConfirmPasswordEmpty.isHidden = true
        
        guard let password = textFieldPassword.text
        else {
            return
        }
        let isValidatePassword = self.validation.validatePassword(password: password)
        if isValidatePassword == false {
            print("Invalid password")
            viewPasswordEmpty.isHidden = false
            self.labelPassword.text = SJLocalisedString["key_StrongPassword"]
        }
        if isValidatePassword == true {
            if textFieldConfirmPassword.text != textFieldPassword.text {
                viewConfirmPasswordEmpty.isHidden = false
                self.labelConfirmPassword.text = SJLocalisedString["key_ConfirmPasswordAlert"]
            }
        }
        if isValidatePassword == true {
            if(textFieldPassword.text == textFieldConfirmPassword.text) {
//                callForgotApi()
                self.performSegue(withIdentifier: "PasswordUpdatedViewController", sender: nil)
            }
        }
        
    }
    @IBAction func iconAction(sender: AnyObject) {
        if(iconClick == true) {
            imagePasswordIcon.image = UIImage(named:"passiconImg")
            textFieldPassword.isSecureTextEntry = false
        } else {
            imagePasswordIcon.image = UIImage(named:"show")
            textFieldPassword.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
}

//extension ResetPasswordViewController {
//    func callForgotApi() {
//        if AppController.shared.checkInternetAvailability() {
//            let nwctrl = APINetworkController();
//            let objRequest = AppBaseRequest(ConstantAPI.WEBSERVICE_RESET_PASSWORD, ConstantAPI.k_REQUEST_TYPE_POST);
//            objRequest.rawParam = ["user_name":"\(getEmailOrPhone)"].toJSON()
//            nwctrl.callWebserviceRequest(objRequest) { objResponse in
//                if objResponse.api_status == true {
//                    DispatchQueue.main.async {
//                        self.performSegue(withIdentifier: "PasswordUpdatedViewController", sender: nil)
//                    }
//                    self.showAlert(message: "Success")
//                }
//                else {
//                    if let errors = objResponse.errors as? [String:Any] {
//                        print(errors)
//                        if let email = errors["email"] as? [String], !email.isEmpty {
//                            print(email[0])
//                        }
//                        if let password = errors["password"] as? [String], !password.isEmpty {
//                            print(password[0])
//                        }
//                    }
//                    else if let message = objResponse.errorMsg as? String {
//                        print(message)
//                        self.showAlert(message: objResponse.errorMsg)
//                    }
//                }
//            }
//        }
////        }
//        else {
//            self.showAlert(message: "Network Error")
//        }
//    }
//}
