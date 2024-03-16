//
//  LoaderViewController.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import UIKit

class LoaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoader()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLoader()
    }

    func startAnimating() {
        loader.startAnimating()
        isHidden = false
    }

    func stopAnimating() {
        loader.stopAnimating()
        isHidden = true
    }

    // MARK: - Private

    private let loader = UIActivityIndicatorView(style: .large)
    
    private func setupLoader() {
        // Configure loader
        loader.color = .gray
        loader.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loader)

        // Center loader in the view
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
