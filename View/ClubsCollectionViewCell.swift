//
//  ClubsCollectionViewCell.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 21/07/22.
//

import UIKit

class ClubsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var imageFieldMedia: UIImageView!
    
    func setModel(setClubsModel: Club) {
        self.labelname.text = setClubsModel.title
//        self.imageFieldMedia.image = UIImage(named: setClubsModel.field_media_image)
        self.imageFieldMedia.downloadThumpImage(url: setClubsModel.field_media_image)
    }
    
}
