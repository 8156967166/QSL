//
//  TeamDetailsTableCellModel.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 17/08/22.
//

import UIKit
// TableView Section

enum TeamDetailTableViewSectionTypes {
    case coach
    case categories
}
class TeamDetailSectionModel {
    var identifier:String = "clubDetails.tableSection.coach"
    var sectionType:TeamDetailTableViewSectionTypes = .coach
    var categoriesDetails:Categories = Categories([:])
    var cellModels:[TeamDetailsTableCellModel] = []
    
    init(_ sectionType:TeamDetailTableViewSectionTypes) {
        self.sectionType = sectionType
        switch sectionType {
        case .coach:
            identifier = "clubDetails.tableSection.coach"
        case .categories:
            identifier = "clubDetails.tableSection.categories"
        }
    }
    func getCategoriesPosition() -> String {
        print("categoriesDetails.position ===> \(categoriesDetails.position)")
        return categoriesDetails.position
    }
}

// TableView Cell

enum TeamDetailsTableViewCellTypes{
    case coach
    case categories
}

class TeamDetailsTableCellModel {
    var identifier: String = "clubDetails.tableCell.coach"
    var cellType:TeamDetailsTableViewCellTypes = .coach
    var teamDetails: Team = Team([:])
//    var categoriesDetails:Categories = Categories([:])
    var playersDetails:Players = Players([:])
    init(_ cellType:TeamDetailsTableViewCellTypes) {
        self.cellType = cellType
        switch cellType {
        case .coach:
            identifier = "clubDetails.tableCell.coach"
        case .categories:
            identifier = "clubDetails.tableCell.categories"
        }
    }
    func getCoachName() -> String {
        return teamDetails.coach.name
    }
    func getCoachNationality() -> String {
        return teamDetails.coach.nationality
    }
    func getCoachDateofBirth() -> String {
        return teamDetails.coach.dob
    }
    func getCoachPhoto() -> String {
        return teamDetails.coach.photo
    }
    func getCoachBio() -> String {
        return teamDetails.coach.bio
    }
    
    func getCategoriesPlayersPhoto() -> String {
        return playersDetails.photo
    }
    func getCategoriesPlayersName() -> String {
        print("playersDetails.name ====> \(playersDetails.name)")
        return playersDetails.name
    }
    func getCategoriesPlayersJersey() -> String {
        return playersDetails.jersey
    }
}
