//
//  BranchesViewModel.swift
//  GetGroupTask
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import Foundation

class BranshesViewModel: BaseViewModel, ViewModelType {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    let input: BranshesViewModel.Input
    let output: BranshesViewModel.Output
    
    override init() {
        self.input = Input()
        self.output = Output()
        super.init()
    }
}
