//
//  SectionInTable.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 27/07/22.
//

import Foundation
enum Functionalities {
    case title
    case button
}
class LatestSection {
    var title: String?
    var type: Functionalities?
    var clubDetails: [LatestNewsTable]
    var identifier: String = ""
    init(title: String, type: Functionalities ,clubDetails: [LatestNewsTable]) {
        self.title = title
        self.clubDetails = clubDetails
        self.type = type
        switch type {
            
        case .title:
            identifier = "header.cell"
        case .button:
            identifier = "button.cell"
        }
    }
}
