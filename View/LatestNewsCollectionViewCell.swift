//
//  LatestNewsCollectionViewCell.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 26/07/22.
//

import UIKit
//
class LatestNewsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageLatestNewsCollection: UIImageView!
    @IBOutlet weak var labeltext: UILabel!
    @IBOutlet weak var viewInCell: UIView!

    func setModel(modelNews: LastNews) {

        labeltext.text = modelNews.title
//        imageLatestNewsCollection.image = UIImage(named: modelNews.fieldMediaImg)
        self.imageLatestNewsCollection.downloadThumpImage(url: modelNews.images)

    }
}
