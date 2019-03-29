//
//  FileViewController.swift
//  Sync
//
//  Created by 纪东昂 on 24/03/2019.
//  Copyright © 2019 trying. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Just

class FileViewController: UITableViewController {
    
    let url="http://127.0.0.1:8080/Sync/Listfile"
    var para:Parameters=["createuser":Usermodel.Variables.username]
    var dataArray:Array<Filemodel> = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate=self
        self.tableView.dataSource=self
        loadTableViewData()
        self.tableView.reloadData()
    }
    
    func loadTableViewData() {

        var r=Just.get(url,params: para)
        print(r.text)
        dataArray=Mapper<Filemodel>().mapArray(JSONArray: r.json as! [[String : Any]])
        tableView.reloadData()
 
  }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        let showid=cell.contentView.viewWithTag(1) as! UILabel
        showid.text=dataArray[indexPath.row].fileinitid
        let showfile=cell.contentView.viewWithTag(2) as! UIButton
        showfile.setTitle(dataArray[indexPath.row].filename, for:.normal )
        let showcreator=cell.contentView.viewWithTag(3) as! UILabel
        showcreator.text=dataArray[indexPath.row].createuser
        let showlastupdate=cell.contentView.viewWithTag(4) as! UILabel
        showlastupdate.text=dataArray[indexPath.row].updatetime
//        showfile.addTarget(self, action:#selector(tapped(  _fileinitid: dataArray[indexPath.row].fileinitid ?? "").fileinitid), for:.touchUpInside)
        //tovalue(indexRow: indexPath.row)
        return cell
    }
//    func tovalue(indexRow:Int) -> Vmodel {
//        var fileid=dataArray[indexRow].fileid!
//        var fileinitid=dataArray[indexRow].fileinitid
//        var vm=Vmodel(fileid: fileid, fileinitid: fileinitid!)
//        return vm
//}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="edit" {
            var edit = segue.destination as! EditController
            var indexPath = tableView.indexPathForSelectedRow
            if let index = indexPath {
                let model:Filemodel = dataArray[indexPath!.row] as! Filemodel
                edit.fileid = model.fileid
                edit.fileinitid = model.fileinitid
            }
        }
    }
    
}


