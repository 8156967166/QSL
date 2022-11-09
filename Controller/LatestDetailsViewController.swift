
//  ClubsListViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 30/07/22.
//

import UIKit
import SJFrameSwift

class LatestDetailsViewController: SJViewController, PassToSelectedLatestDetailsViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblClubName: UILabel?
    @IBOutlet weak var imgClubLogo: UIImageView?

    //MARK: - Variables
    var club:Club = Club([:])
    var clubDetailsResponse:ClubDetailsResponse = ClubDetailsResponse([:])
    var sectionModels:[LatestDetailTableViewSectionModel] = [] //Table data source
    var cellModels:[LatestDetailTableViewCellModel] = []
    var isSelectedFixture: Bool = false
    var isSelectedResult: Bool = false
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        callClubProfileAPI()
    }
    
    func setStaticUIElements() {
        self.lblClubName?.text = clubDetailsResponse.club_name
        self.imgClubLogo?.downloadThumpImage(url: clubDetailsResponse.logo.spaceRemoved())
    }
    
    func gradient(frame:CGRect) -> CAGradientLayer {
        let colorTop = UIColor(red: 22.0/255.0, green: 22.0/255.0, blue: 21.0/255.0, alpha: 0.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        return gradientLayer
//            let layer = CAGradientLayer()
//            layer.frame = frame
//        layer.startPoint = CGPoint(x: 0, y: 0.5)
//        layer.endPoint = CGPoint(x: 1, y: 0.5)
//        layer.colors = [
//                UIColor.black.cgColor,UIColor.black.cgColor]
//            return layer
    }
    @objc func buttonAction(senderButton: UIButton) {
        if senderButton.tag == 1 {
            isSelectedFixture = false
            
            
            print("Fixture Button Clicked in VC")
            let fixtureSectionModel = LatestDetailTableViewSectionModel(.fixturesAndResults)
            
            for fixture in 0..<clubDetailsResponse.latest.fixtures.count {
                let fixtureCellModel = LatestDetailTableViewCellModel(.fixtures)
                fixtureCellModel.clubFixturesDetails = clubDetailsResponse.latest.fixtures[fixture]
                fixtureSectionModel.cellModels.append(fixtureCellModel)
            }
            if let index = sectionModels.firstIndex(where: {$0.sectionType == .fixturesAndResults}) {
                print("index =====> \(index)")
                sectionModels[index] = fixtureSectionModel
            }
        }
        else if senderButton.tag == 2 {
//            isSelectedFixture = false
            if isSelectedFixture == false {
                isSelectedFixture = true
            }
            if clubDetailsResponse.latest.results.count > 0 {
                let resultSectionModel = LatestDetailTableViewSectionModel(.fixturesAndResults)
                for result in 0..<clubDetailsResponse.latest.results.count {
                    let resultCellModel = LatestDetailTableViewCellModel(.results)
                    resultCellModel.clubResultsDetails = clubDetailsResponse.latest.results[result]
                    resultSectionModel.cellModels.append(resultCellModel)
                }
                let index = sectionModels.firstIndex(where: {$0.sectionType == .fixturesAndResults})
                print("index =====> \(index!)")
                sectionModels[index!] = resultSectionModel
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func createSectionModels() {
        sectionModels = []
        if clubDetailsResponse.latest.last_news.count > 0 {
            
            let lastNewsSectionModel = LatestDetailTableViewSectionModel(.latestNews)
            let lastNewsCellModel = LatestDetailTableViewCellModel(.latestNews)
            lastNewsSectionModel.cellModels = [lastNewsCellModel]
            lastNewsCellModel.last_news = clubDetailsResponse.latest.last_news
            sectionModels.append(lastNewsSectionModel)
        }
        
        if clubDetailsResponse.latest.fixtures.count > 0 {

            let fixtureSectionModel = LatestDetailTableViewSectionModel(.fixturesAndResults)

            for fixture in 0..<clubDetailsResponse.latest.fixtures.count {
                let fixtureCellModel = LatestDetailTableViewCellModel(.fixtures)
                fixtureCellModel.clubFixturesDetails = clubDetailsResponse.latest.fixtures[fixture]
                fixtureSectionModel.cellModels.append(fixtureCellModel)
            }
            sectionModels.append(fixtureSectionModel)
        }
//        if clubDetailsResponse.latest.results.count > 0 {
////            let resultSectionModels:[LatestDetailTableViewSectionModel] = []
//            let resultSectionModel = LatestDetailTableViewSectionModel(.fixturesAndResults)
//
//            for result in 0..<clubDetailsResponse.latest.results.count {
//                let resultCellModel = LatestDetailTableViewCellModel(.results)
//                resultCellModel.clubResultsDetails = clubDetailsResponse.latest.results[result]
//                resultSectionModel.cellModels.append(resultCellModel)
////                resultSectionModel.cellModels = [resultCellModel]
//            }
//            let index = sectionModels.firstIndex(where: {$0.sectionType == .fixturesAndResults})
//            print("index =====> \(index!)")
//            sectionModels[index!] = resultSectionModel
////            sectionModels.append(resultSectionModel)
////            sectionModels[1].cellModels = [resultSectionModel.cellModels[1]]
////            sectionModels.append(resultSectionModel)
//
//
////            print("sectionModel Result =====> \(sectionModels[1])")
//        }
//////
    
        
        
//        if clubDetailsResponse.latest.results.count > 0 {
//            var resultCellModels:[LatestDetailTableViewSectionModel] = []
////            let resultsSectionModel = LatestDetailTableViewSectionModel(.fixturesAndResults)
//            for result in 0..<clubDetailsResponse.latest.results.count {
//                let resultCellModels = LatestDetailTableViewCellModel(.results)
//                resultCellModels.clubResultsDetails = clubDetailsResponse.latest.results[result]
//                resultCellModels.cellModels.append(resultCellModels)
//            }
//            sectionModels[1].cellModels = [resultsSectionModel]
////            sectionModels.append(resultsSectionModel)
//        }
        
        
        
//        if clubDetailsResponse.latest.media_gallery.count > 0 {
//            let mediaGallerySectionModel = LatestDetailTableViewSectionModel(.mediaGallery)
//            let mediaGalleryCellModel = LatestDetailTableViewCellModel(.mediaGallery)
//            mediaGallerySectionModel.cellModels = [mediaGalleryCellModel]
//            mediaGalleryCellModel.media_gallery = clubDetailsResponse.latest.media_gallery
//            sectionModels.append(mediaGallerySectionModel)
//        }
        if clubDetailsResponse.latest.media_gallery.count > 0 {
            let mediaGallerySectionModel = LatestDetailTableViewSectionModel(.mediaGallery)
            for media in 0..<clubDetailsResponse.latest.media_gallery.count {
                let mediaGalleryCellModel = LatestDetailTableViewCellModel(.mediaGallery)
                mediaGalleryCellModel.clubMediaGalleryDetails = clubDetailsResponse.latest.media_gallery[media]
                mediaGallerySectionModel.cellModels.append(mediaGalleryCellModel)
            }
            sectionModels.append(mediaGallerySectionModel)
        }
        for cellModel in cellModels {
            print("cellModel ===> \(cellModel.cellType)")
        }
        for sectionModel in sectionModels {
            
            print("SectionModel ===> \(sectionModel.sectionType)")
            
        }
//        let index = sectionModels.firstIndex(where: {$0.sectionType == .fixturesAndResults})
//        print("index =====> \(index!)")
       
        print("SectionModel Count===> \(sectionModels.count)")
       
        print("SectionModel Index =====>, \(sectionModels[1].sectionType)")
        print("SectionModel cellModel Index =====>, \(sectionModels[1].cellModels) ")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Button Actions
    @IBAction func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension LatestDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
      return sectionModels.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel = sectionModels[section]
        let header = tableView.dequeueReusableCell(withIdentifier: sectionModel.identifier) as! LatestDetailsTableViewSection
        header.sectionModel = sectionModel
        header.buttonFixture?.addTarget(self, action: #selector(buttonAction(senderButton: )), for: .touchUpInside)
        
        header.buttonResult?.addTarget(self, action: #selector(buttonAction(senderButton:)), for: .touchUpInside)
        header.isSelectedFixture = isSelectedFixture
       
//        header.isSelecetdResult = isSelectedResult
        
//        if header.buttonFixture?.isSelected == true {
//        if isSelectedFixture == true {
//                header.viewResults?.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
//                header.viewFixtures?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
//            }
//        }

        
        return header
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return sectionModels[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionModel = sectionModels[indexPath.section]
    
//        if indexPath.row == 0 {
//        let section = tableView.dequeueReusableCell(withIdentifier: sectionModel.identifier) as! LatestDetailsTableViewSection
////            section.sectionModel = sectionModel
//            return section
//        }
        
        let cellModel = sectionModel.cellModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier) as! LatestDetailsTableViewCell
        cell.cellModel = cellModel
//        cell.viewGradientMedia?.layer.insertSublayer(gradient(frame: cell.viewGradientMedia!.bounds), at: 0)
        return cell
    }
}







////MARK: - API Calls
//extension ClubDetailsViewController {
//    func callClubProfileAPI() {
//
//        if AppController.shared.checkInternetAvailability() {
//            let nwctrl = APINetworkController();
//            let apiService = ConstantAPI.WEBSERVICE_CLUBSPROFILE_SERVICE+"?team=\(club.nid)"
//            let objRequest = AppBaseRequest(apiService, ConstantAPI.k_REQUEST_TYPE_GET);
//            self.showLoader()
//            nwctrl.callWebserviceRequest(objRequest) { objResponse in
//                if objResponse.api_status == true {
//                    self.hideLoader()
//                    if let result = objResponse.resultData as? [String: Any] {
//                        print("result====> \(result)")
//
//                        DispatchQueue.main.async {
//                            self.clubDetailsResponse = ClubDetailsResponse(result)
//                            self.setStaticUIElements()
//                            self.createSectionModels()
//
//
//                            print("self.clubDetailsResponse.latest.last_news.count====> \(self.clubDetailsResponse.latest.last_news.count)")
//
//                        }
//                    }
//                }
//                else {
//                    self.hideLoader()
//                    if !objResponse.errorMsg.isEmpty {
//                        self.showAlert(message: objResponse.errorMsg)
//                    }else {
//                        self.showAlert(message: "Network Error")
//                    }
//                }
//            }
//        }
//        else {
//            self.showAlert(message: "Network Error")
//        }
//
//    }
//
//}





//for news in 0..<clubDetailsResponse.latest.last_news.count {
//    let lastNewsCellModel = LatestDetailTableViewCellModel(.latestNews)
//    lastNewsCellModel.news = clubDetailsResponse.latest.last_news[news]
//    lastNewsSectionModel.cellModels.append(lastNewsCellModel)
//}
//sectionModels.append(lastNewsSectionModel)
