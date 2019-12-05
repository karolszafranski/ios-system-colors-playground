//
//  ColorsViewController.swift
//  SystemColors
//
//  Created by Karol Szafrański on 05.12.19.
//  Copyright © 2019 Karol Szafrański. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {

    let colors : [UIColor] = [
        .label,
        .secondaryLabel,
        .tertiaryLabel,
        .quaternaryLabel,
        .systemFill,
        .secondarySystemFill,
        .tertiarySystemFill,
        .quaternarySystemFill,
        .placeholderText,
        .systemBackground,
        .secondarySystemBackground,
        .tertiarySystemBackground
    ]

    let colorLabel = [
        "labelColor",
        "secondaryLabelColor",
        "tertiaryLabelColor",
        "quaternaryLabelColor",
        "systemFillColor",
        "secondarySystemFillColor",
        "tertiarySystemFillColor",
        "quaternarySystemFillColor",
        "placeholderTextColor",
        "systemBackgroundColor",
        "secondarySystemBackgroundColor",
        "tertiarySystemBackgroundColor"
    ]

    let imageAsABackground : Bool

    let scrollView = UIScrollView()
    let stack = UIStackView()

    required init?(coder: NSCoder) {
        self.imageAsABackground = false
        super.init(coder: coder)
    }

    init(imageAsABackground: Bool) {
        self.imageAsABackground = imageAsABackground
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Colors"
        view.backgroundColor = .systemBackground

        setupUI()
        setupColorViews();
        setupConstraints()
    }

    func setupUI() {
        stack.axis = .vertical
        view.addSubview(scrollView)
        scrollView.addSubview(stack)

        if imageAsABackground {
            // image taken from http://patternico.com/
            scrollView.backgroundColor = .init(patternImage: UIImage(named: "bgPattern")!)
        }
    }

    func setupColorViews() {
        for color in colors {
            let index = colors.firstIndex(of: color)!

            let colorView = ColorView()
            colorView.label.text = colorLabel[index]
            colorView.canvas.backgroundColor = color

            stack.addArrangedSubview(colorView)

            colorView.translatesAutoresizingMaskIntoConstraints = false
            colorView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            colorView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
    }

    func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stack.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

class ColorView : UIView {

    let label = UILabel()
    let canvas = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        let stack = UIStackView(arrangedSubviews: [label, canvas])
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
