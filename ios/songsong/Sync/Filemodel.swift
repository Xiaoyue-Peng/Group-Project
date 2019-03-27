//
//  Filemodel.swift
//  Sync
//
//  Created by 纪东昂 on 24/03/2019.
//  Copyright © 2019 trying. All rights reserved.
//

import Foundation

class Filemodel:NSObject {
    
    var fileid = ""
    var fileinitid = ""
    var filename = ""
    var createuser = ""
    var createtime = ""
    var content = ""
    var updateuser = ""
    var updatetime = ""
    var preversion = ""
   
    init(fileid:String,fileinitid:String,filename:String,createuser:String,createtime:String,content:String,updateuser:String,updatetime:String,preversion:String) {
        self.fileid = fileid
        self.fileinitid = fileinitid
        self.filename = filename
        self.createuser = createuser
        self.createtime=createtime
        self.content=content
        self.updateuser=updateuser
        self.updatetime=updatetime
        self.preversion=preversion
        
        
        
    }
    override init() {
        super.init()
    }
    
}
