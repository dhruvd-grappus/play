//
//  ViewModel.swift
//  play
//
//  Created by Dhruv on 31/10/23.
//

import Foundation

enum Status {
    case initial
    case loading
    case success
}

class ViewModel: ObservableObject {
    @Published var status: Status = .initial

    @Published var error: String?
}
