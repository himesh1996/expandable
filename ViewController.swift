//
//  ViewController.swift
//  Expandable
//
//  Created by Himesh Soni on 06/09/18.
//  Copyright © 2018 Himesh Soni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblExpandableDemo: UITableView!
    
    var arrHeaderTitle : [String] = []
    var arrExpandedIndex : [Int] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        arrHeaderTitle = ["1-10", "11-20", "21-30", "31-40", "41-50", "51-60", "61-70", "71-80", "81-90", "91-100"]
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTblHeader") as! cellTblExpandable
        
        let aTitle = arrHeaderTitle[indexPath.row]
        cell.btnExpandCell.setTitle(arrHeaderTitle[indexPath.row], for: .normal)
        
        let aArrValues = aTitle.components(separatedBy: "-")
        let aIntStart = Int(aArrValues.first ?? "0")!
        let aIntEnd = Int(aArrValues.last ?? "10")!
        
        cell.arrSubMenu = Array(aIntStart...aIntEnd)
        
        cell.blockBtnExpandAction = {
            
            defer {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            
            guard let aIndex = self.arrExpandedIndex.index(of: indexPath.row) else {
                self.arrExpandedIndex.append(indexPath.row)
                return
            }
            
            self.arrExpandedIndex.remove(at: aIndex)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard arrExpandedIndex.contains(indexPath.row) else {
            return 50
        }
        
        let aCell = tableView.cellForRow(at: indexPath) as! cellTblExpandable
        
        return CGFloat((aCell.arrSubMenu.count * 50) + 50)
    }
    
}
