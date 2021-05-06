//
//  PaletteViewController.swift
//  DesignSystemExample
//
//  Created by 17790204 on 06.05.2021.
//

import UIKit

struct SpecrtumPresentable: Equatable {
	let colorName: String
	let paletteColor: UIColor
}

final class PaletteViewController: UITableViewController {

	let members: [SpecrtumPresentable] = [
		SpecrtumPresentable(colorName: "generalPrimary", paletteColor: UIColor(hex: "#1A1A1A")),
		SpecrtumPresentable(colorName: "generalBrand", paletteColor: UIColor(hex: "#29B260")),
		SpecrtumPresentable(colorName: "backgroundDefault", paletteColor: UIColor(hex: "#FFFFFF")),
		SpecrtumPresentable(colorName: "backgroundOverlay", paletteColor: UIColor(hex: "#000000").withAlphaComponent(0.8)),

		SpecrtumPresentable(colorName: "onBackgroundPrimary", paletteColor: UIColor(hex: "#1A1A1A")),
		SpecrtumPresentable(colorName: "onBackgroundSecondary", paletteColor: UIColor(hex: "#757575")),
		SpecrtumPresentable(colorName: "onBackgroundTertiary", paletteColor: UIColor(hex: "#CCCCD0")),
		SpecrtumPresentable(colorName: "onBackgroundQuaternary", paletteColor: UIColor(hex: "#F5F5F6")),
		SpecrtumPresentable(colorName: "surfaceDefault", paletteColor: UIColor(hex: "#FFFFFF")),

		SpecrtumPresentable(colorName: "surfaceAccent", paletteColor: UIColor(hex: "#F5F5F6")),
		SpecrtumPresentable(colorName: "onSurfacePrimary", paletteColor: UIColor(hex: "#1A1A1A")),
		SpecrtumPresentable(colorName: "onSurfaceSecondary", paletteColor: UIColor(hex: "#757575")),
		SpecrtumPresentable(colorName: "onColorPrimary", paletteColor: UIColor(hex: "#FFFFFF")),
		SpecrtumPresentable(colorName: "onImagePrimary", paletteColor: UIColor(hex: "#FFFFFF")),

		SpecrtumPresentable(colorName: "helperError", paletteColor: UIColor(hex: "#FF3B30")),
		SpecrtumPresentable(colorName: "helperWarning", paletteColor: UIColor(hex: "#FF9500")),
		SpecrtumPresentable(colorName: "lentaSecondaryLight", paletteColor: UIColor(hex: "#FFFFFF").withAlphaComponent(0.74)),
		SpecrtumPresentable(colorName: "lentaTertiaryLight", paletteColor: UIColor(hex: "#FFFFFF").withAlphaComponent(0.32)),
		SpecrtumPresentable(colorName: "lentaSecondaryDark", paletteColor: UIColor(hex: "#1A1A1A").withAlphaComponent(0.55)),

		SpecrtumPresentable(colorName: "lentaTertiaryDark", paletteColor: UIColor(hex: "#1A1A1A").withAlphaComponent(0.20)),
		SpecrtumPresentable(colorName: "lentaQuaternaryDark", paletteColor: UIColor(hex: "#1A1A1A").withAlphaComponent(0.08)),
		SpecrtumPresentable(colorName: "lentaSnackbar", paletteColor: UIColor(hex: "#1A1A1A")),
		SpecrtumPresentable(colorName: "lentaTapOverlay", paletteColor: UIColor(hex: "#FFFFFF").withAlphaComponent(0.32)),
		SpecrtumPresentable(colorName: "poppy", paletteColor: UIColor(hex: "#F14F1D")),

		SpecrtumPresentable(colorName: "rose", paletteColor: UIColor(hex: "#E2236C")),
		SpecrtumPresentable(colorName: "lavender", paletteColor: UIColor(hex: "#9B32F6")),
		SpecrtumPresentable(colorName: "dewberry", paletteColor: UIColor(hex: "#5935F5")),
		SpecrtumPresentable(colorName: "blueberry", paletteColor: UIColor(hex: "#2D56F4")),
		SpecrtumPresentable(colorName: "cornflower", paletteColor: UIColor(hex: "#158CF9")),

		SpecrtumPresentable(colorName: "aqua", paletteColor: UIColor(hex: "#0BB8E3")),
		SpecrtumPresentable(colorName: "papaya", paletteColor: UIColor(hex: "#07BD98")),
		SpecrtumPresentable(colorName: "lime", paletteColor: UIColor(hex: "#42C737")),
		SpecrtumPresentable(colorName: "kiwi", paletteColor: UIColor(hex: "#81BA09")),
		SpecrtumPresentable(colorName: "sunflower", paletteColor: UIColor(hex: "#FFCC00")),

		SpecrtumPresentable(colorName: "fig", paletteColor: UIColor(hex: "#6C44BF"))
	]

	var isShortFormEnabled = true

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupTableView()
	}

	// MARK: - View Configurations

	func setupTableView() {
		tableView.separatorStyle = .none
		tableView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
		tableView.register(ColorCell.self, forCellReuseIdentifier: "cell")
	}

	// MARK: - UITableViewDataSource

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return members.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ColorCell
			else { return UITableViewCell() }

		cell.configure(with: members[indexPath.row])
		return cell
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60.0
	}

	// MARK: - UITableViewDelegate

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
