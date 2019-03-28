//
//  CompareController.swift
//  Sync
//
//  Created by 纪东昂 on 28/03/2019.
//  Copyright © 2019 trying. All rights reserved.
//

import Foundation
import UIKit
import Just
import ObjectMapper
import Alamofire
class CompareController: ViewController,UITextViewDelegate {
    
    @IBOutlet weak var otheruser: UITextView!
    @IBOutlet weak var mine: UITextView!
    
    var fileid:String?
    var fileinitid:String?
    let url3 = "http://127.0.0.1:8080/Sync/Getfile"
    var dataArray3:Array<Filemodel> = []
    var mdcontent=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otheruser.delegate = self
        otheruser.font = UIFont.systemFont(ofSize: 28);
        otheruser.text=dataArray3[0].content
        otheruser.isEditable = false
        mine.delegate = self
        mine.font = UIFont.systemFont(ofSize: 28);
        mine.text=dataArray3[0].content
        mine.isEditable = true
    }
    func loadTableViewData() {
        var para:Parameters=["fileinitid":fileinitid!]
        var r=Just.get(url3,params: para)
        print(r.text)
        dataArray3=Mapper<Filemodel>().mapArray(JSONArray: r.json as! [[String : Any]])
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        //开始编辑时候出发
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        //结束编辑时候出发
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true //如果返回false，文本视图不能编辑
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true //如果返回false，表示编辑结束之后，文本视图不可再编辑
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        //文本视图内容改变时，触发本方法,如果是回车符号，则textView释放第一响应值，返回false
        if (text ==  "\n") {
            textView.resignFirstResponder()
            return false;
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        mdcontent=mine.text
        print(mdcontent)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        //文本视图 改变选择内容，触发本代理方法
    }
    
}
