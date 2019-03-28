//
//  Filetablecell.swift
//  Sync
//
//  Created by 纪东昂 on 27/03/2019.
//  Copyright © 2019 trying. All rights reserved.
//

import Foundation
import UIKit
class Filetablecell: UITableViewCell {
    
      var fileid: UILabel!
      var filename: UILabel!
//    @IBOutlet weak var creator: UILabel!
//    @IBOutlet weak var lastupdate: UILabel!
//    @IBOutlet weak var showid: UILabel!
//    @IBOutlet weak var showcreator: UILabel!
//    @IBOutlet weak var showlastupdate: UILabel!
//    @IBAction func showfile(_ sender: Any) {
//    }
//    @IBAction func showauthority(_ sender: Any) {
//    }
//    @IBAction func deletefile(_ sender: Any) {
//    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        fileid = UILabel(frame: CGRect(x: 74, y: 18, width: 70, height: 15))
        fileid.textColor = UIColor.black
        fileid.font = UIFont.boldSystemFont(ofSize: 15)
        fileid.textAlignment = .left
        
        contentView.addSubview(fileid)



    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    } 


}
