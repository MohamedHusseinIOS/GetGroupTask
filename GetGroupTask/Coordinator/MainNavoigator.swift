//
//  mainNavoigator.swift
//  pagination-demo
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import Foundation
import UIKit

//MARK:- storyboards
enum storyboards: String {
    case main = "Main"
    
    var instanse: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: .main)
    }
}

class MainNavigator{
    
    private weak var navigationController: UINavigationController!
    let presentNVC = UINavigationController()
    var currentVC: Destination?
    var lastVC: UIViewController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension MainNavigator: Navigator{
    //MARK:- Destination
    enum Destination {
        
        //Main Storyboard
        case homeViewController
        case modelsViewController(_ brand: Brand)
        case branchsViewController(_ model: CarModel)
    }
    
    func navigate(To destination: Destination) {
        guard let vc = makeViewController(for: destination) else{ return }
        currentVC = destination
        lastVC = vc
        navigationController.pushViewController(vc, animated: true)
    }
    
    func present(_ destination: Destination, completion: (() -> Void)?) {
        guard let vc = makeViewController(for: destination) else { return }
        presentNVC.viewControllers.append(vc)
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        navigationController.present(presentNVC, animated: true) {
            completion?()
        }
    }
    
    func popViewController(to destination: Destination?){
        currentVC = destination
        navigationController.popViewController(animated: true)
        lastVC = navigationController.viewControllers.last
    }
    
    func makeViewController(for destination: Destination)-> UIViewController? {
        switch destination {
        //MARK:- home
        case .homeViewController, .modelsViewController, .branchsViewController:
            return homeViewControllers(by: destination)
        
        }
    }
    
    
    
    func homeViewControllers(by destination: Destination) -> UIViewController? {
        switch destination {
        case .homeViewController:
            let vc = HomeViewController.InstantiateFormStoryBoard(storyboards.main.instanse, vc: HomeViewController())
            return vc
        case .modelsViewController(let brand):
            let vc = ModelsViewController.InstantiateFormStoryBoard(storyboards.main.instanse, vc: ModelsViewController())
            vc?.brand = brand
            return vc
        case .branchsViewController(let model):
            let vc = BranchesViewController.InstantiateFormStoryBoard(storyboards.main.instanse, vc: BranchesViewController())
            vc?.model = model
            return vc
        }
    }
    
}
