//
//  ViewController.swift
//  MultithreadingTest
//
//  Created by Арсений Кухарев on 28.04.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    private var imageView: UIImageView!
    private var getImageButton: UIButton!
    private var image: UIImage!
    
    private lazy var guide = self.view.layoutMarginsGuide
    private let networkManager = NetworkManager()
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    //MARK: - SetupUI
    private func setupUI() {
        configureSelf()
        configureImageView()
        configureGetImageButton()
    }

    private func configureSelf() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func configureImageView(){
        imageView = UIImageView()
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: guide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
        ])
        
        imageView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    private func configureGetImageButton() {
        getImageButton = UIButton(configuration: .filled())
        getImageButton.configuration?.baseBackgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        getImageButton.configuration?.title = "Get Image"
        getImageButton.configuration?.baseForegroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.view.addSubview(getImageButton)
        getImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            getImageButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            getImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30)
        ])
        
        getImageButton.addTarget(self, action: #selector(getImageButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc
    private func getImageButtonTapped() {
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.networkManager.getImage { image in
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
                
            }
            
            
        }
        
    }
}

