//
//  MovieCollectionView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 2.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

private struct Constants {
    static let emptyStateTitle = "Listelenecek film bulunamadı!"
}

public protocol MovieCollectionViewDelegate: class {
    
    func movieColletionView(_ movieCollectionView: MovieCollectionView, didSelectItemAt at: Int)
}

public final class MovieCollectionView: UIView, NibLoadable {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewLayout: UICollectionViewFlowLayout!
    
    public weak var delegate: MovieCollectionViewDelegate?
    
    public var display: [MovieItemDisplay] = .empty() {
        didSet {
//            configureEmptyState()
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
    
    override public var intrinsicContentSize: CGSize {
        return collectionView.frame.size
    }
    
    private func prepareCollectionView() {
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCells(for: MovieCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(horizontal: 10, vertical: .zero)
    }
}

// MARK: - UICollectionViewDataSource

extension MovieCollectionView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return display.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(display: display[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension MovieCollectionView: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.movieColletionView(self, didSelectItemAt: indexPath.row)
    }
}

extension MovieCollectionView {
    
    func configureEmptyState() {
        
        if display.isNotEmpty {
            collectionView.hideEmptyState(animated: true)
        }
        else {
            collectionView.showEmptyState(with: .init(title: Constants.emptyStateTitle))
        }
    }
}
