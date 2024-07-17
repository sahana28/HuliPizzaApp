//
//  PhotoControllerViewController.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 26/06/24.
//

import UIKit
import SwiftUI

class PhotoController: UIViewController {
    let imageName = "0_lg"
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: imageName)
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
    }

}

struct PhotoView : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        PhotoController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
