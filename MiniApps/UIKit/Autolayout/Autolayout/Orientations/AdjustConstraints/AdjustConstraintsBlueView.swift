//
//  AdjustConstraintsBlueView.swift
//  Autolayout
//
//  Created by Mustafa Bekirov on 28.01.2024.
//

import UIKit

class AdjustConstraintsBlueView: UIView {

    //
    // By capturing this constraints as variables, we can enable/disable them
    // later based on our devices orientation.
    //

    var topAnchorConstraint = NSLayoutConstraint()
    var centerYAnchorConstraint = NSLayoutConstraint()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        backgroundColor = .blue

        let label = makeLabel(withText: "Adjusting constraints", size: 24)

        addSubview(label)

        // Always enabled
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        // What we adjust when the orientation changes
        topAnchorConstraint = label.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        centerYAnchorConstraint = label.centerYAnchor.constraint(equalTo: centerYAnchor)

        adjustConstraints()
    }

    func adjustConstraints() {
        if UIApplication.shared.statusBarOrientation.isPortrait {
            topAnchorConstraint.isActive = true
            centerYAnchorConstraint.isActive = false
        } else {
            topAnchorConstraint.isActive = false
            centerYAnchorConstraint.isActive = true
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}
