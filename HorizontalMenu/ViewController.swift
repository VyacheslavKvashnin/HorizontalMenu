//
//  ViewController.swift
//  HorizontalMenu
//
//  Created by Вячеслав Квашнин on 22.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainImageView = MainImageView(image: UIImage(named: "image"))
    private let horizontalMenuCollection = HorizontalCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        setup()
        setConstraints()
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(mainImageView)
        view.addSubview(horizontalMenuCollection)
        horizontalMenuCollection.cellDelegate = self
    }
}

extension ViewController: SelectCollectionViewProtocol {
    func selectItem(index: IndexPath) {
        switch index.item {
        case 0: mainImageView.image = UIImage(named: "image")
        case 1: mainImageView.image = UIImage(named: "images")
        default:
            break
        }
    }
}

extension ViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            horizontalMenuCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            horizontalMenuCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalMenuCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalMenuCollection.heightAnchor.constraint(equalToConstant: 40),
            
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            mainImageView.topAnchor.constraint(equalTo: horizontalMenuCollection.bottomAnchor, constant: 5)
        ])
        
    }
}
