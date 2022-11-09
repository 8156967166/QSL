//
//  PasswordUpdatedViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 19/07/22.
//

import UIKit

class PasswordUpdatedViewController: UIViewController {
    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var imageBottom: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    func setGradientBackground() {
        let colorTop = UIColor(red: 69.0/255.0, green: 6.0/255.0, blue: 42.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 100.0/255.0, green: 1.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func buttonActionContinue(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let wrapperVC = storyboard.instantiateViewController(withIdentifier: "QslSignInViewController") as! QslSignInViewController
        self.navigationController?.pushViewController(wrapperVC, animated: false)
    }
}
