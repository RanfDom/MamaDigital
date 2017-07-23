//
//  Adapter.swift
//  MamaDigital
//
//  Created by Ranferi Dominguez on 7/22/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import Foundation

class Adapter {
    
    class func babyFromService(_ data: [String:AnyObject]) -> Baby {
        return Baby(
            name: data["name"] as! String,
            age:  "\(data["diffInMonths"] as! Int) meses")
    }
    
    class func workoutFromService(_ data: [String:AnyObject]) -> [Workout] {
        var myWorkout = [Workout]()
        
        for obj in data["works"] as! [AnyObject] {
            myWorkout.append(Workout(
                title: obj["title"] as! String,
                slug: "",
                video_URL: buildLink(obj["video"]as! String),
                img_URL: buildLink(obj["thumbnail"]as! String),
                description: obj["description"]as! String,
                duration: "\(obj["duration"]as! Int)",
                type: obj["type"]as! String))
        }
        
        return myWorkout
    }
    
    class func buildLink(_ end : String) -> String {
        let index = end.index(end.startIndex, offsetBy: 1)
        return "http://192.168.15.100/\(end.substring(from: index))"
        
    }
    
}
