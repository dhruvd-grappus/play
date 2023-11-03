//
//  ViewModel.swift
//  play
//
//  Created by Dhruv on 31/10/23.
//

import Foundation

enum StateStatus: Equatable {
    case initial
    case loading
    case success
    case error(String?)
}

class ViewModel: ObservableObject {
    @Published var status: StateStatus = .initial
}
