//
//  SizingConstraints.swift
//  
//
//  Created by Andrei Krotov on 07/05/2023.
//

import UIKit.NSLayoutConstraint

public extension UIView {

    // MARK: Whole Size

    @discardableResult
    func equalsSize(to view: UIView, multipliers: CGPoint) -> Self {
        equalsWidth(to: view, multiplier: multipliers.x).equalsHeight(to: view, multiplier: multipliers.y)
    }

    @discardableResult
    func equalsSize(to view: UIView, constants: CGPoint = .zero) -> Self {
        equalsWidth(to: view, constant: constants.x).equalsHeight(to: view, constant: constants.y)
    }

    @discardableResult
    func equalsSize(to constants: CGSize) -> Self {
        equalsWidth(to: constants.width).equalsHeight(to: constants.height)
    }

    // MARK: Ratio

    @discardableResult
    func equalsHeightToWidth(multiplier: CGFloat = 1) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        heightAnchor.constraint(equalTo: widthAnchor, multiplier: multiplier).isActive = true

        return self
    }

    // MARK: Width

    @discardableResult
    func equalsWidth(to view: UIView, multiplier: CGFloat = 1) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true

        return self
    }

    @discardableResult
    func equalsWidth(to view: UIView, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        widthAnchor.constraint(equalTo: view.widthAnchor, constant: constant).isActive = true

        return self
    }

    @discardableResult
    func equalsWidth(to constant: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        widthAnchor.constraint(equalToConstant: constant).isActive = true

        return self
    }

    // MARK: Height

    @discardableResult
    func equalsHeight(to view: UIView, multiplier: CGFloat = 1) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true

        return self
    }

    @discardableResult
    func equalsHeight(to view: UIView, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        heightAnchor.constraint(equalTo: view.heightAnchor, constant: constant).isActive = true

        return self
    }

    @discardableResult
    func equalsHeight(to constant: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        heightAnchor.constraint(equalToConstant: constant).isActive = true

        return self
    }
}
