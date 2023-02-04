//
//  CartViewController.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 4.02.2023.
//

import UIKit

class CartViewController: BaseViewController {

    
    let cartOrderView = CartOrderView()
    
    lazy var tableView : UITableView = {
       
        let tableView = UITableView()
        tableView.delegate = self
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        tableView.dataSource = self
        return tableView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cart"
        
        configure()
    }
    
    override func configure() {
        super.configure()
        
        view.addSubview(cartOrderView)
        view.addSubview(tableView)
        
        cartOrderView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
            make.width.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalTo(cartOrderView.snp_topMargin)
        }
    }
    
}


extension CartViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as? CartTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
