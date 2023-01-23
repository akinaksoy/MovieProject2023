//
//  TrailerView.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 23.01.2023.
//

import UIKit
import WebKit
class TrailerView: UIView {

    private let webView : WKWebView = {
       let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
