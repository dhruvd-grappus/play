//
//  FeedViewModel.swift
//  play
//
//  Created by Jai Nijhawan on 07/11/23.
//

import Foundation

struct CategoryDataSournce: Equatable {
    let title: String
    var isSelected: Bool
}

@MainActor
class FeedViewModel: ObservableObject {
    var previousSelctedIndex = 0
    
    @Published var categoryDataSournce: [CategoryDataSournce] =
    [CategoryDataSournce(title: "For You", isSelected: true),
     CategoryDataSournce(title: "Read", isSelected: false),
     CategoryDataSournce(title: "Watch", isSelected: false),
     CategoryDataSournce(title: "List", isSelected: false),
     CategoryDataSournce(title: "Jai", isSelected: false),
     CategoryDataSournce(title: "Nayab", isSelected: false),
     CategoryDataSournce(title: "Dhruv", isSelected: false)]
    
    @Published var feedData: [String] = ["JAI", "JAI","JAI","JAI","JAI"] //FeedDataModel? = nil
    
    func updateCategory(category: CategoryDataSournce) {
        togglePreviousCategory()
        if let index =  categoryDataSournce.firstIndex(of: category) {
            categoryDataSournce[index] = CategoryDataSournce(title: category.title, isSelected: !category.isSelected)
            previousSelctedIndex = index
        }
    }
    private func togglePreviousCategory() {
        let previousCategory = categoryDataSournce[previousSelctedIndex]
        categoryDataSournce[previousSelctedIndex] = CategoryDataSournce(title: previousCategory.title, isSelected: !previousCategory.isSelected)
    }
}
