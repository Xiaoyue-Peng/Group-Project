//
//  Filemodel.swift
//  Sync
//
//  Created by 纪东昂 on 24/03/2019.
//  Copyright © 2019 trying. All rights reserved.
//

import Foundation
import ObjectMapper

class Filemodel:Mappable {
    struct Variables {
        var fileinitidv:String = ""
    }
    
    var fileid:String?
    var fileinitid:String?
    var filename:String?
    var createuser:String?
    var createtime:String?
    var content:String?
    var updateuser:String?
    var updatetime:String?
    var preversion:String?
   
    init() {
    }
    required init?(map: Map) {
    }

    
    func mapping(map: Map) {
        fileid     <- map["fileid"]
        fileinitid <- map["fileinitid"]
        filename   <- map["filename"]
        createuser <- map["createuser"]
        createtime <- map["createtime"]
        content    <- map["content"]
        updateuser <- map["updateuser"]
        updatetime <- map["updatetime"]
        preversion <- map["preversion"]
    }
    
}
