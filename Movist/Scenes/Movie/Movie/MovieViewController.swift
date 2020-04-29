//
//  ViewController.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieViewController: UIViewController, ViewController {
    
    public static var storyboardName: UIStoryboard.Name = .movie
    
    @IBOutlet private weak var tableView: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie"
        prepareTableView()
    }
    
    private func prepareTableView() {
        tableView.registerCells(for: MovieTableViewCell.self)
    }
}

// MARK: - UITableViewDataSource

extension MovieViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
