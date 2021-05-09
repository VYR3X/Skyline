//
//  BasicViewController.swift
//  DesignSystemExample
//
//  Created by 17790204 on 09.05.2021.
//

import UIKit
import Skyline

class BasicViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.1137254902, blue: 0.1294117647, alpha: 1)
	}
}

extension BasicViewController: PanModalPresentable {

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

	var panScrollable: UIScrollView? {
		return nil
	}

	var longFormHeight: PanModalHeight {
		return .maxHeightWithTopInset(200)
	}

	var anchorModalToLongForm: Bool {
		return false
	}
}

