//
//  ReviewDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 21.06.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public final class ReviewDisplay {
    
    public let author: String
    public let comment: String
    
    public init(review: Movie.Review) {
        self.author = review.author.emptyIfNil
        self.comment = review.content.emptyIfNil
    }
    
    private init() {
        author = .empty
        comment = .empty
    }
}
