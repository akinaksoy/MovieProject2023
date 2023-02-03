//
//  BookingItemsUIView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 1.02.2023.
//

import UIKit

class BookingItemsUIView: UIView {

    let view : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .setGoldColor
        return view
    }()
    
    let selectedChairLeftLabel = UILabel().setLabel(text: "Selected Chairs", fontSize: 14, fontColor: .setButtonTextColor)
    let selectedChairRightValueLabel = UILabel().setLabel(text: "0", fontSize: 14, fontColor: .setButtonTextColor)
    let priceLeftLabel = UILabel().setLabel(text: "Price", fontSize: 14, fontColor: .setButtonTextColor)
    let priceRightValueLabel = UILabel().setLabel(text: "0 $", fontSize: 14, fontColor: .setButtonTextColor)
    
    let addToCartButton : ButtonView = {
       let button = ButtonView()
        button.configure(buttonText: "Add to Cart",icon: "cart.circle",type: .functionalButton)
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(view)
        self.addSubview(selectedChairLeftLabel)
        self.addSubview(selectedChairRightValueLabel)
        self.addSubview(priceLeftLabel)
        self.addSubview(priceRightValueLabel)
        self.addSubview(addToCartButton)
        
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        selectedChairLeftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(16)
            make.width.equalToSuperview().dividedBy(4)
        }
        selectedChairRightValueLabel.snp.makeConstraints { make in
            make.left.equalTo(selectedChairLeftLabel.snp_rightMargin).offset(8)
            make.top.equalTo(selectedChairLeftLabel)
            make.width.equalToSuperview().dividedBy(4)
        }
        priceLeftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.top.equalTo(selectedChairLeftLabel.snp_bottomMargin).offset(8)
            make.width.equalToSuperview().dividedBy(4)
        }
        priceRightValueLabel.snp.makeConstraints { make in
            make.left.equalTo(priceLeftLabel.snp_rightMargin).offset(8)
            make.top.equalTo(priceLeftLabel)
            make.width.equalToSuperview().dividedBy(4)
        }
        addToCartButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(priceRightValueLabel.snp_rightMargin).offset(16)
            make.right.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
