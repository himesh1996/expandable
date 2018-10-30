//
//  cellTblExpandable.swift
//  Expandable
//
//  Created by Himesh Soni on 06/09/18.
//  Copyright © 2018 Himesh Soni. All rights reserved.
//

import UIKit

class cellTblExpandable: UITableViewCell {

    @IBOutlet weak var btnExpandCell: UIButton!
    @IBOutlet weak var tblExpanded: UITableView!
    
    var blockBtnExpandAction : (()->())!
    var arrSubMenu : [Int] = []{
        didSet{
            tblExpanded.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func btnExpandCellAction(_ sender: UIButton) {
       blockBtnExpandAction()
    }
}

extension cellTblExpandable : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "subMenuCell")
        
        let aLblTitle = aCell?.viewWithTag(101) as! UILabel
        aLblTitle.text = "\(arrSubMenu[indexPath.row])"
        
        return aCell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSubMenu.count
    }
}

extension cellTblExpandable : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
