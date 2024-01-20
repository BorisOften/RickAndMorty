//
//  RMFooterLoadingCollectionView.swift
//  RickyAndMorty
//
//  Created by Banye on 1/20/24.
//

import Foundation
import UIKit

final class RMFooterLoadingCollectionView: UICollectionReusableView {
    static let reuseID = "RMFooterLoadingCollectionView"
    
    var spinnerView = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: For otimazation, stop the loading spinner
    
    func addSubviews() {
        self.addSubview(spinnerView)
        
        spinnerView.startAnimating()
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.style = .large
        
        NSLayoutConstraint.activate([
            spinnerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
