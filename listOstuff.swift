//
//  listOstuff.swift
//  listButEpic
//
//  Created by Matthew Pietrucha on 11/11/20.
//

import SwiftUI
import Foundation
import Combine

struct Task : Identifiable {
    var id = String()
    var toDoItem = String()
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}
