//
//  MovieTableViewCell.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 29.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private (set) weak var collectionView: UICollectionView!

    override public func awakeFromNib() {
        super.awakeFromNib()
        prepareCollectionView()
    }
    
    private func prepareCollectionView() {
        collectionView.registerCells(for: MovieCollectionViewCell.self)
    }
}

// MARK: - UICollectionViewDataSource

extension MovieTableViewCell: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MovieTableViewCell: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 144, height: 216)
    }
}
