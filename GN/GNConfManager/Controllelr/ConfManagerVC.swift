//
//  ConfManagerVC.swift
//  GN
//
//  Created by Xianxiangdaishu on 2018/10/24.
//  Copyright © 2018 XXDS. All rights reserved.
//

import UIKit

class ConfManagerVC: UITableViewController {

    let vm = ConfManagerVM()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        vm.loadData(fileName: "").observeCompleted {
        
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return vm.tableArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let model = vm.tableArray[section]
        
        return model.am.confList.count + model.pm.confList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        if cell == nil {
            
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "CELL")
        }
        
        let model = vm.tableArray[indexPath.section]
        
        if indexPath.row < model.am.confList.count {
            
            cell?.textLabel?.text = String(model.am.confList[indexPath.row])
        } else {
            cell?.textLabel?.text = String(model.pm.confList[indexPath.row - model.am.confList.count])
        }
        cell?.textLabel!.font = UIFont.systemFont(ofSize: 12.0)
        return cell!
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let model = vm.tableArray[section]
        let rect = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: kScreenWidth, height: 50))
        let label = UILabel.init(frame: rect)
        label.text = "   \(model.title)"
        
//        let view = UIView.init(frame: rect)
//        view.addSubview(label)
        return label
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
