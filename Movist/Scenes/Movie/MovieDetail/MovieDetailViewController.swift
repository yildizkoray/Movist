//
//  MovieDetailViewController.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieDetailViewController: UIViewController, ViewController {
    
    public static var storyboardName: UIStoryboard.Name = .movie
    
    public var viewModel: MovieDetailViewModel!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var display: MovieDetailDisplay = .empty {
        didSet {
            tableView.reloadData()
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        
        
        
        viewModel.start().done { [weak self] display in
            self?.display = display
            self?.prepareNavigation()
        }.ensure {[weak self] in
            self?.view.stopLoadingIndicatorView()
            self?.tableView.setHidden(false, animated: true)
        }
        .cauterize()
    }
    
    private func prepareUI() {
        
        view.startLoadingIndicatorView()
        view.backgroundColor = UIColor(red: 47, green: 47, blue: 59) // TODO: - Move AppColor
        prepareTableView()
    }
    
    private func prepareNavigation() {
        title = display.title
    }
    
    public func prepareTableView() {
        tableView.setHidden(true, animated: false)
        tableView.registerCells(for: MovieDetailTableViewCell.self, MovieTableViewCell.self)
        tableView.registerSectionHeaderFooters(for: MovieDetailSectionHeaderView.self)
    }
}

// MARK: - UITableViewDataSource

extension MovieDetailViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = viewModel.cellType(for: indexPath)
        
        switch cellType {
            
        case .cast:
            let cell: MovieDetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.castCollectionView.delegate = self
            cell.configure(with: display.casts)
            return cell
            
        case .similar:
            let cell: MovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.movieCollectionView.delegate = self
            cell.configure(display: display.similars)
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDelegate

extension MovieDetailViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header: MovieDetailSectionHeaderView = tableView.dequeueReusableHeaderFooterView()
        header.configure(with: display.header)
        header.didClickPlayTrailler = { [unowned self] in
            print(self.display.title)
        }
        return header
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        let backdropHeight = view.frame.width * 0.5625
        let posterHeight: CGFloat = (120 * 1.5)
        let margin: CGFloat = 16.0
        return backdropHeight + posterHeight + margin
    }
}

// MARK: - CastCollectionViewDelegate

extension MovieDetailViewController: CastCollectionViewDelegate {
    
    public func castColletionView(_ movieCollectionView: CastCollectionView, didSelectItemAt at: Int) {
        print(movieCollectionView.display[at].id)
    }
}

extension MovieDetailViewController: MovieCollectionViewDelegate {
    
    public func movieColletionView(_ movieCollectionView: MovieCollectionView, didSelectItemAt at: Int) {
        viewModel.coordinator.start(with: movieCollectionView.display[at].id)
    }
}
