//
//  VerticalCollectionViewCell.swift
//  HorizontalMenu
//
//  Created by Вячеслав Квашнин on 24.10.2022.
//

import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {
    static let identifier = "verticalCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
