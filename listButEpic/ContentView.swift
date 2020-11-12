//
//  ContentView.swift
//  listButEpic
//
//  Created by Matthew Pietrucha on 11/11/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    @State var totalClicked: Int = 0
    
    var searchBar : some View {
        HStack {
            TextField("Enter in a new task", text: self.$newToDo)
            Button(action: self.addNewToDo, label: {
                Text("add New")
            })
        }
    }
    
    func addNewToDo() {
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1),toDoItem: newToDo))
        self.newToDo = ""
    }
    
    
    var body: some View {
        HStack {
            NavigationView{
                VStack {
                    searchBar.padding()
                    List() {
                        ForEach(self.taskStore.tasks) { task in
                            Text(task.toDoItem)
                        }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                    }.navigationBarTitle("Tasks")
                    .navigationBarItems(trailing: EditButton())

                    
                    Text("\(totalClicked)").font(.title)
                    Spacer()
                    Button(action: {self.totalClicked = Int.random(in: 1..<999999)}) {
                        Text("Random Number Generator")
                        
                        
                    }
                }

            }
        }
    }
    func move(from source : IndexSet, to destination : Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at offsets : IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
