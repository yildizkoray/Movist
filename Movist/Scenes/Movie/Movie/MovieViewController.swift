//
//  ViewController.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import PromiseKit

fileprivate struct Constants {
    static let title = "Movie"
}

public final class MovieViewController: UIViewController, ViewController {
    
    public static var storyboardName: UIStoryboard.Name = .movie
    
    public var viewModel: MovieViewModel!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var display: [MovieDisplay] = .empty() { // TODO: - Change MoviePopularDisplay, make generic
        didSet {
            tableView.reloadData()
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        
        viewModel.start().done { [weak self] display in
            self?.display = display
        }
        .ensure { [weak self] in
            self?.tableView.setHidden(false, animated: true)
            self?.view.stopLoadingIndicatorView()
        }
        .cauterize()
    }
    
    @objc private func refresh() {
        
        viewModel.start().done { [weak self] display in
            self?.display = display
        }
        .ensure { [weak self] in
            self?.tableView.endRefreshing()
        }
        .cauterize()
    }
    
    private func prepareUI() {
        view.startLoadingIndicatorView()
        view.backgroundColor = UIColor(red: 29, green: 29, blue: 39)
        prepareNavigation()
        prepareTableView()
    }
    
    private func prepareNavigation() {
        title = Constants.title
    }
    
    private func prepareTableView() {
        tableView.setHidden(true, animated: false)
        tableView.addRefresher(color: .white, selector: #selector(refresh))
        tableView.registerCells(for: MovieTableViewCell.self)
        tableView.registerSectionHeaderFooters(for: MovieSectionHeaderView.self)
    }
}

// MARK: - UITableViewDataSource

extension MovieViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return display.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.movieCollectionView.delegate = self
        cell.configure(display: display[indexPath.section].movies)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MovieViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: MovieSectionHeaderView = tableView.dequeueReusableHeaderFooterView()
        header.configure(with: display[section].title)
        return header
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}

// MARK: - MovieCollectionViewDelegate

extension MovieViewController: MovieCollectionViewDelegate {
    
    public func movieColletionView(_ movieCollectionView: MovieCollectionView, didSelectItemAt at: Int) {
        print(movieCollectionView.display[at].content.title)
    }
}


