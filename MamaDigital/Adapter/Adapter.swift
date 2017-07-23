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
            age: data["diffInMonths"] as! String)
    }
    
//    API_Service.requestBabyInfo(onSuccess: { (baby) in
//    print(baby)
//    }) { (error) in
//    print(error ?? 0)
//    }
}
