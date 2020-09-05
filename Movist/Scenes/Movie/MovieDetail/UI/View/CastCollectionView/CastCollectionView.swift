//
//  CastCollectionView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

private struct Constants {
    static let heightForPoster: CGFloat = 135.0
    static let heightForLabels: CGFloat = 20.0
    static let widthForCell: CGFloat = 90.0
    static let contentInsetForCollection = UIEdgeInsets(horizontal: 10.0, vertical: 8.0)
}

public protocol CastCollectionViewDelegate: class {
    
    func castColletionView(_ movieCollectionView: CastCollectionView, didSelectItemAt at: Int)
}

public final class CastCollectionView: UIView, NibLoadable {
    
    @IBOutlet private weak var title: UILabel!
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
    
    override public var intrinsicContentSize: CGSize {
        let height = (Constants.heightForLabels * 2.0) + Constants.heightForPoster + title.frame.size.height
        let width = Constants.widthForCell
        return CGSize(width: width, height: height)
    }
    
    private func prepareCollectionView() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCells(for: CastCollectionViewCell.self)
        collectionView.contentInset = Constants.contentInsetForCollection
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(
                equalToConstant: (Constants.heightForLabels * 2.0) +
                    Constants.heightForPoster +
                    Constants.contentInsetForCollection.vertical)
        ])
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
        let height = (Constants.heightForLabels * 2.0) + Constants.heightForPoster
        let width = Constants.widthForCell
        return CGSize(width: width, height: height)
    }
}
