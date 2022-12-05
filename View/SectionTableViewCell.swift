//
//  SectionTableViewCell.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 27/07/22.
//

import UIKit
protocol PassToSelectedClubViewController {
    func buttonAction()
}
class SectionTableViewCell: UITableViewCell {
    @IBOutlet weak var labelHeader: UILabel?
    @IBOutlet weak var viewFixtures: UIView?
    @IBOutlet weak var viewResults: UIView?
    @IBOutlet weak var labelFixtures: UILabel?
    @IBOutlet weak var labelResults: UILabel?
    var delegate: PassToSelectedClubViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setSectionLatest(LatestSection: LatestSection) {
        viewResults?.isHidden = true
        labelHeader?.text = LatestSection.title
        labelFixtures?.text = LatestSection.title
    }
    @IBAction func buttonActionFixtures(sender: UIButton) {
        delegate?.buttonAction()
        print("Fixture button clicked")
        viewFixtures?.isHidden = false
        viewResults?.isHidden = true
        labelFixtures?.textColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
        labelResults?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    @IBAction func buttonActionResults(sender: UIButton) {
        print("Results button clicked")
        viewResults?.isHidden = false
        viewFixtures?.isHidden = true
        labelResults?.textColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
        labelFixtures?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    }
}
