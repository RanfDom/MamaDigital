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
            testApp()
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
    
    func testApp() {
        dataView = [Workout(title: "First Workout", slug: "Test Slug", video_URL: "someURL", img_URL: "https://www.guiainfantil.com/uploads/bebes/mamahablabebe-p.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi placerat velit nisl, non viverra sapien aliquam ut. Sed varius nisi quis justo ullamcorper, eget fermentum turpis ornare. Morbi ornare luctus nisi, non consectetur metus lacinia rhoncus. Nulla at consectetur ligula, consequat vulputate sapien. Quisque hendrerit nisi in magna maximus faucibus. Nam aliquam, mi sed gravida dictum, dolor tortor vulputate mauris, vel suscipit massa orci et tortor. Nulla vitae tellus consequat, laoreet ex non, vulputate eros. In pharetra orci quam, aliquam sodales nulla bibendum ac. Pellentesque semper lorem eget cursus condimentum.", duration: "150", type: "Motor")]
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
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let workoutDetailVC = sb.instantiateViewController(withIdentifier: "workoutDetailIdentifier") as! WorkoutDetailViewController
//        
//        workoutDetailVC.workout = dataView[indexPath.row]
//        
//        self.present(workoutDetailVC, animated: true, completion: nil)
    }
    
}
