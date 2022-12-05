//
//  ClubsListTableViewCell.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 30/07/22.


import UIKit
import SJFrameSwift

//MARK: - Table Sections

protocol PassToSelectedLatestDetailsViewController {
    func buttonAction(senderButton: UIButton)
}

class LatestDetailsTableViewSection: UITableViewCell {
    @IBOutlet weak var labelHeader: UILabel?
    @IBOutlet weak var viewFixtures: UIView?
    @IBOutlet weak var viewResults: UIView?
    @IBOutlet weak var labelFixtures: UILabel?
    @IBOutlet weak var labelResults: UILabel?
    @IBOutlet weak var buttonFixture: UIButton?
    @IBOutlet weak var buttonResult: UIButton?
    @IBOutlet weak var viewFixtureBackground: UIView?
    @IBOutlet weak var viewResultBackground: UIView?
    
    
    var delegate: PassToSelectedLatestDetailsViewController?
    var isSelectedFixture: Bool? {
        didSet {
//            viewResults?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            if isSelectedFixture == true {
                viewResults?.backgroundColor = #colorLiteral(red: 1, green: 0.6274509804, blue: 0.1607843137, alpha: 1)
                labelResults?.textColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
//                labelFixtures?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                viewFixtures?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                viewResultBackground?.backgroundColor = #colorLiteral(red: 0.3921568627, green: 0.1254901961, blue: 0.2941176471, alpha: 1)
                viewFixtureBackground?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
//                viewFixtures?.isHidden = false
//                viewResults?.isHidden = true
            }
            else {
                viewFixtures?.backgroundColor = #colorLiteral(red: 1, green: 0.6274509804, blue: 0.1607843137, alpha: 1)
                viewResults?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                labelFixtures?.textColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
//                labelResults?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                viewFixtureBackground?.backgroundColor = #colorLiteral(red: 0.3921568627, green: 0.1254901961, blue: 0.2941176471, alpha: 1)
                viewResultBackground?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
//                viewFixtures?.isHidden = true
//                viewResults?.isHidden = false
            }
        }
    }
//    var isSelecetdResult: Bool? {
//        didSet {
//            if isSelecetdResult == true {
//                viewResults?.isHidden = false
//                viewFixtures?.isHidden = true
//            }
//        }
//    }
    
    var sectionModel:LatestDetailTableViewSectionModel! {
        didSet {
         setSectionItem()
            //You can call any method after setting ClubDetailTableViewSectionModel
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
//    @IBAction func buttonActionFixturesAndResults(sender: UIButton) {
//        delegate?.buttonAction(senderButton: sender)
//        if sender.tag == 1 {
//                viewFixtures?.layer.backgroundColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
//                viewResults?.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
//            print("Fixture Button Clicked")
//        }
//        else if sender.tag == 2 {
//                viewResults?.layer.backgroundColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
//                viewFixtures?.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
//        }
//    }
    func setSectionItem() {
//        labelHeader?.text = sectionModel
    }
}

//MARK: - Table Cells

class LatestDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel?
    @IBOutlet weak var labelDate: UILabel?
    @IBOutlet weak var imageMediaGalleryBackground: UIImageView?
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var labelFixtureNameHomeTeam: UILabel?
    @IBOutlet weak var labelFixtureNameAwayTeam: UILabel?
    @IBOutlet weak var imageFixtureHome_TeamLogo: UIImageView?
    @IBOutlet weak var imageFixtureAway_TeamLogo: UIImageView?
    @IBOutlet weak var labelFixtureCompetetion: UILabel?
    @IBOutlet weak var labelFixtureRound: UILabel?
    @IBOutlet weak var labelFixtureVenue: UILabel?
    @IBOutlet weak var labelResultNameHomeTeam: UILabel?
    @IBOutlet weak var labelResultNameAwayTeam: UILabel?
    @IBOutlet weak var imageResultHome_TeamLogo: UIImageView?
    @IBOutlet weak var imageResultAway_TeamLogo: UIImageView?
    @IBOutlet weak var labelResultCompetetion: UILabel?
    @IBOutlet weak var labelResultRound: UILabel?
    @IBOutlet weak var labelResultVenue: UILabel?
//    @IBOutlet weak var labelFixtureTime: UILabel?
    @IBOutlet weak var labelResultTime: UILabel?
    @IBOutlet weak var labelResultHome_TeamGoal: UILabel?
    @IBOutlet weak var labelResultAway_TeamGoal: UILabel?
    @IBOutlet weak var imageViewMediaGalleryType: UIImageView?
    @IBOutlet weak var viewGradientMedia: UIView?
    @IBOutlet weak var viewGradientInFixture: UIView?
    @IBOutlet weak var viewGradientInResult: UIView?
    var cellModels:[LatestDetailCollectionViewCellModel] = []
//    var cellModels:[LatestDetailTableViewCellModel] = []
    var cellModel:LatestDetailTableViewCellModel! {
        didSet {
            setGradientInMediaGallery()
            setGradientInFixtures()
            setGradientInResult()
            createCollectionCellModels()
            
            setCellItem()
            //You can call any method after setting ClubDetailTableViewCellModel
            print("News count ===> \(cellModel.last_news.count)")
            print("Media_Gallery ===> \(cellModel.media_gallery.count)")
            print("cellModel.getMediaGalleryList() ====> \(cellModel.getMediaGalleryList())")
        }
    }
    func setGradientInMediaGallery() {
            let colorTop = UIColor(red: 22.0/255.0, green: 22.0/255.0, blue: 21.0/255.0, alpha: 0.0).cgColor
            let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 2.0).cgColor
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop, colorBottom]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = self.viewGradientMedia?.bounds ?? CGRect.null
            self.viewGradientMedia?.layer.insertSublayer(gradientLayer, at:0)
    }
//    func setGradientInFixtures() {
//        let colorTop = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
//        let colorBottom = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 1.0).cgColor
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorTop, colorBottom]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.frame = viewGradientInFixture?.bounds ?? CGRect.null
//        self.viewGradientInFixture?.layer.insertSublayer(gradientLayer, at:0)
//    }
    func setGradientInFixtures() {
        let gradientLayer = CAGradientLayer()
        let rightColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
        let leftColor = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [rightColor, leftColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.viewGradientInFixture?.bounds ?? CGRect.null
        self.viewGradientInFixture?.layer.insertSublayer(gradientLayer, at:0)
    }
    func setGradientInResult() {
        let gradientLayer = CAGradientLayer()
        let rightColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
        let leftColor = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [rightColor, leftColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.viewGradientInResult?.bounds ?? CGRect.null
        self.viewGradientInResult?.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func setCellItem() {
        labelTitle?.text = cellModel.getMediaGalleryTitle()
        print(cellModel.getMediaGalleryTitle())
        self.imageMediaGalleryBackground?.downloadThumpImage(url: cellModel.getMediaGalleryImage())
//        self.imageViewMediaGalleryType?.downloadThumpImage(url: cellModel.getMediaGalleryType())
//        self.imageViewMediaGalleryType?.image = UIImage(named: cellModel.getMediaGalleryType())
        print("media background image ====> \(cellModel.getMediaGalleryImage())")
        labelDate?.text = cellModel.getMediaGalleryDate()
        print(cellModel.getMediaGalleryDate())
        let setType = cellModel.getMediaGalleryType()
        if setType == "image" {
            self.imageViewMediaGalleryType?.image = UIImage(named: "imageMediaGallery")
        }
        else {
            self.imageViewMediaGalleryType?.image = UIImage(named: "videoQslImg")
        }
//        imageMediaGalleryBackground?.downloadThumpImage(url: cellModel.getMediaGalleryImage())
//        self.imageMediaGalleryBackground?.downloadThumpImage(url: cellModel.getMediaGalleryImage())
        
        labelFixtureNameHomeTeam?.text = cellModel.getFixtureHome_TeamName()
        self.imageFixtureHome_TeamLogo?.downloadThumpImage(url: cellModel.getFixtureHome_TeamLogo())
        labelFixtureNameAwayTeam?.text = cellModel.getFixtureAway_TeamName()
        self.imageFixtureAway_TeamLogo?.downloadThumpImage(url: cellModel.getFixtureAway_TeamLogo())
        labelFixtureCompetetion?.text = cellModel.getFixtureCompetetion()
        labelFixtureRound?.text = cellModel.getFixtureRound()
        let setFixtureVenue = cellModel.getFixtureVenue()
        if setFixtureVenue.isEmpty {
            labelFixtureVenue?.text = "\(SJLocalisedString["key_To be determined"])"
//            labelFixtureVenue?.text = "To be determined"
        }
        else {
            labelFixtureVenue?.text = cellModel.getFixtureVenue()
        }
//        labelFixtureTime?.text = cellModel.getFixtureTime()
        
        labelResultNameHomeTeam?.text = cellModel.getResultHome_TeamName()
        labelResultNameAwayTeam?.text = cellModel.getResultAway_TeamName()
        self.imageResultHome_TeamLogo?.downloadImage(url: cellModel.getResultHome_TeamLogo())
        self.imageResultAway_TeamLogo?.downloadImage(url: cellModel.getResultAway_TeamLogo())
        labelResultCompetetion?.text = cellModel.getResultCompetetion()
        labelResultRound?.text = cellModel.getResultRound()
        labelResultTime?.text = cellModel.getResultTime()
        labelResultHome_TeamGoal?.text = cellModel.getResultHome_TeamGoal()
        labelResultAway_TeamGoal?.text = cellModel.getResultAway_TeamGoal()
        let setResultVenue = cellModel.getResultVenue()
        if setResultVenue.isEmpty {
            labelResultVenue?.text = "\(SJLocalisedString["key_To be determined"])"
        }
        else {
            labelResultVenue?.text = cellModel.getResultVenue()
        }
    }
    func createCollectionCellModels() {
        cellModels = []
        for cell in cellModel.last_news {
            let cellModel = LatestDetailCollectionViewCellModel(.collection)
            cellModel.clubDetails = cell
            cellModels.append(cellModel)
        }
//        if cellModel.last_news.count > 0 {
//            let lastNewsModel = ClubDetailCollectionViewCellModel(.collection)
//            lastNewsModel.last_news = clubDetailsResponse.latest.last_news
//
//            //cellModel.cellModels = [lastNewsModel]
//        }
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if AppController.shared.isAppLanguageArabic() {
            collectionView?.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
   
}

extension LatestDetailsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModel.getLastNewsList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = cellModels[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellModel.identifier, for: indexPath) as! LatestDetailsCollectionViewCell
        cell.cellModel = cellModel
//        cell.setModel(modelNews: cellModel.getLastNewsList()[indexPath.item])
        if AppController.shared.isAppLanguageArabic() {
            cell.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
     
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 299, height: 292)
    }
}
