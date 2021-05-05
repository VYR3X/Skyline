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

	let skySwitch: SkySwitch = {
		let sw = SkySwitch()
		sw.translatesAutoresizingMaskIntoConstraints = false
		sw.sky.isOn = true
		sw.sky.onTintColor = .sunflower
		sw.sky.thumbTintColor = .blueberry
		sw.sky.backgroundColor = .generalBrand
		return sw
	}()

	let pinPad = SkyPinPad()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBlue
		setupView()
	}

	@objc private func selectNewCurrency(sender: UIButton) {
		let viewController = UserGroupViewController()
//		self.present(viewController, animated: true, completion: nil)
		presentPanModal(viewController)
	}

	private func setupView() {
//		view.addSubview(currencyButton)
		view.addSubview(pinPad)
		view.addSubview(skySwitch)
		NSLayoutConstraint.activate([

			skySwitch.widthAnchor.constraint(equalTo: view.widthAnchor),
			skySwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			skySwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor),

//			currencyButton.widthAnchor.constraint(equalTo: view.widthAnchor),
//			currencyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//			currencyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

			pinPad.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			pinPad.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			pinPad.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}
