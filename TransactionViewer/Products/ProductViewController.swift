//
//  ViewController.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import UIKit

class ProductViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private var viewModel = ProductViewModel()
    
    //MARK:  Life cycle
    init(viewModel: ProductViewModel)  {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        setupNavigationController(title: "Products")
        setupTableView()
        setupConstraints()
        viewModel.getProducts()
        tableView.reloadData()
    }
    
    //MARK: Initial setup
    private func setupTableView() {
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupNavigationController(title: String) {
        navigationItem.title = title
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK: Constraints
    private func setupConstraints() {
        view.addSubviewsForAutolayout([
            tableView
        ])
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            
        ])
        
    }
    
}

//MARK: UITableViewDataSource
extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.cellID) as? ProductCell else { return UITableViewCell() }
        guard let product = viewModel.getProduct(at: indexPath.row) else { return UITableViewCell() }
        cell.contentView.backgroundColor = UIColor.cyan
        cell.configure(with: product)
        return UITableViewCell()
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        TODO: add transition
    }
    
    
}


extension ProductViewController: ProductViewModelDelegate {
    func reloadData() {
        tableView.reloadData()
    }
    
    
}
