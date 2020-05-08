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
    
    private var display: [MoviePopularDisplay] = .empty() { // TODO: - Change MoviePopularDisplay, make generic
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
            self?.tableView.isHidden = false
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
        view.backgroundColor = UIColor(red: 29, green: 29, blue: 39)
        prepareNavigation()
        prepareTableView()
    }
    
    private func prepareNavigation() {
        title = Constants.title
    }
    
    private func prepareTableView() {
        tableView.isHidden = true
        tableView.addRefresher(color: .white, selector: #selector(refresh))
        tableView.registerCells(for: MovieTableViewCell.self)
    }
}

// MARK: - UITableViewDataSource

extension MovieViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return display.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(movieDisplay: display[indexPath.row].movies)
        return cell
    }
}
