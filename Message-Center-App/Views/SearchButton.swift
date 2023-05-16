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

    // MARK: Init Overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSearchButton()
    }
    
    // MARK: Setup Methods
    private func setupSearchButton() {
        layer.cornerRadius = self.frame.height / 2
        
        // Loading Spinner Setup
        loadingSpinner.hidesWhenStopped = true
        loadingSpinner.color = .white
        loadingSpinner.style = .medium
        
        addSubview(loadingSpinner)
        
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingSpinner.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -60),
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
            self.isEnabled = false
            self.setTitle("Searching", for: .normal)
        } else {
            loadingSpinner.stopAnimating()
            self.setTitle("Search", for: .normal)
            self.isEnabled = true
        }
    }
}

// MARK: Public Methods
extension SearchButton {

    @objc
    public func enabledState() {
        DispatchQueue.main.async {
            self.isEnabled = true
            self.backgroundColor = UIColor.mcAccentColor
            self.titleLabel?.font = UIFont(name: "Poppins", size: 16)
        }
    }
    
    @objc
    public func disabledState() {
        DispatchQueue.main.async {
            self.isEnabled = false
            self.backgroundColor = UIColor.mcSteelBlue
            self.titleLabel?.font = UIFont(name: "Poppins", size: 16)
        }
    }

}
