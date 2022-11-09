//
//  TeamViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 17/08/22.
//

import UIKit
import SJFrameSwift

class TeamViewController: SJViewController, PassToTeamDetailsViewController {
    var isSelectedReadMore: Bool = true
    var isViewColor: Bool = true
    @IBOutlet weak var tableView: UITableView!
    
    var club:Club = Club([:])
    var clubDetailsResponse:ClubDetailsResponse = ClubDetailsResponse([:])
    var sectionModels:[TeamDetailSectionModel] = []
    var cellModels:[TeamDetailsTableCellModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc func buttonAction(senderButton: UIButton) {
        if senderButton.tag == 1 {
            print("Button Clicked......")
            isSelectedReadMore = !isSelectedReadMore
            tableView.reloadData()
//            isSelectedReadMore = false
        }
    }
    func createSectionModelsInTeam() {
        sectionModels = []
        if clubDetailsResponse.team.coach.id.count > 0 {
            let teamSectionModel = TeamDetailSectionModel(.coach)
            let teamCellModel = TeamDetailsTableCellModel(.coach)
            teamCellModel.teamDetails = clubDetailsResponse.team
                    teamSectionModel.cellModels.append(teamCellModel)
                sectionModels.append(teamSectionModel)
        }
        
//        if clubDetailsResponse.team.categories.count > 0 {
//
//            for categories in 0..<clubDetailsResponse.team.categories.count {
//                let categoriesSectionModel = TeamDetailSectionModel(.categories)
//
//                let categoriesCellModel = TeamDetailsTableCellModel(.categories)
//                categoriesCellModel.categoriesDetails = clubDetailsResponse.team.categories[categories]
//                categoriesSectionModel.cellModels.append(categoriesCellModel)
//                sectionModels.append(categoriesSectionModel)
//            }
//
//        }
        
        if clubDetailsResponse.team.categories.count > 0 {
           
            for categories in 0..<clubDetailsResponse.team.categories.count {
                let categoriesSectionModel = TeamDetailSectionModel(.categories)
                categoriesSectionModel.categoriesDetails = clubDetailsResponse.team.categories[categories]
                print("categories ====> \(categories)")
                for players in 0..<clubDetailsResponse.team.categories[categories].players.count {
                    print("players ====> \(players)")
                    let categoriesCellModel = TeamDetailsTableCellModel(.categories)
                    print("categoriesCellModel.categoriesDetails.players[players] ====> \(clubDetailsResponse.team.categories[categories].players[players].name)")
                    categoriesCellModel.playersDetails = clubDetailsResponse.team.categories[categories].players[players]
                    categoriesSectionModel.cellModels.append(categoriesCellModel)
                }
                
                print("categoriesSectionModel ====> \(categoriesSectionModel)")
                sectionModels.append(categoriesSectionModel)
                
            }
        }
//        if clubDetailsResponse.team.categories.count > 0 {
//            let categoriesSectionModel = TeamDetailSectionModel(.categories)
//            let categoriesCellModel = TeamDetailsTableCellModel(.categories)
//            categoriesCellModel.teamDetails = clubDetailsResponse.team
//            categoriesSectionModel.cellModels.append(categoriesCellModel)
//                sectionModels.append(categoriesSectionModel)
//        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension TeamViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionModels.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel = sectionModels[section]
        let header = tableView.dequeueReusableCell(withIdentifier: sectionModel.identifier) as! TeamDetailsTableViewSection
        header.sectionModel = sectionModel
        return header
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 54.0
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionModels[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel = sectionModels[indexPath.section]
        let cellModel = sectionModel.cellModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier) as! TeamDetailTableViewCell
        cell.buttonReadMore?.addTarget(self, action: #selector(buttonAction(senderButton:)), for: .touchUpInside)
        cell.nationalityLocalised = "\(SJLocalisedString["key_Nationality"])"
        cell.dob = "\(SJLocalisedString["key_DateofBirth"])"
        cell.ReadMoreLocalised = "\(SJLocalisedString["key_ReadMore"])"
        cell.ReadLessLocalised = "\(SJLocalisedString["key_ReadLess"])"
        cell.cellModel = cellModel
        print("cell.nationalityLocalised ===> \(cell.nationalityLocalised)")
        cell.isSelectedReadMore = isSelectedReadMore
        if cellModel.cellType == .coach {
            if indexPath[1] % 2  == 0{
                    cell.backgroundColor = #colorLiteral(red: 0.337254902, green: 0.07450980392, blue: 0.2431372549, alpha: 1)
                    cell.viewInCell?.backgroundColor = #colorLiteral(red: 0.3355348706, green: 0.07450286299, blue: 0.2444770932, alpha: 1)
            }
        }
        if cellModel.cellType == .categories {
            if indexPath[1] % 2  == 0{
                    cell.backgroundColor = #colorLiteral(red: 0.431372549, green: 0.03921568627, blue: 0.3019607843, alpha: 1)
                    cell.viewInCell?.backgroundColor = #colorLiteral(red: 0.4328918457, green: 0.03798369318, blue: 0.3023207784, alpha: 1)
                   print("indexPath[1] ====> \(indexPath[1])")
            }
            else{
                cell.viewInCell?.backgroundColor = #colorLiteral(red: 0.3355348706, green: 0.07450286299, blue: 0.2444770932, alpha: 1)
                cell.backgroundColor = #colorLiteral(red: 0.3355348706, green: 0.07450286299, blue: 0.2444770932, alpha: 1)
            }
        }
        
        return cell
    }
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        let sectionModel = sectionModels[indexPath.section]
        let cellModel = sectionModel.cellModels[indexPath.row]
        if cellModel.cellType == .coach {
           height = 300
        }else {
            height = 54
        }
//        if cellModel.identifier == "clubDetails.tableCell.coach" {
//            return 200
//        }
        return height
    }*/
}
