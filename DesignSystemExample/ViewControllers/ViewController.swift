//
//  ViewController.swift
//  DesignSystemExample
//
//  Created by Vladislav Zhokhov on 04.05.2021.
//

import UIKit
import Skyline

final class ViewController: UIViewController {

	let skySeparatorView = SkySeparatorView()

	private lazy var currencyButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .white
		button.layer.cornerRadius = 3
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOpacity = 0.5
		button.layer.shadowOffset = .zero
		button.layer.shadowRadius = 1
		button.addTarget(self, action: #selector(selectNewCurrency(sender:)), for: .touchUpInside)
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBlue
		setupView()
	}

	@objc private func selectNewCurrency(sender: UIButton) {
		let viewController = UserGroupViewController()
		self.present(viewController, animated: true, completion: nil)
	}

	private func setupView() {
		view.addSubview(currencyButton)
		NSLayoutConstraint.activate([
			currencyButton.widthAnchor.constraint(equalTo: view.widthAnchor),
			currencyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			currencyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
//		view.add
	}
}

