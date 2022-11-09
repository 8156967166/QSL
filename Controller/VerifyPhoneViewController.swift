//
//  EnterOptViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 08/07/22.
//

import UIKit
import SJFrameSwift

class VerifyPhoneViewController: SJViewController, UITextFieldDelegate {
    @IBOutlet weak var labelPleaseEnter: UILabel!
    @IBOutlet weak var textFieldFirstNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldSecondNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldThirdNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldFourthNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldFifthNumberOfOtp: UITextField!
    @IBOutlet weak var imageTopRotated: UIImageView!
    @IBOutlet weak var imageBottomRotated: UIImageView!
    @IBOutlet weak var viewNotEnterOtp: UIView!
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var viewFirstOtp: UIView!
    @IBOutlet weak var viewSecondOtp: UIView!
    @IBOutlet weak var viewThirdOtp: UIView!
    @IBOutlet weak var viewFourthOtp: UIView!
    @IBOutlet weak var viewFifthOtp: UIView!
    @IBOutlet weak var buttonTimer: UIButton!
//    @IBOutlet weak var labelNotEnterOtp: UILabel!
//    @IBOutlet weak var labelGetPhoneNumber: UILabel?
    var getPhoneNumber = String()
    var getEmail = String()
    var color = #colorLiteral(red: 1, green: 0.7195457816, blue: 0, alpha: 1)
    var timer = Timer()
    var counter = 60
    override func viewDidLoad() {
        super.viewDidLoad()
        viewNotEnterOtp.isHidden = true
        
        setTimer()
        addDoneButtonOnKeyboard()
        buttonTimer.isEnabled = false
        textFieldFirstNumberOfOtp.delegate = self
        textFieldSecondNumberOfOtp.delegate = self
        textFieldThirdNumberOfOtp.delegate = self
        textFieldFourthNumberOfOtp.delegate = self
        textFieldFifthNumberOfOtp.delegate = self
//        labelPleaseEnter.text = "Please Enter The Code Sent To The Number \(getPhoneNumber) "
        let mainString = "Please Enter The Code Sent To The Number \(getPhoneNumber) "
        let stringToColor = "\(getPhoneNumber)"
        let range = (mainString as NSString).range(of: stringToColor)

        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        labelPleaseEnter.attributedText = mutableAttributedString
        textFieldFirstNumberOfOtp.addTarget(self, action: #selector(VerifyPhoneViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldSecondNumberOfOtp.addTarget(self, action: #selector(VerifyPhoneViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldThirdNumberOfOtp.addTarget(self, action: #selector(VerifyPhoneViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldFourthNumberOfOtp.addTarget(self, action: #selector(VerifyPhoneViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldFifthNumberOfOtp.addTarget(self, action: #selector(VerifyPhoneViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageTopRotated.rotate()
        self.imageBottomRotated.rotate()
    }
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 10))
            doneToolbar.barStyle = .default
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
            textFieldFirstNumberOfOtp.inputAccessoryView = doneToolbar
            textFieldSecondNumberOfOtp.inputAccessoryView = doneToolbar
            textFieldThirdNumberOfOtp.inputAccessoryView = doneToolbar
            textFieldFourthNumberOfOtp.inputAccessoryView = doneToolbar
            textFieldFifthNumberOfOtp.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        textFieldFirstNumberOfOtp.resignFirstResponder()
        textFieldSecondNumberOfOtp.resignFirstResponder()
        textFieldThirdNumberOfOtp.resignFirstResponder()
        textFieldFourthNumberOfOtp.resignFirstResponder()
        textFieldFifthNumberOfOtp.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return true;
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == textFieldFirstNumberOfOtp {
            setBorderColor()
            viewFirstOtp.layer.borderColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
        }
        if textField == textFieldSecondNumberOfOtp {
            setBorderColor()
            viewSecondOtp.layer.borderColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
        }
        if textField == textFieldThirdNumberOfOtp {
            setBorderColor()
            viewThirdOtp.layer.borderColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
        }
        if textField == textFieldFourthNumberOfOtp {
            setBorderColor()
            viewFourthOtp.layer.borderColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
        }
        if textField == textFieldFifthNumberOfOtp {
            setBorderColor()
            viewFifthOtp.layer.borderColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)

        }
    }
    func setBorderColor() {
        viewFirstOtp.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewSecondOtp.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewThirdOtp.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewFourthOtp.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewFifthOtp.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    func setTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    @objc func timerAction() {
        if counter > 0 {
            let minutes = counter / 60
            let seconds = counter % 60
            counter = counter - 1
            labelTimer.text = "\(minutes):\(seconds)"
        }
        if counter == 0 {
            buttonTimer.isEnabled = true
            labelTimer.text = "Resend"
        }
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
            if textField == textFieldFirstNumberOfOtp {
                if (textField.text?.count)! >= 1 {
                    textFieldSecondNumberOfOtp.becomeFirstResponder()
                }
            }
            else if textField == textFieldSecondNumberOfOtp {
                if (textField.text?.count)! >= 1 {
                    textFieldThirdNumberOfOtp.becomeFirstResponder()
                }
            }
            else if textField == textFieldThirdNumberOfOtp {
                if (textField.text?.count)! >= 1 {
                    textFieldFourthNumberOfOtp.becomeFirstResponder()
                }
            }
            else if textField == textFieldFourthNumberOfOtp {
                if (textField.text?.count)! >= 1 {
                    textFieldFifthNumberOfOtp.becomeFirstResponder()
                }
            }
            else if textField == textFieldFifthNumberOfOtp {
                if (textField.text?.count)! >= 1 {
                    textFieldFifthNumberOfOtp.resignFirstResponder()
                }
            }
//        if (textFieldFirstNumberOfOtp.text != "" && textFieldSecondNumberOfOtp.text != "" && textFieldThirdNumberOfOtp.text != "" && textFieldFourthNumberOfOtp.text != "" && textFieldFifthNumberOfOtp.text != "") {
//            self.performSegue(withIdentifier: "AccountVerifiedViewController", sender: nil)
//        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
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
    @IBAction func buttonActionVerifyEmail(sender: UIButton) {
        self.performSegue(withIdentifier: "VerifyEmailViewController", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? VerifyEmailViewController {
            vc.getEmail = getEmail
        }
    }
    @IBAction func buttonActionResendOtp(sender: UIButton) {
        print("Resend Button Clicked")
    }
    @IBAction func buttonActionChangeNumber(sneder: UIButton) {
        self.performSegue(withIdentifier: "UpdatePhoneNumberViewController", sender: nil)
    }
    @IBAction func buttonActionSubmit(sender: UIButton) {
        viewNotEnterOtp.isHidden = true
//        labelNotEnterOtp.text = ""
        if (textFieldFirstNumberOfOtp.text == "" && textFieldSecondNumberOfOtp.text == "" && textFieldThirdNumberOfOtp.text == "" && textFieldFourthNumberOfOtp.text == "" && textFieldFifthNumberOfOtp.text == "") {
            viewNotEnterOtp.isHidden = false
//            self.labelNotEnterOtp.text = SJLocalisedString[""]
        }
        if (textFieldFirstNumberOfOtp.text != "" && textFieldSecondNumberOfOtp.text != "" && textFieldThirdNumberOfOtp.text != "" && textFieldFourthNumberOfOtp.text != "" && textFieldFifthNumberOfOtp.text != "") {
            callPhoneNumberOtpApi()
//            self.performSegue(withIdentifier: "AccountVerifiedViewController", sender: nil)
        }
    }
    
    @IBAction func buttonActionCloseArrow(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
extension VerifyPhoneViewController {
    func callPhoneNumberOtpApi() {
        if AppController.shared.checkInternetAvailability() {
            let nwctrl = APINetworkController();
            let objRequest = AppBaseRequest(ConstantAPI.WEBSERVICE_VERIFY_OTP, ConstantAPI.k_REQUEST_TYPE_POST);
            objRequest.rawParam = ["user_name":"\(getPhoneNumber)", "otp": "\(textFieldFirstNumberOfOtp.text ?? "")\(textFieldSecondNumberOfOtp.text ?? "")\(textFieldThirdNumberOfOtp.text ?? "")\(textFieldFourthNumberOfOtp.text ?? "")\(textFieldFifthNumberOfOtp.text ?? "")", "purpose_of_request": "activate_user" ].toJSON()
            self.showLoader()
            nwctrl.callWebserviceRequest(objRequest) { objResponse in
                if objResponse.api_status == true {
                    self.hideLoader()
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "AccountVerifiedViewController", sender: nil)
                    }
//                    self.showAlert(message: "Success")
                }
                else {
                    self.hideLoader()
                    if let errors = objResponse.errors as? [String:Any] {
                        print(errors)
                        if let email = errors["email"] as? [String], !email.isEmpty {
                            print(email[0])
                        }
                        if let password = errors["password"] as? [String], !password.isEmpty {
                            print(password[0])
                        }
                    }
                    else if let message = objResponse.errorMsg as? String {
                        print(message)
                        self.showAlert(message: objResponse.errorMsg)
                    }
//                    self.showAlert(message: "Error")
                }
            }
        }
        else {
            self.showAlert(message: "Network Error")
        }
    }
}
    
