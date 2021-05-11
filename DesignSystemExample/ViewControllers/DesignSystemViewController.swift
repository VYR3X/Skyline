//
//  DesignSystemViewController.swift
//  DesignSystemExample
//
//  Created by 17790204 on 11.05.2021.
//

import Skyline
import UIKit

final class DesignSystemViewController: BaseViewController {

	private struct Constants {
		static let maxNumberOfImagesInPack = 3
		static let imageName = "blondie"
		static let horizontalSpacing: CGFloat = 10
		static let buttonHorizontalInset: CGFloat = 10
	}

//	private lazy var player = makePlayer()

	override func construct() {
		addAllBlocks()
		addImagesPackView()
		addPinPad()
		addButtons()
//		addAllTextInputs()
//		addSearchView()
//		addCutoutView()
//		addShimmer()
//
//		addErrorView()
//		addSignedImage()
//
//		 Добавлять последним
//		addPlayer()
	}

	private func addAllBlocks() {
		addHeader(with: "Block")

		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.backgroundColor = .yellow
		stackView.spacing = 8
		stackView.alignment = .center
		stackView.axis = .horizontal

		addElement(stackView, height: nil, leading: nil)
	}

	private func addButtons() {
		addHeader(with: "Button")

		let button1: SkyButton = {
			let button = SkyButton(skytype: .secondary(size: .large))
			button.sky.text = "secondary"
			return button
		}()

		let button2: SkyButton = {
			let button = SkyButton(skytype: .primary(size: .large))
			button.sky.text = "primary"
			return button
		}()

		let button3: SkyButton = {
			let button = SkyButton(skytype: .base)
			button.sky.text = "base"
			return button
		}()

		let button4: SkyButton = {
			let button = SkyButton(skytype: .text)
			button.sky.text = "text"
			return button
		}()

		addElement(button1, height: nil)
		addElement(button2, height: nil)
		addElement(button3, height: nil)
		addElement(button4, height: nil)
	}

//	private func makeOpinion(type: OpinionBlockType) -> GBlock<OpinionItemType> {
//		let opinion = GBlock<OpinionItemType>(type: .opinion(type: type))
//		opinion.g.didTapItemHadler = { [weak self] _ in
//			self?.defaultTapHandler()
//		}
//		return opinion
//	}

//	private func addAllTextInputs() {
//		addHeader(with: "Text Input")
//
//		let defaultInput = addTextInput(text: "Default")
//		defaultInput.g.options = [.caption]
//
//		let disabledInput = addTextInput(text: nil, placeholder: "Disabled")
//		disabledInput.g.isEnabled = false
//		disabledInput.g.options = [.footnote]
//
//		let errorInput = addTextInput(text: "Error")
//		if let sample = UIImage(named: "sample") {
//			errorInput.leadingImageView.g.picture = .logo(image: sample)
//		}
//		errorInput.g.state = .error
//		errorInput.g.options = .all
//	}

//	private func addTextInput(text: String?, placeholder: String = "Placeholder") -> GTextInput {
//		let input = GTextInput()
//		input.g.backgroundColor = .backgroundDefault
//		input.textField.g.text = text
//		input.textField.g.placeholder = placeholder
//		input.captionLabel.g.text = "Caption"
//		input.footnoteLabel.g.text = "Footnote"
//		addElement(input, height: nil)
//		return input
//	}

	private func addPinPad() {
		addHeader(with: "Pin Pad")
		let pinpad = SkyPinPad()
		addElement(pinpad, height: nil, leading: 80)
	}

//	private func addErrorView() {
//		addHeader(with: "Error view")
//
//		let view = GErrorView(type: .inplace)
//		view.g.picture = Logo.warning.picture
//		view.g.title = "Что-то пошло не так"
//		view.g.message = "Попробуйте перезагрузить страницу, \nа мы исправим ошибку"
//		view.g.actionText = "Перезагрузить"
//		view.g.actionHandler = defaultTapHandler
//
//		addElement(view, height: nil)
//	}

//	private func addSearchView() {
//		addHeader(with: "Search View")
//		let searchView = GSearchView(searchType: .withDisappearingCancelButton, textFieldType: .searchWithClearButton)
//		searchView.cancelButton.g.addHandler(for: .touchUpInside, handler: defaultTapHandler)
//		addElement(searchView, height: nil)
//	}

//	private func addCutoutView() {
//		addHeader(with: "CutoutView")
//
//		let view = GCutoutView()
//		view.g.backgroundColor = .backgroundDefault
//		view.g.cutoutRadius = 24
//		view.g.cornerRadius = .large
//		view.g.shiftCutout = 0.6
//		view.g.shadow = .article
//		if let image = UIImage(named: "background") {
//			view.g.picture = .logo(image: image)
//		}
//		addElement(view, height: 80)
//	}

//	private func addShimmer() {
//		addHeader(with: "Shimmer")
//
//		let view = GShimmerView()
//		view.g.cornerRadius = .medium
//		view.g.position = .diagonally
//		view.g.direction = .direct
//		addElement(view, height: 80)
//	}

	private func addImagesPackView() {
		addHeader(with: "Images pack")

		let imagesPack = SkyImagesPackView()
		imagesPack.sky.imageSide = 44
		imagesPack.sky.imagesOverlay = 12
//		if let sampleImage = UIImage(named: Constants.imageName) {}
		imagesPack.sky.plusCounterValue = 3
		imagesPack.setContentCompressionResistancePriority(.required, for: .horizontal)

		let leadingView = SkyButton(skytype: .secondary(size: .large))
		leadingView.sky.text = "Take away"
//		leadingView.contentInsets = UIEdgeInsets(horizontal: Constants.buttonHorizontalInset)
		leadingView.sky.addHandler(for: .touchUpInside) { [weak imagesPack] in
			guard let imagesPack = imagesPack else { return }
			if imagesPack.sky.plusCounterValue > 0 {
				imagesPack.sky.plusCounterValue -= 1
			} else {
				if !imagesPack.sky.pictures.isEmpty {
					imagesPack.sky.pictures.removeLast()
				}
			}
		}

		let trailingView = SkyButton(skytype: .secondary(size: .large))
		trailingView.sky.text = "Append"
//		trailingView.contentInsets = UIEdgeInsets(horizontal: Constants.buttonHorizontalInset)
		trailingView.sky.addHandler(for: .touchUpInside) { [weak imagesPack] in
			guard let imagesPack = imagesPack else { return }
			if imagesPack.sky.pictures.count < Constants.maxNumberOfImagesInPack {
//				imagesPack.g.pictures.append(.logo(image: image))
			} else {
				imagesPack.sky.plusCounterValue += 1
			}
		}

		let wrapper = UIStackView(arrangedSubviews: [leadingView, imagesPack, trailingView])
		wrapper.translatesAutoresizingMaskIntoConstraints = false
		wrapper.axis = .horizontal
		wrapper.spacing = Constants.horizontalSpacing

		addElement(wrapper, height: nil, leading: nil)
	}

//	private func addSignedImage() {
//		addHeader(with: "Signed Image")
//
//		let rating = GSignedImageView(type: .rating)
//		rating.label.g.text = "5.0"
//		addElement(rating, height: nil, leading: nil)
//	}

//	private func addPlayer() {
//		addHeader(with: "Player")
//
//		g.auxiliary.show(player, animated: false)
//
//		let button = GButton(gtype: .primary(size: .medium))
//		button.g.text = "Show player"
//		button.g.addHandler(for: .touchUpInside) { [weak self] in
//			guard let self = self else { return }
//			self.g.auxiliary.show(self.player)
//		}
//		addElement(button, height: nil, leading: nil)
//		addElement(GView(), height: GAppearence.Player.height)
//	}

//	private func makePlayer() -> GPlayer {
//		let player = GPlayer()
//		player.g.title = "Новинки проката 2019 года, а потом суп с котом"
//
//		let timerValues = ["", "Идеи для семьи"]
//		let ticker = Ticker(action: { value in
//			let subtitle = timerValues[value % timerValues.count]
//			player.g.subtitle = subtitle
//		}, timeInterval: 1.7)
//
//		player.g.closeHandler = { [weak self] in
//			ticker.kill()
//			self?.g.auxiliary.hide()
//		}
//		return player
//	}
}

