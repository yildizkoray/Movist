//
//  ViewController.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import PromiseKit

public final class MovieViewController: UIViewController, ViewController {
    
    public static var storyboardName: UIStoryboard.Name = .movie
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var display: MoviePopularDisplay = .empty {
        didSet {
            tableView.reloadData()
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie"
        
        view.backgroundColor = UIColor(red: 29, green: 29, blue: 39)
        
        prepareTableView()
        
        getMovieDetail().done { display in
            self.display = display
        }.cauterize()
    }
    
    private func prepareTableView() {
        tableView.registerCells(for: MovieTableViewCell.self)
    }
    
    private func getMovieDetail() -> Promise<MoviePopularDisplay> {
        
        let popular: Promise<Popular> = RestAPI.shared.readJSONFile(from: "Movie_Popular")
        return popular.map(MoviePopularDisplay.init)
    }
}

// MARK: - UITableViewDataSource

extension MovieViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 300
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(movieDisplay: display.movies)
        return cell
    }
}
