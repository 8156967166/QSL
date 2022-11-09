//
//  QslRegisterationViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 04/07/22.
//

import UIKit
import SJFrameSwift

class QslRegistrationViewController: SJViewController, UITextFieldDelegate {
    @IBOutlet weak var imageTopRotate: UIImageView!
    @IBOutlet weak var imageBottomRotate: UIImageView!
    @IBOutlet weak var buttonTerms: UIButton!
//    @IBOutlet weak var buttonDontHaveAccount: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var textFieldFullName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var labelCode: UILabel!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewSelectedBox: UIImageView!
    @IBOutlet weak var buttonSelectedBox: UIButton!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var imagePassword: UIImageView!
    @IBOutlet weak var labelFullName: UILabel!
    @IBOutlet weak var labelPhoneNumber: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var labelConfirmPassword: UILabel!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewFullName: UIView!
    @IBOutlet weak var viewCountry: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewConfirmPassword: UIView!
    @IBOutlet weak var viewPhone: UIView!
    var iconClick = true
    var validation = Validation()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewFullName.isHidden = true
        viewEmail.isHidden = true
        viewPassword.isHidden = true
        viewConfirmPassword.isHidden = true
        viewPhone.isHidden = true
        addDoneButtonOnKeyboard()
        notificationKeyboard()
        setButtonsStyle(tempButtons: buttonTerms)
        buttonSignUp.layer.cornerRadius = 13
        buttonSignUp.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//        imageViewSelectedBox.isHidden = true
        imagePassword.image = UIImage(named:"show")
        // Do any additional setup after loading the view.
//        buttonSelectedBox.setImage(UIImage(named: ""), for: .normal)
//        buttonSelectedBox.setImage(UIImage(named: "check"), for: .selected)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageTopRotate.rotate()
        self.imageBottomRotate.rotate()
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
    func setButtonsStyle(tempButtons: UIButton) {
        tempButtons.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    @IBAction func buttonActionpasswordIcon(sender: AnyObject) {
        print("password utton clicked")
        if(iconClick == true) {
            imagePassword.image = UIImage(named:"passiconImg")
            textFieldPassword.isSecureTextEntry = false
        } else {
            imagePassword.image = UIImage(named:"show")
           textFieldPassword.isSecureTextEntry = true
        }

        iconClick = !iconClick
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == self.textFieldPassword) { self.textFieldPassword.isSecureTextEntry = true }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return true;
    }
    func notificationKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
           var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
           keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height + 20
            scrollView.contentInset = contentInset
    }
    @objc func keyboardWillHide(notifiaction: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
            textFieldPhone.inputAccessoryView = doneToolbar
            
    }
    @objc func doneButtonAction(){
        textFieldPhone.resignFirstResponder()
    }
    
    @IBAction func buttonActionSelectedBox(sender: UIButton) {
        if buttonSelectedBox == sender {
            if buttonSelectedBox.isSelected {
                buttonSelectedBox.isSelected = false
                print("Unselected Box")
                imageViewSelectedBox.image = UIImage(named: "")
            }
            else {
                buttonSelectedBox.isSelected = true
                print("Selected Box")
                imageViewSelectedBox.image = UIImage(named: "check")
            }
        }
    }
    @IBAction func buttonActionSelectCode(sender: UIButton) {
        
        let alertController = UIAlertController(title: "", message: "Choose Your Country Code", preferredStyle: .actionSheet)
       
        let firstButtonCode = UIAlertAction(title: "93", style: .default) { (ACTION) in
            self.labelCode.textColor = UIColor.white
            self.labelCode.text = "+93"
        }
        let secondButtonCode = UIAlertAction(title: "61", style: .default) { (ACTION) in
            self.labelCode.textColor = UIColor.white
            self.labelCode.text = "+61"
        }
        let thirdButtonCode = UIAlertAction(title: "91", style: .default) { (ACTION) in
            self.labelCode.textColor = UIColor.white
            self.labelCode.text = "+91"
        }
        let fourthButtonCode = UIAlertAction(title: "977", style: .default) { (ACTION) in
            self.labelCode.textColor = UIColor.white
            self.labelCode.text = "+977"
        }
        let fifthButtonCode = UIAlertAction(title: "7", style: .default) { (ACTION) in
            self.labelCode.textColor = UIColor.white
            self.labelCode.text = "+7"
        }
        let sixthBuutonCode = UIAlertAction(title: "94", style: .default) { (ACTION) in
            self.labelCode.textColor = UIColor.white
            self.labelCode.text = "+94"
        }
        let seventhButtonCode = UIAlertAction(title: "263", style: .default) { (ACTION) in
            self.labelCode.textColor = UIColor.white
            self.labelCode.text = "+263"
        }
        let eigthButtonCode = UIAlertAction(title: "968", style: .default) { (ACTION) in
            self.labelCode.textColor = UIColor.white
            self.labelCode.text = "+968"
        }
        let nightButtonCode = UIAlertAction(title: "98", style: .default) { (ACTION) in
            self.labelCode.textColor = UIColor.white
            self.labelCode.text = "+98"
        }
        let tenthButtonCode = UIAlertAction(title: "81", style: .default) { (ACTION) in
            self.labelCode.textColor = UIColor.white
            self.labelCode.text = "+81"
        }
        alertController.addAction(firstButtonCode)
        alertController.addAction(secondButtonCode)
        alertController.addAction(thirdButtonCode)
        alertController.addAction(fourthButtonCode)
        alertController.addAction(fifthButtonCode)
        alertController.addAction(sixthBuutonCode)
        alertController.addAction(seventhButtonCode)
        alertController.addAction(eigthButtonCode)
        alertController.addAction(nightButtonCode)
        alertController.addAction(tenthButtonCode)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func buttonActionGender(sender: UIButton) {
        let alertActionController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let female = UIAlertAction(title: "Female", style: .default) { (ACTION) in
            self.labelGender.textColor = UIColor.white
            self.labelGender.text = "Female"
        }
        let male = UIAlertAction(title: "Male", style: .default) { (ACTION) in
            self.labelGender.textColor = UIColor.white
            self.labelGender.text = "Male"
        }
        alertActionController.addAction(female)
        alertActionController.addAction(male)
        alertActionController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        present(alertActionController, animated: true, completion: nil)
    }
    
    @IBAction func actionSheetFunction(sender: Any) {
        let actionSheetController = UIAlertController(title: "", message: "Choose Your Country", preferredStyle: .actionSheet)
        let firstButton = UIAlertAction(title: "Afghanistan", style: .default) { (ACTION) in
            self.labelCountry.textColor = UIColor.white
            self.labelCountry.text = "Afghanistan"
        }
        let secondButton = UIAlertAction(title: "Australia", style: .default) { (ACTION) in
            self.labelCountry.textColor = UIColor.white
            self.labelCountry.text = "Australia"
        }
        let thirdButton = UIAlertAction(title: "India", style: .default) { (ACTION) in
            self.labelCountry.textColor = UIColor.white
            self.labelCountry.text = "India"
        }
        let FourthButton = UIAlertAction(title: "Nepal", style: .default) { (ACTION) in
            self.labelCountry.textColor = UIColor.white
            self.labelCountry.text = "Nepal"
        }
        let FifthButton = UIAlertAction(title: "Russia", style: .default) { (ACTION) in
            self.labelCountry.textColor = UIColor.white
            self.labelCountry.text = "Russia"
        }
        let sixthButton = UIAlertAction(title: "Sri Lanka", style: .default) { (ACTION) in
            self.labelCountry.textColor = UIColor.white
            self.labelCountry.text = "Sri Lanka"
        }
        actionSheetController.addAction(firstButton)
        actionSheetController.addAction(secondButton)
        actionSheetController.addAction(thirdButton)
        actionSheetController.addAction(FourthButton)
        actionSheetController.addAction(FifthButton)
        actionSheetController.addAction(sixthButton)
        actionSheetController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        present(actionSheetController, animated: true, completion: nil)
    }

    @IBAction func buttonActionTermsAndCondition(sender: AnyObject) {
        self.performSegue(withIdentifier: "TermsAndConditionsViewController", sender: self)
        print("Button Clicked")
    }
    @IBAction func buttonActionSignIn(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
//        navigationController?.popToRootViewController(animated: true)
        navigationController?.popViewController(animated: true)
        print("SignIN clicked")
    }
    func setVaalidate() {
        guard let name = textFieldFullName.text, let email = textFieldEmail.text, let phone = textFieldPhone.text, let password = textFieldPassword.text, let code = labelCode.text
        else {
            return
        }
        let isValidateName = self.validation.validateName(name: name)
        if(isValidateName == false) {
           print("Invalid Name")
            viewFullName.isHidden = false
            self.labelFullName.text = SJLocalisedString["key_FullNameNotEnterAlert"]
        }
        if (textFieldPhone.text == "" || labelCode.text == "") {
            let isValidateCode = self.validation.validateCountryCode(code: code)
            let isValidatePhone = self.validation.validatePhoneNumber(phoneNumber: phone)
            if (isValidateCode == false || isValidatePhone == false) {
                viewPhone.isHidden = false
                self.labelPhoneNumber.text = SJLocalisedString["key_PhoneNumberAlert"]
            }
        }
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
            if isValidateEmail == false {
                print("Invalid email")
                viewEmail.isHidden = false
                self.labelEmail.text = SJLocalisedString["key_EmailNotEnterAlert"]
        }
        let isValidatePassword = self.validation.validatePassword(password: password)
        if isValidatePassword == false {
            print("Invalid password")
            viewPassword.isHidden = false
            self.labelPassword.text = SJLocalisedString["key_PasswordNotEnterAlert"]
        }
        if isValidatePassword == true {
            if textFieldConfirmPassword.text != textFieldPassword.text {
                viewConfirmPassword.isHidden = false
                self.labelConfirmPassword.text = SJLocalisedString["key_ConfirmPasswordAlert"]
            }
        }
    }
    @IBAction func buttonActionSignUp(sender: UIButton) {
        print("SignUp Button Clicked")
        viewFullName.isHidden = true
        viewEmail.isHidden = true
        viewPassword.isHidden = true
        viewConfirmPassword.isHidden = true
        viewPhone.isHidden = true
        labelFullName.text = ""
        labelEmail.text = ""
        labelPassword.text = ""
        labelConfirmPassword.text = ""
        labelPhoneNumber.text = ""
//        setVaalidate()
        guard let name = textFieldFullName.text, let email = textFieldEmail.text, let phone = textFieldPhone.text, let password = textFieldPassword.text, let code = labelCode.text
        else {
            return
        }
        let isValidateName = self.validation.validateName(name: name)
        if(isValidateName == false) {
           print("Invalid Name")
            viewFullName.isHidden = false
            self.labelFullName.text = SJLocalisedString["key_FullNameNotEnterAlert"]
        }
//        let isValidateCode = self.validation.validateCountryCode(code: code)
//        if isValidateCode == false {
//            viewPhone.isHidden = false
//            self.labelPhoneNumber.text = SJLocalisedString["key_PhoneNumberAlert"]
//        }
        let isValidatePhone = self.validation.validatePhoneNumber(phoneNumber: phone)
        if (isValidatePhone == false) {
                viewPhone.isHidden = false
                self.labelPhoneNumber.text = SJLocalisedString["key_PhoneNumberAlert"]
        }
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
            if isValidateEmail == false {
                print("Invalid email")
                viewEmail.isHidden = false
                self.labelEmail.text = SJLocalisedString["key_EmailNotEnterAlert"]
        }
//        if textFieldPassword.text == "" {
//            viewPassword.isHidden = false
//            self.labelPassword.text = SJLocalisedString["key_PasswordNotEnterAlert"]
//        }
//        else {
            let isValidatePassword = self.validation.validatePassword(password: password)
            if isValidatePassword == false {
                print("Invalid password")
                viewPassword.isHidden = false
    //            self.labelPassword.text = SJLocalisedString["key_PasswordNotEnterAlert"]
                self.labelPassword.text = SJLocalisedString["key_StrongPassword"]
            }
            if isValidatePassword == true {
                if textFieldConfirmPassword.text != textFieldPassword.text {
                    viewConfirmPassword.isHidden = false
                    self.labelConfirmPassword.text = SJLocalisedString["key_ConfirmPasswordAlert"]
                }
            }
//        }
        
        
//        if(textFieldFullName.text == "" || textFieldCode.text == "" || textFieldPhone.text == "" || textFieldEmail.text == "" || textFieldGender.text == "" || textFieldPassword.text == "" || textFieldConfirmPassword.text == "") {
//            let alertController = UIAlertController(title: "Error", message: "Please Enter All text Fields", preferredStyle: .alert)
//                   let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                   alertController.addAction(defaultAction)
//                   self.present(alertController, animated: true, completion: nil)
//        }
//            if textFieldPassword.text != textFieldConfirmPassword.text {
//                let alertController = UIAlertController(title: "Error", message: "Password don't match", preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
//                alertController.addAction(defaultAction)
//                self.present(alertController, animated: true, completion: nil)
//            }
       
        if(textFieldFullName.text != "" && textFieldEmail.text != "" && textFieldPassword.text != "" && textFieldConfirmPassword.text != "" && textFieldPhone.text != "" && labelCode.text != "") {
            if buttonSelectedBox.isSelected == false {
                showAlert(message: "Please accept the terms and conditions")
            }
        }
        if (isValidateName == true && isValidatePhone == true && isValidatePassword == true && isValidateEmail == true) {
            if textFieldPassword.text == textFieldConfirmPassword.text {
                print("Password Match")
                if  buttonSelectedBox.isSelected == true {
                    print("Agree to accept the terms and conditions")
                    callRegisterApi()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? VerifyPhoneViewController {
            
            vc.getPhoneNumber = textFieldPhone.text ?? ""
            vc.getEmail = textFieldEmail.text ?? ""
        }
    }
    
    @IBAction func toggleLanguageAction(){
        AppController.shared.toggleAppGUILanguage()
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let wrapperVC = storyboard.instantiateViewController(withIdentifier: "QslRegistrationViewController") as! QslRegistrationViewController
            self.navigationController?.pushViewController(wrapperVC, animated: false)
            self.removeDuplicateInstanceOfSelf()
        }
    }
}

extension QslRegistrationViewController {
    func callRegisterApi() {
        if AppController.shared.checkInternetAvailability() {
            let nwctrl = APINetworkController();
            let objRequest = AppBaseRequest(ConstantAPI.WEBSERVICE_USER_REGISTRATION, ConstantAPI.k_REQUEST_TYPE_POST);
///            objRequest.rawParam = "{\"user_name\":\"kannan@applab.qa\",\"password\":\"12345678\"}"
//
            objRequest.rawParam = ["full_name":"\(textFieldFullName.text ?? "")",
                                   "email":"\(textFieldEmail.text ?? "")", "password":"\(textFieldPassword.text ?? "")", "confirm_password":"\(textFieldConfirmPassword.text ?? "")", "mobile": "\(textFieldPhone.text ?? "")" ].toJSON()
//            objRequest.rawParam = ["user_name":"",
//                                   "password":""].toJSON()
            self.showLoader()
            nwctrl.callWebserviceRequest(objRequest) { objResponse in
                if objResponse.api_status == true {
                    self.hideLoader()
//                    self.showAlert(message: "Success")
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "VerifyPhoneViewController", sender: nil)
                    }
                }
                else {
                    self.hideLoader()
//                    if let response = objResponse.resultData as? [String: Any] {
//                        print(response)
//                        print("response ......")
//                        if let errors = response["errors"] as? [String:Any] {
//                        print(errors)
                    if let errors = objResponse.errors as? [String:Any] {
                        print(errors)
                        if let email = errors["email"] as? [String], !email.isEmpty {
                            print(email[0])
                            DispatchQueue.main.async {
                                if (self.textFieldFullName.text ?? "").isEmpty {
                                    self.viewFullName.isHidden = false
                                    self.labelFullName.text = "\(email[0])"
                                }
                            }
                        }
                        if let password = errors["password"] as? [String], !password.isEmpty {
                            print(password[0])
                            DispatchQueue.main.async {
                                if (self.textFieldEmail.text ?? "").isEmpty {
                                    self.viewEmail.isHidden = false
                                    self.labelEmail.text = "\(password[0])"
                                }
                            }
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
//        }
        else {
            self.showAlert(message: "Network Error")
        }
    }
}
    


//if cellModel.isSelect == true {
//cell.imageViewSelected?.isHidden = false
//} else {
//cell.imageViewSelected?.isHidden = true
//}

//var isSelect: Bool = false

//if cellModel.isSelect == true {
//    cellModel.isSelect = false
//} else {
//    cellModel.isSelect = true
//}
