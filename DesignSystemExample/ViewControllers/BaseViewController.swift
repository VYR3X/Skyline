//
//  BaseViewController.swift
//  DesignSystemExample
//
//  Created by Vladislav Zhokhov on 11.05.2021.
//

import UIKit

class BaseViewController: UIViewController {

	private(set) lazy var defaultTapHandler: () -> Void = { [weak self] in
		self?.showTestAlert()
	}

	private let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.backgroundColor = .white
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.spacing = 4
		stackView.alignment = .center
		stackView.axis = .vertical
		return stackView
	}()

	private let scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.backgroundColor = .white
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.keyboardDismissMode = .onDrag
		scrollView.showsVerticalScrollIndicator = false
		return scrollView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		addElement(UIView(), height: 70)
		setupViews()
		construct()
		addElement(UIView(), height: 20)
	}

	func construct() {}

	func addHeader(with title: String) {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = title
		label.backgroundColor = .systemGray6
		label.textAlignment = .center
		addElement(label, height: 60, leading: 0)
	}

	func addSubHeader(with title: String) {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = title
		addElement(label, height: 40)
	}

	func showTestAlert() {
		let alert = UIAlertController(title: nil, message: "Oh my, it works!",
									  preferredStyle: .actionSheet)
		present(alert, animated: true, completion: nil)
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			alert.dismiss(animated: true, completion: nil)
		}
	}

	func addElement(_ view: UIView, height: CGFloat?, leading: CGFloat? = 10) {
		view.translatesAutoresizingMaskIntoConstraints = false
		stackView.addArrangedSubview(view)
		var constraints = [NSLayoutConstraint]()
		if let height = height {
			constraints.append(view.heightAnchor.constraint(equalToConstant: height))
		}
		if let leading = leading {
			constraints.append(view.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: leading))
		}
		NSLayoutConstraint.activate(constraints)
	}

	private func setupViews() {
		view.addSubview(scrollView)
		scrollView.addSubview(stackView)
		let heightConstarint = stackView.heightAnchor.constraint(equalToConstant: 0)
		heightConstarint.priority = .init(1)
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
			stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

			heightConstarint
		])
	}
}

extension String {
	func capitalizingFirstLetter() -> String {
		return prefix(1).uppercased() + lowercased().dropFirst()
	}
}

