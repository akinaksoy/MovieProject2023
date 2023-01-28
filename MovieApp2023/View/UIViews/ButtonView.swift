//
//  ButtonView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 29.01.2023.
//

import UIKit

class ButtonView: UIView {

    let ticketIcon : UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .setButtonTextColor
        icon.image = UIImage(systemName: "cart.circle")
        return icon
    }()
    
    var ticketLabel = UILabel().setLabel(text: "", fontSize: 16, fontColor: .setButtonTextColor)
    
    lazy var button : UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        button.backgroundColor = .setbuttonColor
        button.layer.cornerRadius = 16
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(button)
        self.addSubview(ticketIcon)
        self.addSubview(ticketLabel)
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        ticketIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.height.width.equalTo(24)
        }
        ticketLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(ticketIcon.snp_rightMargin).offset(16)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configure(buttonText : String) {
        ticketLabel.text = buttonText
    }
    
    var didTapButton: (() -> Void)?
    
    @objc func didTappedButton() {
        if let didTapButton = didTapButton {
            didTapButton()
        }
    }
    
}
