//
//  SelectDateTableViewCell.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 3.02.2023.
//

import UIKit

class SelectDateTableViewCell: UITableViewCell {
    static let identifier = "SelectDateTableViewCell"
    
    let dateLabel = UILabel().setLabel(text: "", fontSize: 12, fontColor: .setbuttonColor)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .setBorderGreyColor
        self.addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureWithText(_ text : String) {
        dateLabel.text = text
    }

}
