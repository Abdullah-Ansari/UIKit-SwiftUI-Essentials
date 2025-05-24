//
//  DonutTableViewController.swift
//  SwiftUIKitIntegration
//
//  Created by Abdullah Ansari on 25/05/25.
//

import UIKit
import SwiftUI

struct DonutCellView: View {
    
    let donut: Donut
    
    var body: some View {
        HStack {
            Image(donut.picture)
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(donut.name)
            Spacer()
            Image(systemName: "chevron.right")
            
        }
    }
}


struct Donut {
    let name: String
    let picture: String
}

class DonutTableViewController: UITableViewController {
    
    let donuts = [
        Donut(name: "Donut 1", picture: "1"),
        Donut(name: "Donut 2", picture: "2"),
        Donut(name: "Donut 3", picture: "3"),
        Donut(name: "Donut 4", picture: "4"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Donut"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DonutCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donuts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DonutCell", for: indexPath)
        let donut = donuts[indexPath.row]
        
        cell.contentConfiguration = UIHostingConfiguration(content: {
            DonutCellView(donut: donut)
        })
        
        return cell
    }
}
