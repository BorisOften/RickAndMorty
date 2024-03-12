//
//  RMCharacterSingleInfoView.swift
//  RickyAndMorty
//
//  Created by Banye on 1/28/24.
//

import Foundation
import UIKit


final class RMCharacterSingleInfoView: UIView {
    
    
    var titleLabel = UILabel()
    var valueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func assignTitleAndValues(
        title: String,
        value: String
    ) {
        titleLabel.text = title
        valueLabel.text = value
    }
}


extension RMCharacterSingleInfoView {
    
    private func configureView() {
        addTitleLabel()
        addValueLabel()
        editView()
    }
    
    private func editView() {
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10

    }
    
    private func addTitleLabel() {
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addValueLabel() {
        self.addSubview(valueLabel)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = .systemFont(ofSize: 25, weight: .bold)
        valueLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            valueLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        //if previousTraitCollection.
//        self.backgroundColor = .secondarySystemBackground
//        self.layer.cornerRadius = 10
//        self.layer.shadowOpacity = 0.7
//        self.layer.shadowRadius = 1
//        self.layer.shadowColor = UIColor.label.cgColor
    }
}
