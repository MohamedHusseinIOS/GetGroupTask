//
//  ViewController.swift
//  GetGroupTask
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: BaseViewController {

    @IBOutlet weak var brandsTableView: UITableView!
    
    let viewModel = HomeViewModel()
    var brands: [Brand]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.getData()
        title = "Home"
    }

    override func configureData() {
        viewModel.output
            .brands
            .bind { (brands) in
                self.brands = brands
        }.disposed(by: viewModel.bag)
    }
    
    override func configureUI() {
        registerCell()
        loadTableView()
        didSelectRow()
    }
    
    func registerCell() {
        let nib = UINib(nibName: BrandCell.id, bundle: .main)
        brandsTableView.register(nib, forCellReuseIdentifier: BrandCell.id)
    }

    func loadTableView() {
        brandsTableView.delegate = nil
        brandsTableView.dataSource = nil
        
        viewModel.output
            .brands
            .bind(to: brandsTableView.rx.items) { [unowned self] tableView, row, element in
                let index = IndexPath(row: row, section: 0)
                guard let cell = tableView.dequeueReusableCell(withIdentifier: BrandCell.id, for: index) as? BrandCell else {return BrandCell()}
                cell.bindOn(brand: element, brandLogo: self.viewModel.output.barndsLogos[row])
                return cell
            }.disposed(by: viewModel.bag)
    }
    
    func didSelectRow() {
        brandsTableView.rx
            .itemSelected
            .bind { [ weak self ] (indexPath) in
                guard let self = self, let brand = self.brands?[indexPath.row] else { return }
                Coordinator.shared.mainNavigator.navigate(To: .modelsViewController(brand))
        }.disposed(by: viewModel.bag)
    }
}

