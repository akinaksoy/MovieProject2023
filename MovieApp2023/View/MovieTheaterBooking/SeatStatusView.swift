//
//  SeatStatusView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 1.02.2023.
//

import UIKit


enum ChairStatus {
case availableChair
case selectedChair
case reservedChair
}

class SeatStatusView: UIView {

    var statusColor : UIView = {
       let view = UIView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .setGreyColor
       return view
    }()
    var statusLabel = UILabel().setLabel(text: "", fontSize: 12, fontColor: .setGreyColor)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(statusColor)
        self.addSubview(statusLabel)
        
        statusColor.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(4)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(8)
        }
        statusLabel.snp.makeConstraints { make in
            make.left.equalTo(statusColor.snp_rightMargin).offset(8)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(chairStatus : ChairStatus) {
        
        switch chairStatus {
        case .availableChair:
            statusColor.backgroundColor = .setGreyColor
            statusLabel.text = Constants.available
            statusLabel.textColor = .setGreyColor
        case .selectedChair:
            statusColor.backgroundColor = .setSelectedChairColor
            statusLabel.text = Constants.selected
            statusLabel.textColor = .setSelectedChairColor
        case .reservedChair:
            statusColor.backgroundColor = .setGreyColor
            statusLabel.text = Constants.reserved
            statusLabel.textColor = .setSelectedChairColor
        }
        
    }
    
}
