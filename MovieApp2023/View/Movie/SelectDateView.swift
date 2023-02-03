//
//  SelectDateView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 3.02.2023.
//

import UIKit


enum SelectDateTypeView {
    case dateView
    case hourView
}

class SelectDateView: UIView {

    let viewArea : UIView = {
        let view = UIView()
        view.backgroundColor = .setBackgroundColor
        return view
    }()
    
    let selectText = UILabel().setLabel(text: "", fontSize: 16, fontColor: .setTextColor)
    
    lazy var tableView : UITableView = {
       
        let tableView = UITableView()
        tableView.delegate = self
        tableView.register(SelectDateTableViewCell.self, forCellReuseIdentifier: SelectDateTableViewCell.identifier)
        tableView.dataSource = self
        return tableView
        
    }()
    
    var dates : [String]?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .gray.withAlphaComponent(0.4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.addSubview(viewArea)
        self.addSubview(selectText)
        self.addSubview(tableView)
        
        viewArea.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        selectText.snp.makeConstraints { make in
            make.top.equalTo(viewArea.snp_topMargin).offset(8)
            make.centerX.equalTo(viewArea)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(selectText.snp_bottomMargin).offset(8)
            make.left.right.equalTo(viewArea)
            make.bottom.equalTo(viewArea)
        }
    }
    func setDatas(dateArray : [String],viewType : SelectDateTypeView) {
        dates = dateArray
        switch viewType {
        case .dateView:
            selectText.text = "Select Date"
        case .hourView:
            selectText.text = "Select Hour"
        }
    }
    
}

extension SelectDateView : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dates = dates {
            return dates.count
        } else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectDateTableViewCell.identifier, for: indexPath) as? SelectDateTableViewCell else {
            return UITableViewCell()
        }
        cell.configureWithText(dates?[indexPath.row] ?? "")
        return cell
    }
    
}
