//
//  ViewController.swift
//  SwiftUIKitIntegration
//
//  Created by Abdullah Ansari on 20/05/25.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onMoveToStock(_ sender: UIButton) {
        
        let vc = UIHostingController(rootView: StockListView())
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

