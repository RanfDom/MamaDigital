//
//  Services.swift
//  MamaDigital
//
//  Created by Ranferi Dominguez on 7/22/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import Foundation
import Alamofire

class API_Service {
    
    class func requestDailyWorkout(onSuccess : @escaping (_ success : [Workout]) -> Void, failure: (_ error: NSError?) -> Void) {
        Alamofire.request("http://192.168.15.100/api/baby/1/workout").responseJSON { response in
            
            if let error = response.error {
                print("Error: \(String(describing: error))")
            } else {
                if let json = response.result.value {
                    onSuccess(Adapter.workoutFromService(json as! [String:AnyObject]))
                }
            }
            
        }
    }
    
    class func requestBabyInfo(onSuccess : @escaping (_ success : Baby) -> Void, failure: (_ error: NSError?) -> Void) {
        Alamofire.request("http://192.168.15.100/api/baby/1").responseJSON { response in
            
            if let error = response.error {
                print("Error: \(String(describing: error))")
            } else {
                if let json = response.result.value {
                    onSuccess(Adapter.babyFromService(json as! [String:AnyObject]))
                }
            }
        }
    }
    
    
}
