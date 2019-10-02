//
//  BaseViewModel.swift
//  pagination-demo
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

class BaseViewModel {

    var bag = DisposeBag()
    
    init() {}
    
    func handelError(data: Any?, failuer: PublishRelay<[Error]>){
        if let err = data as? Error{
            failuer.accept([err])
        }else if let errorArr = data as? [Error]{
            failuer.accept(errorArr)
        }
    }
}
