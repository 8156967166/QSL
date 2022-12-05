//
//  TeamDetailTableViewCell.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 17/08/22.
//

import UIKit
import SJFrameSwift
// Table Sections

class TeamDetailsTableViewSection: UITableViewCell {
    @IBOutlet weak var labelSectionHeader: UILabel?
    var sectionModel:TeamDetailSectionModel! {
        didSet {
            setSectionItemInTeam()
            //You can call any method after setting ClubDetailTableViewSectionModel
        }
    }
    func setSectionItemInTeam() {
        labelSectionHeader?.text = sectionModel.getCategoriesPosition()
    }
}

protocol PassToTeamDetailsViewController {
    func buttonAction(senderButton: UIButton)
    
}

// TableView Cell
class TeamDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var labelCoachName: UILabel?
    @IBOutlet weak var labelCoachNationality: UILabel?
    @IBOutlet weak var labelCoachDob: UILabel?
    @IBOutlet weak var labelCoachBio: UILabel?
    @IBOutlet weak var imageCoach: UIImageView?
    @IBOutlet weak var labelPlayersName: UILabel?
    @IBOutlet weak var labelPlayerJersey: UILabel?
    @IBOutlet weak var imagePlayer: UIImageView?
    @IBOutlet weak var buttonReadMore: UIButton?
    @IBOutlet weak var viewInCell: UIView?
    @IBOutlet weak var labelReadLess: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var nationalityLocalised = String()
    var dob: String = String()
    var ReadMoreLocalised = String()
    var ReadLessLocalised = String()
    var delegate: PassToTeamDetailsViewController?
    var cellModel:TeamDetailsTableCellModel! {
        didSet {
            setCellItemInTeam()
        }
    }
    
    
    func setCellItemInTeam() {
        let nationality = cellModel.getCoachNationality()
        if nationality.isEmpty {
            labelCoachNationality?.text = ""
        }
        else {
            labelCoachNationality?.text = "\(nationalityLocalised): \(cellModel.getCoachNationality())"
//            labelCoachNationality?.text = "Nationality: \(cellModel.getCoachNationality())"
        }
//        labelReadLess?.text = "Read More"
        labelReadLess?.text = "\(ReadMoreLocalised)"
        labelCoachName?.text = cellModel.getCoachName()
        labelCoachDob?.text = "\(dob): \(cellModel.getCoachDateofBirth())"
//        labelCoachDob?.text = "Date of Birth: \(cellModel.getCoachDateofBirth())"
        labelCoachBio?.text = cellModel.getCoachBio()
        labelCoachBio?.numberOfLines = 3
        labelCoachBio?.isUserInteractionEnabled = true
        self.imageCoach?.downloadThumpImage(url: cellModel.getCoachPhoto())
        labelPlayersName?.text = cellModel.getCategoriesPlayersName()
        labelPlayerJersey?.text = cellModel.getCategoriesPlayersJersey()
        self.imagePlayer?.downloadThumpImage(url: cellModel.getCategoriesPlayersPhoto())
    }
    var isSelectedReadMore: Bool? {
        didSet {
            if isSelectedReadMore == false {
//                labelReadLess?.text = "Read Less"
                labelReadLess?.text = "\(ReadLessLocalised)"
                labelCoachBio?.numberOfLines = 0
            }
            else {
                labelCoachBio?.numberOfLines = 3
            }
        }
    }
    
    func setCellViewColor() {
        
    }
}
