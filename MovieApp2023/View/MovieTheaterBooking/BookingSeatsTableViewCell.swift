//
//  BookingSeatsTableViewCell.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 1.02.2023.
//

import UIKit

class BookingSeatsCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "BookingSeatsTableViewCell"
    
    let seatImage : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "availableChair")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    
    override init(frame : CGRect){
        super.init(frame: frame)
        self.addSubview(seatImage)
        
        seatImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init(coder : NSCoder){
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        seatImage.layoutIfNeeded()
    }
}

