//
//  SearchButton.swift
//  Message-Center-App
//
//  Created by Katelyn Biniak on 5/15/23.
//

import UIKit
import Foundation

class SearchButton: UIButton {

    var loadingSpinner = UIActivityIndicatorView()
    
    @IBInspectable var isLoading: Bool = false {
        didSet {
            updateLoadingState()
        }
    }
    
    @IBInspectable var currentlyEnabledState: Bool = false {
        didSet {
            if currentlyEnabledState {
                self.enabledState()
            } else {
                self.disabledState()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSearchButton()
    }
    
    private func setupSearchButton() {
        layer.cornerRadius = self.frame.height / 2
        
        // Loading Spinner Setup
        loadingSpinner.hidesWhenStopped = true
        loadingSpinner.color = .white
        loadingSpinner.style = .medium
        
        addSubview(loadingSpinner)
        
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingSpinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])

        // Enabled State Initial Setup
        self.setTitleColor(UIColor.white, for: .normal)

        if currentlyEnabledState {
            self.enabledState()
        } else {
            self.disabledState()
        }
        
    }
    
    private func updateLoadingState() {
        if isLoading {
            loadingSpinner.startAnimating()
            self.titleLabel?.alpha = 0
            self.isEnabled = false
        } else {
            loadingSpinner.stopAnimating()
            self.titleLabel?.alpha = 1
            self.isEnabled = true
        }
    }
}

extension SearchButton {

    public func enabledState() {
        DispatchQueue.main.async {
            self.isEnabled = true
            self.backgroundColor = UIColor.mcAccentColor
            self.titleLabel?.font = UIFont(name: "Poppins", size: 16)
        }
    }
    
    public func disabledState() {
        DispatchQueue.main.async {
            self.isEnabled = false
            self.backgroundColor = UIColor.mcSteelBlue
            self.titleLabel?.font = UIFont(name: "Poppins", size: 16)
        }
    }

}
