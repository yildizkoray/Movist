//
//  TestViewController.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 24.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import PromiseKit

private struct Constants {
    
    struct Gradient {
        static let color: [UIColor] = [.clear, UIColor(red: 47, green: 47, blue: 59, alpa: 1.0)]
        static let points = (start: CGPoint(x: 0.5, y: .zero), end: CGPoint(x: 0.5, y: 1))
        static let locations: [NSNumber] = [0.5, 0.8]
    }
}

public final class TestViewController: UIViewController, ViewController {
    
    public static var storyboardName: UIStoryboard.Name = .movie
    
    @IBOutlet weak var reviewView: ReviewView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
//        start().done { [weak self] display in
//            self?.reviewView.configure(with: display.reviews[1])
//            
//        }.cauterize()
    }
    
//    public func start() -> Promise<MovieDetailDisplay> {
//        let movie: Promise<Movie> = serexecute(with: GetMovieDetailTask(id: 278, appendToResponse: [.review]))
//        return movie.map(MovieDetailDisplay.init)
//    }
}
