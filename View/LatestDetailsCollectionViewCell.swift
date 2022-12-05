//
//  ClubDetailsCollectionViewCell.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 01/08/22.


import UIKit

//MARK: - Collection cell
class LatestDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageLatestNewsCollection: UIImageView!
    @IBOutlet weak var labeltext: UILabel!
    @IBOutlet weak var viewInCell: UIView!
    @IBOutlet weak var labelDate: UILabel!
    
    var cellModel: LatestDetailCollectionViewCellModel! {
        didSet {
            setGradient()
            setCellItem()
        }
    }
//    func setModel(modelNews: LastNews) {
//        labeltext.text = modelNews.title
//        self.imageLatestNewsCollection.downloadThumpImage(url: modelNews.images)
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setCellItem() {
        labeltext.text = cellModel.getClubTitle()
        self.imageLatestNewsCollection.downloadThumpImage(url: cellModel.getClubImages())
        labelDate.text = cellModel.getClubDate()
    }
//    func setGradient() {
//            let colorTop = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
//            let colorBottom = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 1.0).cgColor
//            let gradientLayer = CAGradientLayer()
//            gradientLayer.colors = [colorTop, colorBottom]
//            gradientLayer.locations = [0.0, 1.0]
//            gradientLayer.frame = self.viewInCell?.bounds ?? CGRect.null
//            self.viewInCell?.layer.insertSublayer(gradientLayer, at:0)
//    }
    func setGradient() {
        let gradientLayer = CAGradientLayer()
        let rightColor = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
        let leftColor = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [rightColor, leftColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.viewInCell?.bounds ?? CGRect.null
        self.viewInCell?.layer.insertSublayer(gradientLayer, at:0)
    }
}
