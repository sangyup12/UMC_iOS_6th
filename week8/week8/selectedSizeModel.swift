//
//  selectedSizeModel.swift
//  week8
//
//  Created by 이상엽 on 5/30/24.
//

import Foundation
import Combine

class SelectedSizeModel: ObservableObject {
    @Published var selectedButtons: [String] = []
}
