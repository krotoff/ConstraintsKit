//
//  SpacingConstraints.swift
//  
//
//  Created by Andrei Krotov on 07/05/2023.
//

import UIKit.NSLayoutConstraint

public extension UIView {

    // MARK: Alignment

    @discardableResult
    func align(
        with view: UIView,
        edges: UIRectEdge = .all,
        insets: UIEdgeInsets = .zero,
        isInSafeArea: Bool = false
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        if edges.contains(.bottom) {
            let anchor = isInSafeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor
            bottomAnchor.constraint(equalTo: anchor, constant: -insets.bottom).isActive = true
        }
        if edges.contains(.left) {
            let anchor = isInSafeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor
            leadingAnchor.constraint(equalTo: anchor, constant: insets.left).isActive = true
        }
        if edges.contains(.right) {
            let anchor = isInSafeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor
            trailingAnchor.constraint(equalTo: anchor, constant: -insets.right).isActive = true
        }
        if edges.contains(.top) {
            let anchor = isInSafeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor
            topAnchor.constraint(equalTo: anchor, constant: insets.top).isActive = true
        }

        return self
    }

    // MARK: Centering

    @discardableResult
    func center(with view: UIView, constants: CGPoint = .zero) -> Self {
        centerHorizontally(with: view, constant: constants.x).centerVertically(with: view, constant: constants.y)
    }

    @discardableResult
    func centerHorizontally(with view: UIView, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true

        return self
    }

    @discardableResult
    func centerVertically(with view: UIView, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true

        return self
    }

    // MARK: Spacing

    @discardableResult
    func spacingToLeading(of view: UIView, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -constant).isActive = true

        return self
    }

    @discardableResult
    func spacingToTrailing(of view: UIView, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true

        return self
    }

    @discardableResult
    func spacingToBottom(of view: UIView, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true

        return self
    }

    @discardableResult
    func spacingToTop(of view: UIView, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        bottomAnchor.constraint(equalTo: view.topAnchor, constant: -constant).isActive = true

        return self
    }
}
