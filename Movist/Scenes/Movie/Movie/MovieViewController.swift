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
    
    @IBOutlet private weak var imageView: UIImageView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie"
    }
    
    @IBAction func handleGoThird(_ sender: Any) {
        ThirdCoordinator().start()
    }
}
