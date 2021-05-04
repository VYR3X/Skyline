//
//  ViewController.swift
//  DesignSystemExample
//
//  Created by 17790204 on 04.05.2021.
//

import UIKit
import Skyline

final class ViewController: UIViewController {

	let skySeparatorView = SkySeparatorView()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBlue
		setupView()
	}

	private func setupView() {
		view.addSubview(skySeparatorView)
		NSLayoutConstraint.activate([
			skySeparatorView.widthAnchor.constraint(equalTo: view.widthAnchor),
			skySeparatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			skySeparatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
//		view.add
	}
}

