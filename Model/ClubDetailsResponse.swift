//
//  ClubDetailsResponse.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 30/07/22.


import UIKit

class ClubDetailsResponse: NSObject {
    
    var club_id:String = ConstantString.k_EMPTY
    var club_name:String = ConstantString.k_EMPTY
    var logo:String = ConstantString.k_EMPTY
    var home_ground:String = ConstantString.k_EMPTY
    var buy_tickets:String = ConstantString.k_EMPTY
    var main_sponsor:String = ConstantString.k_EMPTY
    var club_website_link:String = ConstantString.k_EMPTY
    var is_favorite:Bool = false
    var is_following:Bool = false
    
    var latest:Latest = Latest([:])
    var club:Clubb = Clubb([:])
    var team: Team = Team([:])
    var contact:Contact = Contact([:])
    
    init(_ dict:[String: Any]) {
        self.club_id = dict.getString(key: "club_id")
        self.club_name = dict.getString(key: "club_name")
        self.logo = dict.getString(key: "logo")
        self.home_ground = dict.getString(key: "home_ground")
        self.buy_tickets = dict.getString(key: "buy_tickets")
        self.main_sponsor = dict.getString(key: "main_sponsor")
        self.club_website_link = dict.getString(key: "club_website_link")
        self.is_favorite = dict.getBoolFromDict(key: "is_favorite")
        self.is_following = dict.getBoolFromDict(key: "is_following")
        self.latest = Latest(dict.getDict(key: "latest"))
        self.club = Clubb(dict.getDict(key: "club"))
        self.team = Team(dict.getDict(key: "team"))
        self.contact = Contact(dict.getDict(key: "contact"))
    }
}

class Latest {
    
    var last_news:[LastNews] = []
    var media_gallery:[MediaGallery] = []
    var fixtures:[Fixture] = []
    var results:[Result] = []
    
    init(_ dict:[String: Any]) {
        
        if let last_newsArray = dict["last_news"] as? [[String:Any]] {
            for last_newsObjectAtIndex in last_newsArray {
                let last_newsModel = LastNews(last_newsObjectAtIndex)
                last_news.append(last_newsModel)
            }
        }
        if let media_galleryArray = dict["media_gallery"] as? [[String: Any]] {
            for media_galleryObjectAtIndex in media_galleryArray {
                let media_galleryModel = MediaGallery(media_galleryObjectAtIndex)
                media_gallery.append(media_galleryModel)
            }
        }
        if let fixturesArray = dict["fixtures"] as? [[String: Any]] {
            for fixturesObjectAtIndex in fixturesArray {
                let fixturesModel = Fixture(fixturesObjectAtIndex)
                fixtures.append(fixturesModel)
            }
        }
        if let resultsArray = dict["results"] as? [[String: Any]] {
            for resultsObjectAtIndex in resultsArray {
                let resultsModel = Result(resultsObjectAtIndex)
                results.append(resultsModel)
            }
        }
        
//        let latestNewsArray:[[String:Any]] = dict["last_news"] as? [[String:Any]] ?? []
//        for last_newsObjectAtIndex in last_newsArray {
//            let last_newsModel = LastNews(last_newsObjectAtIndex)
//            last_news.append(last_newsModel)
//        }
    }
}


class LastNews {
    
    var nid:String = ConstantString.k_EMPTY
    var title:String = ConstantString.k_EMPTY
    var date:String = ConstantString.k_EMPTY
    var images:String = ConstantString.k_EMPTY
    var turnament:String = ConstantString.k_EMPTY
    var url:String = ConstantString.k_EMPTY

    
    init(_ dict:[String: Any]) {
        self.nid = dict.getIntAsStringFromDict(key: "nid")
        self.title = dict.getString(key: "title")
        self.date = dict.getString(key: "date")
        self.images = dict.getString(key: "images")
        self.turnament = dict.getString(key: "turnament")
        self.url = dict.getString(key: "url")
    }
}

class MediaGallery {
    var nid:String = ConstantString.k_EMPTY
    var date:String = ConstantString.k_EMPTY
    var title:String = ConstantString.k_EMPTY
    var image:String = ConstantString.k_EMPTY
    var type:String = ConstantString.k_EMPTY

    init(_ dict:[String: Any]) {
        self.nid = dict.getIntAsStringFromDict(key: "nid")
        self.date = dict.getString(key: "date")
        self.title = dict.getString(key: "title")
        self.image = dict.getString(key: "image")
        self.type = dict.getString(key: "type")
    }
}

class Fixture {
    var home_team:HomeTeamFixtures = HomeTeamFixtures([:])
    var away_team:AwayTeamFixtures = AwayTeamFixtures([:])
    var match_date:String = ConstantString.k_EMPTY
    var venue:String = ConstantString.k_EMPTY
    var match_number:String = ConstantString.k_EMPTY
    var competetion:String = ConstantString.k_EMPTY
    var round:String = ConstantString.k_EMPTY
    var id:String = ConstantString.k_EMPTY
    var buy_tickets:String = ConstantString.k_EMPTY
    var tbd_value:String = ConstantString.k_EMPTY

    init(_ dict:[String: Any]) {
        self.home_team = HomeTeamFixtures(dict.getDict(key: "home_team"))
        self.away_team = AwayTeamFixtures(dict.getDict(key: "away_team"))
        self.match_date = dict.getIntAsStringFromDict(key: "match_date")
        self.venue = dict.getString(key: "venue")
        self.match_number = dict.getString(key: "match_number")
        self.competetion = dict.getString(key: "competetion")
        self.round = dict.getString(key: "round")
        self.id = dict.getString(key: "id")
        self.buy_tickets = dict.getString(key: "buy_tickets")
        self.tbd_value = dict.getString(key: "tbd_value")
    }
}


class HomeTeamFixtures {
    var id:String = ConstantString.k_EMPTY
    var name:String = ConstantString.k_EMPTY
    var logo:String = ConstantString.k_EMPTY
    var is_favourite_team:String = ConstantString.k_EMPTY
    
    init(_ dict:[String: Any]) {
        self.id = dict.getIntAsStringFromDict(key: "id")
        self.name = dict.getIntAsStringFromDict(key: "name")
        self.logo = dict.getIntAsStringFromDict(key: "logo")
        self.is_favourite_team = dict.getIntAsStringFromDict(key: "is_favourite_team")
    }
}

class AwayTeamFixtures {
    var id:String = ConstantString.k_EMPTY
    var name:String = ConstantString.k_EMPTY
    var logo:String = ConstantString.k_EMPTY
    var is_favourite_team:String = ConstantString.k_EMPTY
    
    init(_ dict:[String: Any]) {
        self.id = dict.getIntAsStringFromDict(key: "id")
        self.name = dict.getIntAsStringFromDict(key: "name")
        self.logo = dict.getIntAsStringFromDict(key: "logo")
        self.is_favourite_team = dict.getIntAsStringFromDict(key: "is_favourite_team")
    }
}

class Result {
    var home_team:HomeTeamResults = HomeTeamResults([:])
    var away_team:AwayTeamResults = AwayTeamResults([:])
    var match_date:String = ConstantString.k_EMPTY
    var venue:String = ConstantString.k_EMPTY
    var match_number:String = ConstantString.k_EMPTY
    var competetion:String = ConstantString.k_EMPTY
    var round:String = ConstantString.k_EMPTY
    var id:String = ConstantString.k_EMPTY
    var media_gallery:String = ConstantString.k_EMPTY
    var match_report:String = ConstantString.k_EMPTY
    var tbd_value:String = ConstantString.k_EMPTY

    init(_ dict:[String: Any]) {
        self.home_team = HomeTeamResults(dict.getDict(key: "home_team"))
        self.away_team = AwayTeamResults(dict.getDict(key: "away_team"))
        self.match_date = dict.getIntAsStringFromDict(key: "match_date")
        self.venue = dict.getString(key: "venue")
        self.match_number = dict.getString(key: "match_number")
        self.competetion = dict.getString(key: "competetion")
        self.round = dict.getString(key: "round")
        self.id = dict.getString(key: "id")
        self.media_gallery = dict.getString(key: "media_gallery")
        self.match_report = dict.getString(key: "match_report")
        self.tbd_value = dict.getString(key: "tbd_value")
    }
}

class HomeTeamResults {
    var id:String = ConstantString.k_EMPTY
    var name:String = ConstantString.k_EMPTY
    var logo:String = ConstantString.k_EMPTY
    var goals_scored:String = ConstantString.k_EMPTY
    var is_favourite_team:String = ConstantString.k_EMPTY
    
    init(_ dict:[String: Any]) {
        self.id = dict.getIntAsStringFromDict(key: "id")
        self.name = dict.getIntAsStringFromDict(key: "name")
        self.logo = dict.getIntAsStringFromDict(key: "logo")
        self.goals_scored = dict.getIntAsStringFromDict(key: "goals_scored")
        self.is_favourite_team = dict.getIntAsStringFromDict(key: "is_favourite_team")
    }
}

class AwayTeamResults {
    var id:String = ConstantString.k_EMPTY
    var name:String = ConstantString.k_EMPTY
    var logo:String = ConstantString.k_EMPTY
    var goals_scored:String = ConstantString.k_EMPTY
    var is_favourite_team:String = ConstantString.k_EMPTY
    
    init(_ dict:[String: Any]) {
        self.id = dict.getIntAsStringFromDict(key: "id")
        self.name = dict.getIntAsStringFromDict(key: "name")
        self.logo = dict.getIntAsStringFromDict(key: "logo")
        self.goals_scored = dict.getIntAsStringFromDict(key: "goals_scored")
        self.is_favourite_team = dict.getIntAsStringFromDict(key: "is_favourite_team")
    }
}


class Clubb {
    
    var established:String = ConstantString.k_EMPTY
    var nickname:String = ConstantString.k_EMPTY
    var president:String = ConstantString.k_EMPTY
    var history:String = ConstantString.k_EMPTY
    var titles:[Titles] = []
    
    init(_ dict:[String: Any]) {
        self.established = dict.getIntAsStringFromDict(key: "established")
        self.nickname = dict.getIntAsStringFromDict(key: "nickname")
        self.president = dict.getIntAsStringFromDict(key: "president")
        self.history = dict.getIntAsStringFromDict(key: "history")
        
        if let titleArray = dict["titles"] as? [[String:Any]] {
            for titleObjectAtIndex in titleArray {
                let titleModel = Titles(titleObjectAtIndex)
                titles.append(titleModel)
            }
        }
    }
}


class Titles {
    var title:String = ConstantString.k_EMPTY
    var title_wins:String = ConstantString.k_EMPTY
    var years:String = ConstantString.k_EMPTY
    
    init(_ dict:[String: Any]) {
        self.title = dict.getIntAsStringFromDict(key: "title")
        self.title_wins = dict.getString(key: "title_wins")
        self.years = dict.getString(key: "years")
    }
}

class Team {
    var coach: Coach = Coach([:])
    var categories:[Categories] = []

    init(_ dict:[String: Any]) {
        self.coach = Coach(dict.getDict(key: "coach"))
        
        if let categoriesArray = dict["categories"] as? [[String: Any]] {
            for categoriesObjectAtIndex in categoriesArray {
                let categoriesModel = Categories(categoriesObjectAtIndex)
                categories.append(categoriesModel)
            }
        }
    }
}

class Coach {
    var id:String = ConstantString.k_EMPTY
    var name:String = ConstantString.k_EMPTY
    var photo:String = ConstantString.k_EMPTY
    var dob:String = ConstantString.k_EMPTY
    var nationality:String = ConstantString.k_EMPTY
    var bio:String = ConstantString.k_EMPTY
    
    init(_ dict:[String: Any]) {
        self.id = dict.getIntAsStringFromDict(key: "id")
        self.name = dict.getIntAsStringFromDict(key: "name")
        self.photo = dict.getIntAsStringFromDict(key: "photo")
        self.dob = dict.getIntAsStringFromDict(key: "dob")
        self.nationality = dict.getIntAsStringFromDict(key: "nationality")
        self.bio = dict.getIntAsStringFromDict(key: "bio")
    }
}

class Categories {
    var position:String = ConstantString.k_EMPTY
    var players:[Players] = []
    
    init(_ dict:[String: Any]) {
        self.position = dict.getIntAsStringFromDict(key: "position")
        
        if let playersArray = dict["players"] as? [[String: Any]] {
            for playersObjectAtIndex in playersArray {
                let playersModel = Players(playersObjectAtIndex)
                players.append(playersModel)
            }
        }
    }
}
    
class Players {
    var id:String = ConstantString.k_EMPTY
    var name:String = ConstantString.k_EMPTY
    var photo:String = ConstantString.k_EMPTY
    var jersey:String = ConstantString.k_EMPTY
    
    init(_ dict:[String: Any]) {
        self.id = dict.getIntAsStringFromDict(key: "id")
        self.name = dict.getIntAsStringFromDict(key: "name")
        self.photo = dict.getIntAsStringFromDict(key: "photo")
        self.jersey = dict.getIntAsStringFromDict(key: "jersey")
    }
}

class Contact {
    var website:String = ConstantString.k_EMPTY
    var phone:String = ConstantString.k_EMPTY
    var email:String = ConstantString.k_EMPTY
    var location:Location = Location([:])
    var fax:String = ConstantString.k_EMPTY
    var socialMedia:[SocialMedia] = []
    
    init(_ dict:[String: Any]) {
        self.website = dict.getIntAsStringFromDict(key: "website")
        self.phone = dict.getIntAsStringFromDict(key: "phone")
        self.email = dict.getIntAsStringFromDict(key: "email")
        self.location = Location(dict.getDict(key: "location"))
        self.fax = dict.getIntAsStringFromDict(key: "fax")
        
        if let socialMediaArray = dict["social_media"] as? [[String: Any]] {
            for socialMediaObjectAtIndex in socialMediaArray {
                let socialMediaModel = SocialMedia(socialMediaObjectAtIndex)
                socialMedia.append(socialMediaModel)
            }
        }
    }
}

class Location {
    var name:String = ConstantString.k_EMPTY
    var lat:String = ConstantString.k_EMPTY
    var long:String = ConstantString.k_EMPTY
    
    init(_ dict:[String: Any]) {
        self.name = dict.getIntAsStringFromDict(key: "name")
        self.lat = dict.getIntAsStringFromDict(key: "lat")
        self.long = dict.getIntAsStringFromDict(key: "long")
        
    }
}

class SocialMedia {
    var title:String = ConstantString.k_EMPTY
    var url:String = ConstantString.k_EMPTY
    
    init(_ dict:[String: Any]) {
        self.title = dict.getIntAsStringFromDict(key: "title")
        self.url = dict.getIntAsStringFromDict(key: "url")
    }
}
