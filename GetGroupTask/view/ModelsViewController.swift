//
//  ModelsViewController.swift
//  GetGroupTask
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import UIKit

class ModelsViewController: BaseViewController {

    @IBOutlet weak var modelsTableView: UITableView!
    
    var brand: Brand?
    let viewModel = ModelsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getModelsfromBrand(brand)
        title = "Models"
    }
    
    override func configureUI() {
        registerCell()
        loadTableView()
        didSelectRow()
    }
    
    func registerCell() {
        let nib = UINib(nibName: ModelCell.id, bundle: .main)
        modelsTableView.register(nib, forCellReuseIdentifier: ModelCell.id)
    }
    
    func loadTableView() {
        modelsTableView.delegate = nil
        modelsTableView.dataSource = nil
        
        viewModel.output
            .models
            .bind(to: modelsTableView.rx.items) { tableView, row, element in
                let index = IndexPath(row: row, section: 0)
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ModelCell.id, for: index) as? ModelCell else {return ModelCell()}
                cell.bindOn(brand: element)
                return cell
            }.disposed(by: viewModel.bag)
    }
    
    func didSelectRow(){
        modelsTableView.rx
            .itemSelected
            .bind { [ weak self ] (indexPath) in
                guard let self = self, let model = self.brand?.models?[indexPath.row] else { return }
                Coordinator.shared.mainNavigator.navigate(To: .branchsViewController(model))
        }.disposed(by: viewModel.bag)
    }


}
