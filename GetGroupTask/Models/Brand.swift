//
//  Brand.swift
//  GetGroupTask
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import Foundation

struct Brands: BaseModel {
    var brands: [Brand]?
}

struct Brand: BaseModel {
    var name: String?
    var models: [CarModel]?
}
