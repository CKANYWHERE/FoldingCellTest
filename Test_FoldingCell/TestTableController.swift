//
//  ViewController.swift
//  Test_FoldingCell
//
//  Created by 민창경 on 2020/12/01.
//

import UIKit
import FoldingCell

class TestTableController: UITableViewController {
  
  // MARK: - Const
  let closeHeight: CGFloat = 60
  let openHeight: CGFloat = 166
  var itemHeight = [CGFloat](repeating: 100, count: 10)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.backgroundColor = .lightGray
    registerCell() // register UITableViewCell to use this cell in UITableView Reuse pool
  }
}

// MARK: Helpers
extension TestTableController {
  
  private func registerCell() {
    tableView.register(TestFoldingCell.self, forCellReuseIdentifier: "DemoFoldingCell")
  }
  
}

// MARK: - Table view data source
extension TestTableController {
  
  // set number of rows in each section
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemHeight.count
  }
  
  // cell for row at index path.
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DemoFoldingCell", for: indexPath) as! TestFoldingCell
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return itemHeight[indexPath.row]
  }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell

        if cell.isAnimating() {
            return
        }

        var duration = 0.0
        let cellIsCollapsed = itemHeight[indexPath.row] == closeHeight
        if  cellIsCollapsed {
            itemHeight[indexPath.row] = openHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            itemHeight[indexPath.row] = closeHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
            
            if cell.frame.maxY > tableView.frame.maxY {
                tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
            }
        }, completion: nil)
    }
  
}
