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
    
    private var display: MoviePopularDisplay = .empty {
        didSet {
            tableView.reloadData()
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        
        viewModel.popular().done { [weak self] display in
            self?.display = display
        }.ensure {
            self.tableView.isHidden = false
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
        tableView.registerCells(for: MovieTableViewCell.self)
    }
}

// MARK: - UITableViewDataSource

extension MovieViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(movieDisplay: display.movies)
        return cell
    }
}
