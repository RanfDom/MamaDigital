//
//  Entities.swift
//  MamaDigital
//
//  Created by Daniel Serrano on 22/07/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import Foundation

struct Baby {
    var name: String
    var age: String
}

struct User {
    var name: String
    var email: String
    var baby: Baby
}


struct Workout {
    var title : String
    var slug : String
    var video_URL : String
    var img_URL : String
    var description : String
    var duration : String
    var type : String
}
