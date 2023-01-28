//
//  MovieInfoView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 22.01.2023.
//

import UIKit
import SnapKit
class MovieInfoView: UIView {

    let dateView = UIView().bubbleView()
    let dateLabel = UILabel().setLabel(text: "", fontSize: 12, fontColor: .setbuttonColor)
    let rateView = UIView().bubbleView()
    let rateLabel = UILabel().setLabel(text: "", fontSize: 12, fontColor: .setbuttonColor)
    
    let infoStackView = UIStackView().horizontalStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        dateView.addSubview(dateLabel)
        rateView.addSubview(rateLabel)
        infoStackView.addArrangedSubview(dateView)
        infoStackView.addArrangedSubview(rateView)
        
        self.addSubview(infoStackView)
        
        dateLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        rateLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        dateView.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(96)
        }
        rateView.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(96)
        }
        infoStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(dateText : String, rateText : String) {
        dateLabel.text = dateText
        rateLabel.text = rateText
    }
    
}
