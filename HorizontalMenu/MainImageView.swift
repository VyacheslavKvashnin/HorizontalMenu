//
//  MainImageView.swift
//  HorizontalMenu
//
//  Created by Вячеслав Квашнин on 22.10.2022.
//

import Foundation
import UIKit

class MainImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        layer.cornerRadius = 10
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
