//
//  clubs.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 21/07/22.
//

import Foundation

class Clubs {
    
    var labelName: String
    var fieldMediaImg: String 
    init(labelName: String, fieldMediaImg: String) {
        self.labelName = labelName
        self.fieldMediaImg = fieldMediaImg
    }
}

class Club {
    var nid:String = ConstantString.k_EMPTY
    var title:String = ConstantString.k_EMPTY
    var field_media_image:String = ConstantString.k_EMPTY
    var notification_status:String = ConstantString.k_EMPTY

    init(_ dict:[String: Any]) {
        self.nid = dict.getString(key: "nid")
        self.title = dict.getString(key: "title")
        self.field_media_image = dict.getString(key: "field_media_image")
        self.notification_status = dict.getString(key: "notification_status")
    }
}
