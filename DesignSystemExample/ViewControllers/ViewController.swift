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

	let skyImagesPackView: SkyImagesPackView = {
		let imagesPack = SkyImagesPackView()
		imagesPack.sky.imageSide = 44
//		imagesPack.g.imagesOverlay = 12
		let sampleImage = UIImage()
//		imagesPack.g.plusCounterValue = 3
		imagesPack.setContentCompressionResistancePriority(.required, for: .horizontal)
		return imagesPack
	}()


	let button: SkyButton = {
		let button = SkyButton(skytype: .primary(size: .large))
//		let button = SkyButton(skytype: .text)
		button.sky.text = "Кнопка"
		button.sky.textColor = .backgroundDefault
		button.sky.backgroundColor = .generalBrand
		return button
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
		view.addSubview(button)
		NSLayoutConstraint.activate([

//			button.heightAnchor.constraint(equalToConstant: 30),
			button.widthAnchor.constraint(equalTo: view.widthAnchor),
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button.centerYAnchor.constraint(equalTo: view.centerYAnchor),

//			currencyButton.widthAnchor.constraint(equalTo: view.widthAnchor),
//			currencyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//			currencyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

			pinPad.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
			pinPad.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
			pinPad.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
		])
	}
}
