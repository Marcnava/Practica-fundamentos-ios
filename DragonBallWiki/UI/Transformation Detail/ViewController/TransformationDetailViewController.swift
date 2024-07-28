//
//  TransformationDetailViewController.swift
//  DragonBallWiki
//
//  Created by Marc Navarro on 5/7/24.
//

import UIKit

class TransformationDetailViewController: UIViewController {
    @IBOutlet weak var transformationImage: UIImageView!
    @IBOutlet weak var transformationNameLabel: UILabel!
    @IBOutlet weak var transformationDescriptionLabel: UILabel!
    
    let transformation: Transformation
    
    init(transformation: Transformation) {
        self.transformation = transformation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = transformation.name
        transformationNameLabel.text = transformation.name
        transformationNameLabel.textColor = .white
        transformationDescriptionLabel.text = transformation.description
        transformationDescriptionLabel.textColor = .white
        transformationDescriptionLabel.numberOfLines = 0
        transformationImage.kf.setImage(with: transformation.photo)
    }

}
