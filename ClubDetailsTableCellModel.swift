//
//  ClubDetailsTableCellModel.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 16/08/22.
//

import UIKit

// Section Model

enum ClubDetailTableViewSectionTypes {
    case establised
    case title
    case history
}
class ClubDetailSectionModel {
    var identifier:String = "clubDetails.tableSection.title"
    var sectionType:ClubDetailTableViewSectionTypes = .title
    var cellModels:[ClubDetailsTableCellModel] = []
    
    init(_ sectionType:ClubDetailTableViewSectionTypes) {
        self.sectionType = sectionType
        switch sectionType {
        case .title:
            identifier = "clubDetails.tableSection.title"
        case .establised:
            identifier = "clubDetails.tableSection.establised"
        case .history:
            identifier = "clubDetails.tableSection.history"
        }
    }
}


// Cell Model
enum ClubDetailsTableViewCellTypes{
    case establised
    case title
    case history
}

class ClubDetailsTableCellModel {
    var identifier: String = "clubDetails.tableCell.title"
    var cellType:ClubDetailsTableViewCellTypes = .title
    var titleDetails: Titles = Titles([:])
    var establishedDetails: Clubb = Clubb([:])
    init(_ cellType:ClubDetailsTableViewCellTypes) {
        self.cellType = cellType
        switch cellType {
        case .title:
            identifier = "clubDetails.tableCell.title"
        case .establised:
            identifier = "clubDetails.tableCell.establised"
        case .history:
            identifier = "clubDetails.tableCell.history"
        }
    }
    
    func getTitle() -> String {
        return titleDetails.title
    }
    func getYear() -> String {
        return titleDetails.years
    }
    func getEstablished() -> String {
        return establishedDetails.established
    }
    func getNickname() -> String {
        return establishedDetails.nickname
    }
    func getPresident() -> String {
        return establishedDetails.president
    }
    func getHistory() -> String {
        return establishedDetails.history
    }

}
