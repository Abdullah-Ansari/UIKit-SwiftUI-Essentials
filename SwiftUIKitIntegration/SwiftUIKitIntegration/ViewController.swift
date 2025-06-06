//
//  ViewController.swift
//  SwiftUIKitIntegration
//
//  Created by Abdullah Ansari on 20/05/25.
//

import UIKit
import SwiftUI
import Combine

class ViewController: UIViewController {

    private var rating = Rating()
    private var cancellable: AnyCancellable?
    
    lazy var ratingLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = lbl.font.withSize(40)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupRatingView()
    }
    
    private func setupRatingView() {
        cancellable = rating.$value.sink(receiveValue: { [weak self] value in
            if let value = value {
                self?.ratingLabel.text = "\(value)"
            }
        })
        let ratingVC = UIHostingController(rootView: RatingView(rating: rating))
        guard let ratingView = ratingVC.view else { return }
        
        self.addChild(ratingVC)
        
        self.view.addSubview(ratingView)
        self.view.addSubview(ratingLabel)
        
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ratingView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        
        ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ratingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
    }
    
    @IBAction func onMoveToStock(_ sender: UIButton) {
        
        let vc = UIHostingController(rootView: StockListView())
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onMoveToDonut(_ sender: UIButton) {
        let vc = DonutTableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

struct ViewController_Representable: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


struct ViewController_Previews: PreviewProvider {
    
    static var previews: some View {
        ViewController_Representable()
    }
}
