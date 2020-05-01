//
//  MovieCollectionView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 2.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieCollectionView: UIView, NibLoadable {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewLayout: UICollectionViewFlowLayout!
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
        
        prepareCollectionView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
        
        prepareCollectionView()
    }
    
    private func prepareCollectionView() {
        collectionView.registerCells(for: MovieCollectionViewCell.self)
    }
}

// MARK: - UICollectionViewDataSource

extension MovieCollectionView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(name: "8.7", image: "testImage".image)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension MovieCollectionView: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Koray Yıldız")
    }
}
