//
//  SkySeparatorView.swift
//  Skyline
//
//  Created by Vladislav Zhokhov on 04.05.2021.
//

import CoreGraphics
import UIKit

/// Разделитель
public final class SkySeparatorView: UIView {

	private enum Constants {
		static let height: CGFloat = 0.5
	}

//	init(style: GStyle) {
//		super.init(style: style)
//		setup()
//	}

	public init() {
		super.init(frame: .zero)
		setup()
	}

	private func setup() {
		self.backgroundColor = .black
//		self.backgroundColor = .lentaQuaternaryDark
		self.heightAnchor.constraint(equalToConstant: Constants.height).activate()
//		heightAnchor.constraint(equalToConstant: Constants.height).activate()
	}
}

