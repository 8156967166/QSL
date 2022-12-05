//
//  ClubDetailsTableViewCell.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 16/08/22.
//

import UIKit

// Table Sections

class ClubDetailsTableViewSection: UITableViewCell {
    
    var sectionModel:ClubDetailSectionModel! {
        didSet {
            //You can call any method after setting ClubDetailTableViewSectionModel
        }
    }
}

// Table Cell

class ClubDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel?
    @IBOutlet weak var labelYear: UILabel?
    @IBOutlet weak var labelEstablishedYear: UILabel?
    @IBOutlet weak var labelNickname: UILabel?
    @IBOutlet weak var labelPresident: UILabel?
    @IBOutlet weak var labelHistory: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var cellModel:ClubDetailsTableCellModel! {
        didSet {
            setCellItemInClub()
            print(" title ===> \(cellModel.titleDetails.title)")
        }
    }

    func setCellItemInClub() {
        labelTitle?.text = cellModel.getTitle()
        labelYear?.text = cellModel.getYear()
        labelEstablishedYear?.text = cellModel.getEstablished()
        labelNickname?.text = cellModel.getNickname()
        labelPresident?.text = cellModel.getPresident()
        labelHistory?.text = cellModel.getHistory()
    }
    
}
