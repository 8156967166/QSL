//
//  LatestNewsTable.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 27/07/22.
//

import Foundation
enum Functionality {
    case collection
    case fixture
    case mediaGallery
}
class LatestNewsTable {
    var title: String?
    var type: Functionality?
    var identifier: String = ""
    var collectionArray = [LastNews]()
    init(strtitle: String, functionality: Functionality) {
        self.title = strtitle
        self.type = functionality
        switch type {
        case .collection:
            identifier = "Collection.cell"
        case .fixture:
            identifier = "CellForFixture"
        case .mediaGallery:
            identifier = "media.cell"
        case .none:
            print("None")
        }
    }
}
class Fixtures {
    var nid:String = ConstantString.k_EMPTY
    var date:String = ConstantString.k_EMPTY
    var title:String = ConstantString.k_EMPTY
    var images:String = ConstantString.k_EMPTY
    var type:String = ConstantString.k_EMPTY
    init(_ dict:[String: Any]) {
        self.nid = dict.getString(key: "nid")
        self.title = dict.getString(key: "title")
        self.date = dict.getString(key: "date")
        self.images = dict.getString(key: "images")
        self.type = dict.getString(key: "type")
    }
}
