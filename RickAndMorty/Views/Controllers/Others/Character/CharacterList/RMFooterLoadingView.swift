//
//  RMFooterLoadingView.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 6/17/23.
//

import UIKit

final class RMFooterLoadingView: UICollectionReusableView {
    
    static let identifier = "RMFooterLoadingView"
    var spinner = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        spinner.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
