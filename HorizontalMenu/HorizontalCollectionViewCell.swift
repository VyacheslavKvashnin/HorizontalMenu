//
//  HorizontalCollectionViewCell.swift
//  HorizontalMenu
//
//  Created by Вячеслав Квашнин on 22.10.2022.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    let nameCategoryLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? .red : .blue
            nameCategoryLabel.textColor = self.isSelected ? .black : .white
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .blue
        layer.cornerRadius = 10
        addSubview(nameCategoryLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
