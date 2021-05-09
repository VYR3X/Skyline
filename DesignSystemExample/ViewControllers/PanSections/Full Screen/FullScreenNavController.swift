//
//  FullScreenNavController.swift
//  DesignSystemExample
//
//  Created by 17790204 on 09.05.2021.
//

import UIKit
import Skyline

class FullScreenNavController: UINavigationController {

	override func viewDidLoad() {
		super.viewDidLoad()
		pushViewController(FullScreenViewController(), animated: false)
	}
}

extension FullScreenNavController: PanModalPresentable {

	var panScrollable: UIScrollView? {
		return nil
	}

	var topOffset: CGFloat {
		return 0.0
	}

	var springDamping: CGFloat {
		return 1.0
	}

	var transitionDuration: Double {
		return 0.4
	}

	var transitionAnimationOptions: UIView.AnimationOptions {
		return [.allowUserInteraction, .beginFromCurrentState]
	}

	var shouldRoundTopCorners: Bool {
		return false
	}

	var showDragIndicator: Bool {
		return false
	}
}

private class FullScreenViewController: UIViewController {

	let textLabel: UILabel = {
		let label = UILabel()
		label.text = "Drag downwards to dismiss"
		label.font = UIFont(name: "Lato-Bold", size: 17)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Full Screen"
		view.backgroundColor = .white
		setupConstraints()
	}

	private func setupConstraints() {
		view.addSubview(textLabel)
		textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}

}
