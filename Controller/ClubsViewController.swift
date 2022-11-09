//
//  Tab2ViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 21/07/22.
//

import UIKit
import SJFrameSwift

class ClubsViewController: SJViewController {
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var viewGradient: UIView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var imageLeft: UIImageView!
    var dataSource:[Club] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionview.delegate = self
        callClubsAPI()
        roundCorners(with: [.layerMinXMaxYCorner], radius: 25)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageRight.rotate()
        imageLeft.rotate()
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        collectionview?.transform = CGAffineTransform(scaleX: -1, y: 1)
//    }
    func setGradientBackground() {
        let colorTop = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        viewGradient.layer.insertSublayer(gradientLayer, at: 0)
    }
    func roundCorners(with CACornerMask: CACornerMask, radius: CGFloat) {
        viewTop.layer.cornerRadius = radius
        viewTop.layer.maskedCorners = [CACornerMask]
    }
   
}
extension ClubsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Clubs.cell", for: indexPath) as! ClubsCollectionViewCell
        cell.setModel(setClubsModel: dataSource[indexPath.item])
//        cell.transform = CGAffineTransform(scaleX: -1, y: 1)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((self.view.frame.size.width/4) - 10), height: 125)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Cell \(indexPath.row + 1) clicked")
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SelectedClubCellViewController") as! SelectedClubCellViewController
//        self.navigationController?.pushViewController(nextViewController, animated: true)
        let selectedClub = dataSource[indexPath.item]
        self.performSegue(withIdentifier: "SelectedClubCellViewController", sender: selectedClub)
//        self.performSegue(withIdentifier: "ClubDetailsViewController", sender: selectedClub)
        
      }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SelectedClubCellViewController, let selectedClub = sender as? Club{
            vc.selectedClub = selectedClub
        }else if let vc = segue.destination as? LatestDetailsViewController, let selectedClub = sender as? Club{
            vc.club = selectedClub
        }
    }
}

extension ClubsViewController {
    func callClubsAPI() {
        
        if AppController.shared.checkInternetAvailability() {
            let nwctrl = APINetworkController();
            let objRequest = AppBaseRequest(ConstantAPI.WEBSERVICE_CLUBS_SERVICE, ConstantAPI.k_REQUEST_TYPE_GET);
            self.showLoader()
            nwctrl.callWebserviceRequest(objRequest) { objResponse in
                if objResponse.api_status == true {
                    self.hideLoader()
                    if let result = objResponse.resultData as? [String: Any] {
                        print(result)
                        if let data = result["data"] as? [[String: Any]] {
                            print(data[0])
                            for obj in data {
                                let club = Club(obj)
                                print("Club is:", club)
                                self.dataSource.append(club)
                                print(self.dataSource)
                            }
                            
//                            for (item) in data.enumerated() {
//                                print("\(item.offset): \(item.element.key)")
//                                let key = item.element.keys
//                                let value = item.element.values
//                                print(value)
//                                print(key)
//
//                            }
//                            for items in data {
////                                print("\(item.keys) : \(item.values)")
//                                print(items)
//
//                            }
                        }
                       
                    }
                    DispatchQueue.main.async {
                        self.collectionview.reloadData()
                    }
                        
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
    
 
