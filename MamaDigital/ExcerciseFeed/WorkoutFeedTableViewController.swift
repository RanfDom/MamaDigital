//
//  ExcerciseFeed.swift
//  MamaDigital
//
//  Created by Ranferi Dominguez on 7/22/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import Foundation
import UIKit

class WorkoutFeedTableViewController : UITableViewController{
    
    var dataView = [Workout]()
    
    override func viewDidLoad() {
        if dataView.count == 0 {
            testApp()
            self.tableView.reloadData()
        }
    }

    
    func testApp() {
        dataView = [Workout(title: "TestTitle")]
    }
}

extension WorkoutFeedTableViewController {//Data Source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCellIdentifier", for: indexPath) as! WorkoutFeedCell
        
        cell.title.text = dataView[indexPath.row].title
//        cell.backGroundImage = dataView?[indexPath.row].img_URL
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataView.count
    }
    
}

extension WorkoutFeedTableViewController {//Table Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let workoutDetailVC = sb.instantiateViewController(withIdentifier: "workoutDetailIdentifier") as! WorkoutDetailViewController
        
        workoutDetailVC.workout = dataView[indexPath.row]
        
        self.present(workoutDetailVC, animated: true, completion: nil)
    }
    
}
