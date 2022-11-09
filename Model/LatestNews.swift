//
//  LatestNews.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 26/07/22.
//

import Foundation
class LatestNews {
    var fieldMediaImg: String
    var title: String
    init(title: String, fieldMediaImg: String) {
        self.fieldMediaImg = fieldMediaImg
        self.title = title
    }
}

//class LastNews {
//    var nid:String = ConstantString.k_EMPTY
//    var title:String = ConstantString.k_EMPTY
//    var date:String = ConstantString.k_EMPTY
//    var images:String = ConstantString.k_EMPTY
//    var turnament:String = ConstantString.k_EMPTY
//    var url:String = ConstantString.k_EMPTY
//
//    init(_ dict:[String: Any]) {
//        self.nid = dict.getString(key: "nid")
//        self.title = dict.getString(key: "title")
//        self.date = dict.getString(key: "date")
//        self.images = dict.getString(key: "images")
//        self.turnament = dict.getString(key: "turnament")
//        self.url = dict.getString(key: "url")
//    }
//}
//"nid": "15158",
//"title": "News Update for Alsad (Testing)",
//"date": "21 July 2022",
//"images": "",
//"turnament": "QNB Stars League",
//"url": "http://devqslwa.azurewebsites.net/en/news/news-update-alsad-testing?is_mobile=1"
