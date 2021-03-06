//
//  HistoryController.swift
//  UnitConversion
//
//  Created by Devon Wijesinghe on 2/20/20.
//  Copyright © 2020 Devon Wijesinghe. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController : UITableViewController {
    var history : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initHistoryInfo()
    }
    
    func initHistoryInfo() {
        if let vcs = self.navigationController?.viewControllers {
            let previousVC = vcs[vcs.count - 2]
            
            if previousVC is TempController {
                loadDefaultsData("TemparatureHistory")
            }
        }
    }
    
    func loadDefaultsData(_ historyKey :String) {
        let defaults = UserDefaults.standard
        history = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableHistoryCell")!
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = history[indexPath.row]
        return cell
    }
    
}
