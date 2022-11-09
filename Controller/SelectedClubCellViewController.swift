//
//  SelectedClubCellViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 25/07/22.
//

import UIKit
import SJFrameSwift

class SelectedClubCellViewController: SJViewController, PassToSelectedClubViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var viewGradient: UIView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewGradientFavorite: UIView!
    @IBOutlet weak var viewGradientBuyTickets: UIView!
    @IBOutlet weak var labelClubName: UILabel!
    @IBOutlet weak var imageClubProfile: UIImageView!
    @IBOutlet weak var buttonFollow: UIButton!
    @IBOutlet weak var labelFollow: UILabel!
    @IBOutlet weak var imageLike: UIImageView!
    @IBOutlet weak var labelFavorite: UILabel!
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelLatest: UILabel!
    @IBOutlet weak var labelClub: UILabel!
    @IBOutlet weak var labelTeam: UILabel!
    @IBOutlet weak var labelContact: UILabel!
    @IBOutlet weak var viewLatestBottom: UIView!
    @IBOutlet weak var viewClubBottom: UIView!
    @IBOutlet weak var viewTeamBottom: UIView!
    @IBOutlet weak var viewContactBottom: UIView!
    @IBOutlet weak var labelhomeGround: UILabel!
    @IBOutlet weak var labelmainSponsor: UILabel!
    @IBOutlet weak var viewCornerRadius: UIView!
    @IBOutlet weak var buttonFavorite: UIButton!
    var selectedClub: Club = Club([:])
    var LatestNewsCollectionArray:[LastNews] = []
    var latestSectionArray: [LatestSection] = []
    var latestTableArray:[LatestNewsTable] = []
    var iconClick = true
    var clubDetailsResponse:ClubDetailsResponse = ClubDetailsResponse([:])
    var vlubDetailsVC:LatestDetailsViewController?
    var clubDetailsVC:ClubDetailsViewController?
    var teamDetailsVC:TeamViewController?
    var contactDetailsVC:ContactViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callClubProfileAPI()
//        setTableModel()
        setGradientBuyTickets()
        viewClubBottom.isHidden = true
        viewTeamBottom.isHidden = true
        viewContactBottom.isHidden = true
//        self.labelClubName.text = getClubsModel.title
//        self.imageClubProfile.downloadThumpImage(url: getClubsModel.field_media_image)
        roundCorners(with: [.layerMinXMaxYCorner], radius: 25)
        roundCornersInTop(with: [.layerMinXMaxYCorner], radius: 30)
//        setModels()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageLeft.rotate()
        imageRight.rotate()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
        
    }
    func setUIElementINLatest() {
        labelClubName.text = clubDetailsResponse.club_name
        self.imageClubProfile?.downloadThumpImage(url: clubDetailsResponse.logo.spaceRemoved())
        labelhomeGround.text = clubDetailsResponse.home_ground
        let mainSponsor = clubDetailsResponse.main_sponsor
        if mainSponsor.isEmpty == false {
            labelmainSponsor.text = "\(SJLocalisedString["key_Main Sponsor"]): \(clubDetailsResponse.main_sponsor)"
        }
        let isFavorite = clubDetailsResponse.is_favorite
        if isFavorite == false {
            self.labelFavorite.text = SJLocalisedString["key_Unfavorite"]
            imageLike.image = UIImage(named:"likeImg")
            viewGradientFavorite.backgroundColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
        }
        else {
            self.labelFavorite.text = SJLocalisedString["key_Favorite"]
            imageLike.image = UIImage(named:"unlike")
            viewGradientFavorite.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        }
        let isFollowing = clubDetailsResponse.is_following
        if isFollowing == false {
            self.labelFollow.text = SJLocalisedString["key_Unfollow"]
            
        }
        else {
            self.labelFollow.text = SJLocalisedString["key_Follow"]
        }
        
//        self.imageClubProfile.downloadThumpImage(url: logo)
    }
    func buttonAction() {
        
        for model in latestSectionArray {
            if model.type == .button {
                
            }
        }
    }
    @IBAction func buttonActionBuyTicket(sender: UIButton) {
        print("Buy Ticket button Clicked")
        let buyTickets = clubDetailsResponse.buy_tickets
        if let url = NSURL(string: buyTickets) {
            UIApplication.shared.openURL(url as URL)
        }
    }

//    func setTableModel() {
//        let cell1 = LatestNewsTable(strtitle: "", functionality: .collection)
//        let Array = [cell1]
//        let section1 = LatestSection(title: "Last News", type: .title, clubDetails: Array)
//        latestSectionArray.append(section1)
//        let cell2 = LatestNewsTable(strtitle: "OOREDOO CUP", functionality: .fixture)
//        let cell21 = LatestNewsTable(strtitle: "QATAR STARS LEAGUE", functionality: .fixture)
//        let Cell2Array = [cell2, cell21]
//        let section2 = LatestSection(title: "Fixtures", type: .button, clubDetails: Cell2Array)
//        latestSectionArray.append(section2)
//        let cell3 = LatestNewsTable(strtitle: "28/03/2021", functionality: .mediaGallery)
//        let cell31 = LatestNewsTable(strtitle: "30/03/2022", functionality: .mediaGallery)
//        let Cell3Array = [cell3, cell31]
//        let section3 = LatestSection(title: "Media Gallery", type: .title, clubDetails: Cell3Array)
//        latestSectionArray.append(section3)
//    }
//    func setModels() {
//        let field1 = LatestNews(title: "Al Sadd End Campaign With Win Over Al Faisaly In 2022 AFC Champions League", fieldMediaImg: "ClubNewsImg")
//        let field2 = LatestNews(title: "Umm Salal", fieldMediaImg: "ClubNewsImg")
//        let field3 = LatestNews(title: "Qatar SC", fieldMediaImg: "ClubNewsImg")
//        let field4 = LatestNews(title: "Al Rayyan", fieldMediaImg: "ClubNewsImg")
//        let field5 = LatestNews(title: "Umm Salal", fieldMediaImg: "ClubNewsImg")
//        let field6 = LatestNews(title: "Qatar SC", fieldMediaImg: "ClubNewsImg")
//        let field7 = LatestNews(title: "Al Rayyan", fieldMediaImg: "ClubNewsImg")
//        let field8 = LatestNews(title: "Umm Salal", fieldMediaImg: "ClubNewsImg")
//        let field9 = LatestNews(title: "Qatar SC", fieldMediaImg: "ClubNewsImg")
//        LatestNewsCollectionArray = [field1,field2,field3, field4, field5, field6, field7, field8, field9]
//    }
    func setGradientBackground() {
        let colorTop = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewGradient.bounds
        viewGradient.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    func roundCorners(with CACornerMask: CACornerMask, radius: CGFloat) {
        viewCornerRadius.layer.cornerRadius = radius
        viewCornerRadius.layer.maskedCorners = [CACornerMask]
        
        viewGradient.layer.cornerRadius = radius
        viewGradient.layer.maskedCorners = [CACornerMask]
    }
    
    func roundCornersInTop(with CACornerMask: CACornerMask, radius: CGFloat) {
        viewTop.layer.cornerRadius = radius
        viewTop.layer.maskedCorners = [CACornerMask]
    }
    func setGradientFavorite() {
        let colorTop = UIColor(red: 255.0/255.0, green: 170.0/255.0, blue: 0.0/255.0, alpha: 0.0).cgColor
        let colorBottom = UIColor(red: 240.0/255.0, green: 117.0/255.0, blue: 0.0/255.0, alpha: 0.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewGradientFavorite.bounds
        viewGradientFavorite.layer.insertSublayer(gradientLayer, at: 0)
    }
    func setGradientUnfavorite() {
        let colorTop = UIColor(red: 255.0/255.0, green: 170.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 240.0/255.0, green: 117.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewGradientFavorite.bounds
        viewGradientFavorite.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setGradientBuyTickets() {
        let colorTop = UIColor(red: 255.0/255.0, green: 170.0/255.0, blue: 0.0/255.0, alpha: 0.0).cgColor
        let colorBottom = UIColor(red: 240.0/255.0, green: 117.0/255.0, blue: 0.0/255.0, alpha: 0.1).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 0.0]
        gradientLayer.frame = viewGradientBuyTickets.bounds
        viewGradientBuyTickets.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to change your favorite team?", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { _ in
                //Cancel Action
            }))
            alert.addAction(UIAlertAction(title: "Add",
                                          style: UIAlertAction.Style.default,
                                          handler: {(_: UIAlertAction!) in
              
                if(self.iconClick == true) {
                    print("Button Favorite Cliked")
                    self.labelFavorite.text = "Favorite"
                    self.imageLike.image = UIImage(named:"unlike")
                    self.viewGradientFavorite.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                }
                else {
                    print("Button Unfavorite Cliked")
                    self.labelFavorite.text = "Unfavorite"
                    self.imageLike.image = UIImage(named:"likeImg")
                    self.viewGradientFavorite.backgroundColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
                }
                self.iconClick = !self.iconClick
            
            }))
            self.present(alert, animated: true, completion: nil)
    }
    
//    func setGradientFixtures() {
//        let colorTop = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 0.0).cgColor
//        let colorBottom = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 0.1).cgColor
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorTop, colorBottom]
//        gradientLayer.locations = [0.0, 0.0]
//        gradientLayer.frame = viewGradientBuyTickets.bounds
//        viewGradientBuyTickets.layer.insertSublayer(gradientLayer, at: 0)
//    }
    @IBAction func buttonActionCloseArrow(sender: UIButton) {
        navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func buttonActionFollow(sender: UIButton) {
        if(iconClick == true) {
            labelFollow.text = SJLocalisedString["key_Follow"]
        } else {
            labelFollow.text = SJLocalisedString["key_Unfollow"]
        }
        iconClick = !iconClick
    }

    @IBAction func buttonActionFavorite(sender: UIButton) {
//        viewGradientFavorite.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            showSimpleAlert()
    }
      
    @IBAction func buttonActionLatest(sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        viewLatestBottom.isHidden = false
        viewClubBottom.isHidden = true
        viewTeamBottom.isHidden = true
        viewContactBottom.isHidden = true
        labelLatest.font = UIFont(name: "Jotia-Bold", size: 16.0)
        labelClub.font = UIFont(name: "Jotia-Regular", size: 16.0)
        labelTeam.font = UIFont(name: "Jotia-Regular", size: 16.0)
        labelContact.font = UIFont(name: "Jotia-Regular", size: 16.0)
//        labelLatest.font = UIFont.boldSystemFont(ofSize: 16.0)
//        self.performSegue(withIdentifier: "LatestDetailsViewController", sender: nil)
    }
    
    @IBAction func buttonActionClub(sender: UIButton) {
        viewClubBottom.isHidden = false
        viewLatestBottom.isHidden = true
        viewTeamBottom.isHidden = true
        viewContactBottom.isHidden = true
        labelClub.font = UIFont(name: "Jotia-Bold", size: 16.0)
        labelLatest.font = UIFont(name: "Jotia-Regular", size: 16.0)
        labelTeam.font = UIFont(name: "Jotia-Regular", size: 16.0)
        labelContact.font = UIFont(name: "Jotia-Regular", size: 16.0)
//        labelClub.font = UIFont.boldSystemFont(ofSize: 16.0)
        let screenSize: CGRect = UIScreen.main.bounds
        scrollView.setContentOffset(CGPoint(x: screenSize.width, y: 0), animated: true)
//        scrollView.setContentOffset(CGPoint(x: screenSize.width + screenSize.width, y: 0), animated: true)
    }
    
    @IBAction func buttonActionTeam(sender: UIButton) {
        viewClubBottom.isHidden = true
        viewLatestBottom.isHidden = true
        viewTeamBottom.isHidden = false
        viewContactBottom.isHidden = true
        labelTeam.font = UIFont(name: "Jotia-Bold", size: 16.0)
        labelLatest.font = UIFont(name: "Jotia-Regular", size: 16.0)
        labelClub.font = UIFont(name: "Jotia-Regular", size: 16.0)
        labelContact.font = UIFont(name: "Jotia-Regular", size: 16.0)
//        labelTeam.font = UIFont.boldSystemFont(ofSize: 16.0)
        let screenSize: CGRect = UIScreen.main.bounds
        scrollView.setContentOffset(CGPoint(x: 2*(screenSize.width), y: 0), animated: true)
    }
    
    @IBAction func buttonActionContact(sender: UIButton) {
        viewClubBottom.isHidden = true
        viewLatestBottom.isHidden = true
        viewTeamBottom.isHidden = true
        viewContactBottom.isHidden = false
        labelContact.font = UIFont(name: "Jotia-Bold", size: 16.0)
        labelLatest.font = UIFont(name: "Jotia-Regular", size: 16.0)
        labelClub.font = UIFont(name: "Jotia-Regular", size: 16.0)
        labelTeam.font = UIFont(name: "Jotia-Regular", size: 16.0)
//        labelContact.font = UIFont.boldSystemFont(ofSize: 16.0)
        let screenSize: CGRect = UIScreen.main.bounds
        scrollView.setContentOffset(CGPoint(x: 3*(screenSize.width), y: 0), animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LatestDetailsViewController{
            vc.club = selectedClub
            vlubDetailsVC = vc
        }
        if let clubVc = segue.destination as? ClubDetailsViewController {
            clubVc.club = selectedClub
            clubDetailsVC = clubVc
        }
        if let teamVc = segue.destination as? TeamViewController {
            teamVc.club = selectedClub
            teamDetailsVC = teamVc
        }
        if let contactVc = segue.destination as? ContactViewController {
            contactVc.club = selectedClub
            contactDetailsVC = contactVc
        }
    }
}
//extension SelectedClubCellViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return LatestNewsCollectionArray.count
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestNews.cell", for: indexPath) as! LatestNewsCollectionViewCell
//        cell.setModel(modelNews: LatestNewsCollectionArray[indexPath.item])
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
////        return CGSize(width: self.view.frame.size.width-80, height: 300.0)
//        return CGSize(width: 299, height: 292)
//    }
//}
//extension SelectedClubCellViewController: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return latestSectionArray.count
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let rowSectionIndex = latestSectionArray[section]
//        let latestArray = rowSectionIndex.clubDetails
//        return latestArray.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let sections = latestSectionArray[indexPath.section]
//        let setlatestArray = sections.clubDetails
//        let cellModel = setlatestArray[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier, for: indexPath) as! LatestTableViewCell
//        cell.setLatest(LabelModel: cellModel)
//        return cell
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerSection = latestSectionArray[section]
//        let sections = tableView.dequeueReusableCell(withIdentifier: headerSection.identifier) as? SectionTableViewCell
//        sections?.setSectionLatest(LatestSection: headerSection)
////        let sectionResult = tableView.dequeueReusableCell(withIdentifier: "CellForResults") as? SectionTableViewCell
//        return sections!
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
//}
extension SelectedClubCellViewController {
    func callClubProfileAPI() { 
        if AppController.shared.checkInternetAvailability() {
            let nwctrl = APINetworkController();
            let apiService = ConstantAPI.WEBSERVICE_CLUBSPROFILE_SERVICE+"?team=\(selectedClub.nid)"
            let objRequest = AppBaseRequest(apiService, ConstantAPI.k_REQUEST_TYPE_GET);
            self.showLoader()
            nwctrl.callWebserviceRequest(objRequest) { objResponse in
                if objResponse.api_status == true {
                    self.hideLoader()
                    if let result = objResponse.resultData as? [String: Any] {
                        print(result)
                        DispatchQueue.main.async {
                            self.clubDetailsResponse = ClubDetailsResponse(result)
                            self.setUIElementINLatest()
                            
                            self.vlubDetailsVC?.clubDetailsResponse = self.clubDetailsResponse
                            self.clubDetailsVC?.clubDetailsResponse = self.clubDetailsResponse
                            self.teamDetailsVC?.clubDetailsResponse = self.clubDetailsResponse
                            self.contactDetailsVC?.clubDetailsResponse = self.clubDetailsResponse
                            self.vlubDetailsVC?.setStaticUIElements()
                            self.vlubDetailsVC?.createSectionModels()
                            self.clubDetailsVC?.createSectionModelsInClub()
                            self.teamDetailsVC?.createSectionModelsInTeam()
//                            self.clubDetailsVC?.setStaticUIElementsInClub()
                            self.contactDetailsVC?.setStaticUIElementsINContact()
                        }
                       
//                        if let clubName = result["club_name"] as? String {
//                            print("ClubName is :", clubName)
//                            DispatchQueue.main.async {
//                                self.labelClubName.text = clubName
//                            }
////                        }
//                        if let logo = result["logo"] as? String {
//                            print("image is:", logo)
////                                let image = UIImage(named: logo)
////                                let imageViewLogo = UIImageView(image: image!)
//                            DispatchQueue.main.async {
//                                self.imageClubProfile.downloadThumpImage(url: logo)
////                                self.imageClubProfile = UIImageView(image: image)
//                            }
//                        }
//                        if let homeGround = result["home_ground"] as? String {
//                            print("HomeGround:", homeGround)
//                            DispatchQueue.main.async {
//                                self.labelhomeGround.text = homeGround
//                            }
//                        }
//                        if let mainSponsor = result["main_sponsor"] as? String {
//                            if mainSponsor.isEmpty == false {
//                                DispatchQueue.main.async {
//                                    self.labelmainSponsor.text = "Main Sponsor:\(mainSponsor)"
//                                }
//                            }
//                        }
//                        if let buyTickets = result["buy_tickets"] as? String {
//
//                        }
                        
//                        if let isFavorite = result["is_favorite"] as? Bool {
//                            DispatchQueue.main.async {
//                                if isFavorite == false {
//                                    self.labelFavorite.text = "Unfavorite"
//                                }
//                                else {
//                                    self.labelFavorite.text = "Favorite"
//                                }
//                            }
//                        }
//                        if let isFollowing = result["is_following"] as? Bool {
//                            DispatchQueue.main.async {
//                                if isFollowing == false {
//                                    self.labelFollow.text = "Unfollow"
//                                }
//                                else {
//                                    self.labelFollow.text = "Follow"
//                                }
//                            }
//                        }
                        
                        
//                        if let latest = result["latest"] as? [String: Any] {
//                            print("Latest is:", latest)
//                            if let lastNews = latest["last_news"] as? [[String: Any]] {
//                                print("LastNews are: ", lastNews)
//                                for obj in lastNews {
//                                    let news = LastNews(obj)
//                                    print("News are:", news)
//                                    self.LatestNewsCollectionArray.append(news)
//                                    print(self.LatestNewsCollectionArray)
//                                }
//                            }
//                            if let fixtures = latest["fixtures"] as? [[String: Any]] {
//                                print("Fixtures are:", fixtures)
//                                for obj in fixtures {
//
//
//                                }
//                            }
//                        }
//                        for objs in self.latestSectionArray {
//                            if objs.type == .title {
//                                for objDetail in objs.clubDetails {
//                                    if objDetail.type == .collection {
//                                        objDetail.collectionArray = self.LatestNewsCollectionArray
//                                    }
//                                }
//                            }
//                        }
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
    
 
