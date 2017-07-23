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
    let baseURL = "192.168.15.100"
    
//    var workout = {() -> [Workout] in return [Workout]()}
    
    class func requestDailyWorkout(onSuccess : @escaping (_ success : [Workout]) -> Void, failure: (_ error: NSError?) -> Void) {
        Alamofire.request("http://192.168.15.100/get/baby/1/workout").response { response in
            
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Error: \(String(describing: response.error))")
            
        }
    }
    
    class func requestBabyInfo(onSuccess : (_ success : Baby) -> Void, failure: (_ error: NSError?) -> Void) {
        Alamofire.request("http://192.168.15.100/api/baby/1").responseJSON { response in
            
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Error: \(String(describing: response.error))")
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
            
        }
    }
    
}
