//
//  AccountVerifiedViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 15/07/22.
//

import UIKit

class AccountVerifiedViewController: UIViewController {
    @IBOutlet weak var imageTopRotated: UIImageView!
    @IBOutlet weak var imageBottomRotated: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageTopRotated.rotate()
        self.imageBottomRotated.rotate()
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
    @IBAction func buttonActionCloseArrow(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
