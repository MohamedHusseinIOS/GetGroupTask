//
//  ViewModelType.swift
//  pagination-demo
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
       
    var input: Input { get }
    var output: Output { get }
}
