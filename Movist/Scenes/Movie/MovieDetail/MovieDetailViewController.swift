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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.start().done { [weak self] movie in
        }
    }
}
