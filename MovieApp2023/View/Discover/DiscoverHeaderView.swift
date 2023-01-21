//
//  DiscoverHeaderView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 20.01.2023.
//

import UIKit
import SnapKit

class DiscoverHeaderView: UIView {

    lazy var nowShowingButton : UIButton = {
        let button = UIButton()
        button.setTitle("Now Showing", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .setbuttonColor
        return button
    }()

    lazy var comingSoonButton : UIButton = {
        let button = UIButton()
        button.setTitle("Coming Soon", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .setbuttonColor
        return button
    }()
    
    lazy var buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        buttonStackView.addArrangedSubview(nowShowingButton)
        buttonStackView.addArrangedSubview(comingSoonButton)
        self.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).offset(32)
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
