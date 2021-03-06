//
//  ExcerciseFeed.swift
//  MamaDigital
//
//  Created by Ranferi Dominguez on 7/22/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class WorkoutFeedTableViewController : UITableViewController{
    
    var dataView = [Workout]()
    
    override func viewDidLoad() {
        if dataView.count == 0 {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        API_Service.requestDailyWorkout(onSuccess: { (dailyWorkout) in
            self.dataView = dailyWorkout
            print(self.dataView)
            self.tableView.reloadData()
        }) { (error) in
            print(error ?? 0)
        }
    }
    
}

extension WorkoutFeedTableViewController {//Data Source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCellIdentifier", for: indexPath) as! WorkoutFeedCell
        
        cell.title.text = dataView[indexPath.row].title
        cell.backGroundImage.sd_setImage(with: URL(string: dataView[indexPath.row].img_URL))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataView.count
    }
    
}

extension WorkoutFeedTableViewController {//Table Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let workoutDetailVC = sb.instantiateViewController(withIdentifier: "RoutineDetailVC") as! RoutineDetailVC
        
        workoutDetailVC.workout = dataView[indexPath.row]
        
        self.navigationController?.pushViewController(workoutDetailVC, animated: true)
    }
    
}
