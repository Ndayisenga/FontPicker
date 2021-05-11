//
//  ViewController.swift
//  FontPicker
//
//  Created by Ndayisenga Jean Claude on 11/05/2021.
//

import UIKit

class ViewController: UIViewController, UIFontPickerViewControllerDelegate {
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        label.text = "John is a fucking asshole he can do anything with a great choice  i really enjy the best moment with this man he make you laugh while crying again John is a fucking asshole he can do anything with a great choice  i really enjy the best moment with this man he make you laugh while crying "
        
        return label
        
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Pick  Font", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapPickFont), for: .touchUpInside)
         }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(
            x: 10,
            y: view.safeAreaInsets.top,
            width: view.frame.size.width-20,
            height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 100
        )
        button.frame = CGRect(x: 20, y: view.frame.size.height-100, width: view.frame.size.width-40, height: 50)
    }
    @objc private func didTapPickFont() {
        let config = UIFontPickerViewController.Configuration()
        config.includeFaces = false
        let vc = UIFontPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
        guard let descriptor = viewController.selectedFontDescriptor else {
            return
        }
        label.font = UIFont(
        descriptor: descriptor,
            size: 24
        )
    }

}

