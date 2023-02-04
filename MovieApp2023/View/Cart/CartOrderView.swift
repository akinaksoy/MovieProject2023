//
//  CartOrderView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 4.02.2023.
//

import UIKit

class CartOrderView: UIView {

    let totalPriceLabel = UILabel().setLabel(text: "Total Price", fontSize: 16, fontColor: .setbuttonColor)
    let priceValueLabel = UILabel().setLabel(text: "0.00 $", fontSize: 14, fontColor: .setTextColor)
    
    lazy var completeButton : ButtonView = {
       let button = ButtonView()
        button.configure(buttonText: "Complete", icon: "paperplane", type: .functionalButton)
        button.didTapButton = {
            self.didTappedCompleteButton()
        }
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .setBorderGreyColor
        
        self.addSubview(totalPriceLabel)
        self.addSubview(priceValueLabel)
        self.addSubview(completeButton)
        
        totalPriceLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(2)
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(8)
        }
        priceValueLabel.snp.makeConstraints { make in
            make.top.equalTo(totalPriceLabel.snp_bottomMargin).offset(8)
            make.left.width.equalTo(totalPriceLabel)
        }
        completeButton.snp.makeConstraints { make in
            make.left.equalTo(totalPriceLabel.snp_rightMargin).offset(8)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(24)
            make.bottom.equalTo(priceValueLabel.snp_bottomMargin)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(price : Int) {
        priceValueLabel.text = "\(price).00 $"
    }
    
    private func didTappedCompleteButton() {
        print("a")
    }
}
