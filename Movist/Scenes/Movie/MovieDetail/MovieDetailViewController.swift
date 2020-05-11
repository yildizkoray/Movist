//
//  SecondViewController.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 18.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieDetailViewController: UIViewController, ViewController {
    
    public static var storyboardName: UIStoryboard.Name = .movie
    
    public var viewModel: MovieDetailViewModel!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var movie: Movie!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        
        viewModel.start().done { [weak self] movie in
            guard let self = self else { return }
            self.movie = movie
        }
        .ensure { [weak self] in
            self?.view.stopLoadingIndicatorView()
            self?.tableView.setHidden(false, animated: true)
        }
        .cauterize()
    }
    
    private func prepareUI() {
        view.startLoadingIndicatorView()
        view.backgroundColor = UIColor(red: 47, green: 47, blue: 59)
        prepareNavigation()
        prepareTableView()
    }
    
    private func prepareNavigation() {
        
    }
    
    private func prepareTableView() {
        tableView.setHidden(true, animated: false)
    }
}
