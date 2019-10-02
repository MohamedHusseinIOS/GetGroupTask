//
//  HomeViewModel.swift
//  GetGroupTask
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

class HomeViewModel: BaseViewModel, ViewModelType {
    
    struct Input {}
    
    struct Output {
        var brands: Observable<[Brand]>
        var barndsLogos = [ #imageLiteral(resourceName: "skoda"), #imageLiteral(resourceName: "chevrolet"), #imageLiteral(resourceName: "hyundai")]
    }
    
    let input: HomeViewModel.Input
    let output: HomeViewModel.Output
    
    private let brands = PublishSubject<[Brand]>()
    private let faliure = PublishRelay<[Error]>()
    
    override init() {
        self.input = Input()
        self.output = Output(brands: brands.asObservable())
        super.init()
        
    }
    
    func getData() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            guard let brandsModel = Brands.decodeJSON(jsonResult, To: Brands.self, format: .convertFromSnakeCase) as? Brands, let brands = brandsModel.brands else { return }
            self.brands.onNext(brands)
        } catch let error{
            print(error)
            self.handelError(data: error, failuer: faliure)
        }
    }
}
