//
//  ClubDetailCollectionViewCellModel.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 01/08/22.
//

import UIKit

enum LatestDetailsCollectionViewCellTypes{
    case collection
}
class LatestDetailCollectionViewCellModel: NSObject {
    
    var identifier: String = "clubDetails.collectionCell.latestNews"
    var cellType:LatestDetailsCollectionViewCellTypes = .collection
//    var clubDetails:ClubDetailsResponse = ClubDetailsResponse[]
    var clubDetails:LastNews = LastNews([:])
    var last_news:[LastNews] = []
    init(_ cellType:LatestDetailsCollectionViewCellTypes) {
        self.cellType = cellType
        switch cellType {
        case .collection:
            identifier = "clubDetails.collectionCell.latestNews"
        }
    }
    
    func getClubTitle() -> String {
        return clubDetails.title
    }
    func getClubImages() -> String {
        return clubDetails.images
    }
    func getClubNid() -> String {
        return clubDetails.nid
    }
    func getClubDate() -> String {
        return clubDetails.date
    }
}

