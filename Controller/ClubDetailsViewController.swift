//
//  ClubDetailsViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 16/08/22.
//

import UIKit
import SJFrameSwift

class ClubDetailsViewController: SJViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var club:Club = Club([:])
    var clubDetailsResponse:ClubDetailsResponse = ClubDetailsResponse([:])
    var sectionModels:[ClubDetailSectionModel] = []
    var cellModels:[ClubDetailsTableCellModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    func setStaticUIElementsInClub() {
//        self.labelEstablished.text = clubDetailsResponse.club.established
//        self.labelNickname.text = clubDetailsResponse.club.nickname
//        self.labelPresident.text = clubDetailsResponse.club.president
//    }
    
    func createSectionModelsInClub() {
        sectionModels = []
        if clubDetailsResponse.club.established.count > 0 {
            let establisedSectionModel = ClubDetailSectionModel(.establised)
                let establisedCellModel = ClubDetailsTableCellModel(.establised)
                establisedCellModel.establishedDetails = clubDetailsResponse.club
                establisedSectionModel.cellModels.append(establisedCellModel)
            sectionModels.append(establisedSectionModel)
        }
        
        if clubDetailsResponse.club.titles.count > 0 {
            let titleSectionModel = ClubDetailSectionModel(.title)
            for title in 0..<clubDetailsResponse.club.titles.count {
                let titleCellModel = ClubDetailsTableCellModel(.title)
                titleCellModel.titleDetails = clubDetailsResponse.club.titles[title]
                titleSectionModel.cellModels.append(titleCellModel)
            }
            sectionModels.append(titleSectionModel)
        }
        if clubDetailsResponse.club.history.count > 0 {
            let historySectionModel = ClubDetailSectionModel(.history)
            let historyCellModel = ClubDetailsTableCellModel(.history)
                historyCellModel.establishedDetails = clubDetailsResponse.club
                historySectionModel.cellModels.append(historyCellModel)
            sectionModels.append(historySectionModel)
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


extension ClubDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionModels.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel = sectionModels[section]
        let header = tableView.dequeueReusableCell(withIdentifier: sectionModel.identifier) as! ClubDetailsTableViewSection
        header.sectionModel = sectionModel
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionModels[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel = sectionModels[indexPath.section]
        let cellModel = sectionModel.cellModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier) as! ClubDetailsTableViewCell
        cell.cellModel = cellModel
        return cell
    }
}
