//
//  CartTableViewCell.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 4.02.2023.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    static let identifier = "CartTableViewCell"
    
    let image : UIImageView = {
       let view = UIImageView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
       return view
    }()
    
    let movieNameLabel = UILabel().setLabel(text: "Avatar", fontSize: 16, fontColor: .setTextColor)
    let seatLabel = UILabel().setLabel(text: "Seats", fontSize: 12, fontColor: .setbuttonColor)
    let totalPriceLabel = UILabel().setLabel(text: "20.00 $", fontSize: 16, fontColor: .setTextColor)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .setBorderGreyColor
        
        configure()
    }
    
    func configure() {
        self.addSubview(image)
        self.addSubview(movieNameLabel)
        self.addSubview(seatLabel)
        self.addSubview(totalPriceLabel)
        
        image.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(16)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(image)
            make.left.equalTo(image.snp_rightMargin).offset(8)
            make.right.equalToSuperview().inset(8)
        }
        
        seatLabel.snp.makeConstraints { make in
            make.left.equalTo(movieNameLabel)
            make.top.equalTo(movieNameLabel.snp_bottomMargin).offset(8)
            make.right.equalTo(movieNameLabel)
        }
        
        totalPriceLabel.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview()
        }
        
    }
    
    func setDatas(imageString : String?,movieName : String,seatLabelIndexes : [IndexPath], price : String) {
        if let imageString = imageString {
            image.setImage(imageUrl: imageString)
        }
        movieNameLabel.text = movieName
        seatLabel.text = BookingManager.shared.configureSeatTexts(indexPath: seatLabelIndexes)
        totalPriceLabel.text = "\(price) $"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
}
