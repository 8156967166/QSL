//
//  LatestTableViewCell.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 27/07/22.
//

import UIKit

class LatestTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    @IBOutlet weak var labelLatestNews: UILabel?
    @IBOutlet weak var collectionview: UICollectionView?
    @IBOutlet weak var contentViewInTable: UIView!
    @IBOutlet weak var labelQatar: UILabel?
    @IBOutlet weak var labelMediaGalleryDate: UILabel?
    var LatestNewsCollectionArray:[LastNews] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setLatest(LabelModel: LatestNewsTable) {
        self.collectionview?.delegate = self
        labelLatestNews?.text = LabelModel.title
        labelQatar?.text = LabelModel.title
        labelMediaGalleryDate?.text = LabelModel.title
        LatestNewsCollectionArray = LabelModel.collectionArray
        DispatchQueue.main.async {
            self.collectionview?.reloadData()
        }
    }
}

extension LatestTableViewCell {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LatestNewsCollectionArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestNews.cell", for: indexPath) as! LatestNewsCollectionViewCell
        cell.setModel(modelNews: LatestNewsCollectionArray[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
//        return CGSize(width: self.view.frame.size.width-80, height: 300.0)
        return CGSize(width: 299, height: 292)
    }
}
