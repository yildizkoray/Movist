//
//  CastCollectionView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public protocol CastCollectionViewDelegate: class {
    
    func castColletionView(_ movieCollectionView: CastCollectionView, didSelectItemAt at: Int)
}

public final class CastCollectionView: UIView, NibLoadable {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewLayout: UICollectionViewFlowLayout!
    
    public weak var delegate: CastCollectionViewDelegate?
    
    public var display: [CastDisplay] = .empty() {
        didSet {
            collectionView.reloadData()
        }
    }
    
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
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCells(for: CastCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

// MARK: - UICollectionViewDataSource

extension CastCollectionView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return display.count
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CastCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: display[indexPath.row].content)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CastCollectionView: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.castColletionView(self, didSelectItemAt: indexPath.row)
    }
}

// MARK: - UICollectionViewDelegate

extension CastCollectionView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 90, height: collectionView.frame.height - 20)
    }
}
