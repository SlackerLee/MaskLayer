//
//  ContentView.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    let maskList = MaskItem.preview()
    
    var body: some View {
        NavigationView {
            
            List {
                //Section 1
                Section {
                    ForEach(maskList) { item in
                        
                        NavigationLink {
                            if item.id == 0 {
                                RectFocusingMask()
                            } else if item.id == 1 {
                                CircleImageMask()
                            } else if item.id == 2 {
                                StarMask()
                            } else if item.id == 3 {
                                SawtoothRectMask()
                            } else if item.id == 4 {
                                SawtoothCircleMask()
                            }
                        } label: {
                            HStack {
                                Text(item.name)
                                Spacer()
                                Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                } header: {
                    Text("Mask Layout").foregroundColor(.gray)
                } footer: {
                    Text("").foregroundColor(.gray)
                }
                //Section 2
                Section {
                    Text("Date: \(getCurrentTime())")
                } header: {
                    Text("Setting").foregroundColor(.gray)
                } footer: {
                    Text("Version 1.0.0.").foregroundColor(.gray)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    private func getCurrentTime() -> String {
        let now = Date()

        let formatter = DateFormatter()

        formatter.timeZone = TimeZone.current

        formatter.dateFormat = "yyyy-MM-dd"

        let dateString = formatter.string(from: now)
        return dateString
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
