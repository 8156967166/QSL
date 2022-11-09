//
//  ClubsListTableViewCellModel.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 30/07/22.
//

import UIKit

//MARK: - Section Model
enum LatestDetailTableViewSectionTypes {
    case latestNews
    case fixturesAndResults
    case mediaGallery
}
class LatestDetailTableViewSectionModel {
    var identifier:String = "clubDetails.tableSection.latestNews"
    var sectionType:LatestDetailTableViewSectionTypes = .latestNews
    var cellModels:[LatestDetailTableViewCellModel] = [] //1,no. of fixtures/ no. of results/ o. of media
//    var latestDetails:Latest = Latest([:])
    init(_ sectionType:LatestDetailTableViewSectionTypes) {
        self.sectionType = sectionType
        switch sectionType {
        case .latestNews:
            identifier = "clubDetails.tableSection.latestNews"
        case .fixturesAndResults:
            identifier = "clubDetails.tableSection.fixturesAndResults"
        case .mediaGallery:
            identifier = "clubDetails.tableSection.mediaGallery"
        }
    }
}

//MARK: - Cell Model
enum LatestDetailsTableViewCellTypes{
    case latestNews
    case fixtures
    case results
    case mediaGallery
}
class LatestDetailTableViewCellModel {
    var identifier: String = "clubDetails.tableCell.latestNews"
    var cellType:LatestDetailsTableViewCellTypes = .latestNews
    var cellModels:[LatestDetailCollectionViewCellModel] = []
    var last_news:[LastNews] = []
    var news: LastNews = LastNews([:])
    var media_gallery:[MediaGallery] = []
    var fixtures:[Fixture] = []
    var results:[Result] = []
    var clubMediaGalleryDetails:MediaGallery = MediaGallery([:])
    var clubFixturesDetails:Fixture = Fixture([:])
    var clubResultsDetails:Result = Result([:])
    
    init(_ cellType:LatestDetailsTableViewCellTypes) {
        self.cellType = cellType
        switch cellType {
        case .latestNews:
            identifier = "clubDetails.tableCell.latestNews"
        case .fixtures:
            identifier = "clubDetails.tableCell.fixtures"
        case .results:
            identifier = "clubDetails.tableCell.results"
        case .mediaGallery:
            identifier = "clubDetails.tableCell.mediaGallery"
        }
    }

    func getLastNewsList() ->[LastNews] {
        self.last_news
    }
    func getFixturesList() ->[Fixture] {
        self.fixtures
    }
    func getResultList() ->[Result] {
        self.results
    }
    func getFixtureHome_TeamName() -> String {
        return clubFixturesDetails.home_team.name
    }
    func getFixtureHome_TeamLogo() -> String {
        return clubFixturesDetails.home_team.logo
    }
    func getFixtureAway_TeamName() -> String {
        return clubFixturesDetails.away_team.name
    }
    func getFixtureAway_TeamLogo() -> String {
        return clubFixturesDetails.away_team.logo
    }
//    func getFixtureTime() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//        guard let result = dateFormatter.date(from: clubFixturesDetails.match_date) else
//        {
//            return ""
//        }
//        dateFormatter.dateFormat = "HH:mm"
//        let strTime = dateFormatter.string(from: result)
//        return strTime
//    }
    func getFixtureCompetetion() -> String {
        return clubFixturesDetails.competetion
    }
    func getFixtureRound() -> String {
        return clubFixturesDetails.round
    }
    func getFixtureVenue() -> String {
        print("clubFixturesDetails.venue =====> \(clubFixturesDetails.venue)")
        return clubFixturesDetails.venue
    }
    func getResultHome_TeamName() -> String {
        return clubResultsDetails.home_team.name
    }
    func getResultHome_TeamLogo() -> String {
        return clubResultsDetails.home_team.logo
    }
    func getResultAway_TeamName() -> String {
        return clubResultsDetails.away_team.name
    }
    func getResultAway_TeamLogo() -> String {
        return clubResultsDetails.away_team.logo
    }
    func getResultHome_TeamGoal() -> String {
        return clubResultsDetails.home_team.goals_scored
    }
    func getResultAway_TeamGoal() -> String {
        return clubResultsDetails.away_team.goals_scored
    }
    func getResultTime() -> String {
        return clubResultsDetails.match_date
    }
    func getResultCompetetion() -> String {
        return clubResultsDetails.competetion
    }
    func getResultRound() -> String {
        return clubResultsDetails.round
    }
    func getResultVenue() -> String {
        return clubResultsDetails.venue
    }
    func getMediaGalleryList() ->[MediaGallery] {
        self.media_gallery
    }
    func getMediaGalleryNid() -> String {
        return clubMediaGalleryDetails.nid
    }
    func getMediaGalleryTitle() -> String {
        return clubMediaGalleryDetails.title
    }
    func getMediaGalleryImage() -> String {
        return clubMediaGalleryDetails.image
    }
    func getMediaGalleryDate() -> String {
        return clubMediaGalleryDetails.date
    }
    func getMediaGalleryType() -> String {
//        for (item) in clubMediaGalleryDetails.type.enumerated() {
//            print("item element ===> \(item)")
//        }
//        print("clubMediaGalleryDetails.type ====> \(clubMediaGalleryDetails.type)")
        return clubMediaGalleryDetails.type
    }
}
