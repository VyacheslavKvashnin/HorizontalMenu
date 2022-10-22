//
//  HorizontalCollectionView.swift
//  HorizontalMenu
//
//  Created by Вячеслав Квашнин on 22.10.2022.
//

import UIKit

protocol SelectCollectionViewProtocol: AnyObject {
    func selectItem(index: IndexPath)
}

class HorizontalCollectionView: UICollectionView {
    
    private let categoryLayout = UICollectionViewFlowLayout()
    
    private let nameCategoryArray = ["Like", "And", "Subscribe", "Channel", "Dont forget", "Card"]
    
    weak var cellDelegate: SelectCollectionViewProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        categoryLayout.minimumInteritemSpacing = 5
        categoryLayout.scrollDirection = .horizontal
        
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        bounces = false
        showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        
        register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        selectItem(at: [0, 0], animated: true, scrollPosition: [])
    }
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension HorizontalCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nameCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HorizontalCollectionViewCell else { return UICollectionViewCell() }
        cell.nameCategoryLabel.text = nameCategoryArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        cellDelegate?.selectItem(index: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HorizontalCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryFont = UIFont(name: "Arial", size: 18)
        let categoryAttributes = [NSAttributedString.Key.font : categoryFont as Any]
        let categoriWidth = nameCategoryArray[indexPath.item].size(withAttributes: categoryAttributes).width + 20
        
        return CGSize(width: categoriWidth, height: collectionView.frame.height)
    }
}
