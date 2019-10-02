//
//  ModelsViewModel.swift
//  GetGroupTask
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import RxSwift

class ModelsViewModel: BaseViewModel, ViewModelType {
    
    struct Input {}
    
    struct Output {
        let models: Observable<[CarModel]>
    }
    
    let input: ModelsViewModel.Input
    let output: ModelsViewModel.Output
    
    private let models = PublishSubject<[CarModel]>()
    
    override init() {
        self.input = Input()
        self.output = Output(models: models.asObservable())
        super.init()
    }
    
    func getModelsfromBrand(_ brand: Brand?) {
        guard let models = brand?.models else { return }
        self.models.onNext(models)
    }
}
