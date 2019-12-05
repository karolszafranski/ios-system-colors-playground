//
//  ViewController.swift
//  SystemColors
//
//  Created by Karol Szafrański on 05.12.19.
//  Copyright © 2019 Karol Szafrański. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let backgroundOffButton = UIButton(type: .system)
    let backgroundOnButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        backgroundOffButton.setTitle("Background Off", for: .normal)
        backgroundOffButton.addTarget(self, action: #selector(buttonTouchedUpInside), for: .touchUpInside)
        backgroundOffButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundOffButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        backgroundOffButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

        backgroundOnButton.setTitle("Background On", for: .normal)
        backgroundOnButton.addTarget(self, action: #selector(buttonTouchedUpInside), for: .touchUpInside)
        backgroundOnButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundOnButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        backgroundOnButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

        let stack = UIStackView(arrangedSubviews: [backgroundOffButton, backgroundOnButton])
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.axis = .vertical

        view.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func buttonTouchedUpInside(sender: Any) {
        let vc = ColorsViewController(imageAsABackground: (sender as? UIButton) == backgroundOnButton)
        navigationController?.pushViewController(vc, animated: true)
    }

}

