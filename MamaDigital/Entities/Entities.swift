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
