//
//  ButtonDescriptor.swift
//  Skyline
//
//  Created by 17790204 on 06.05.2021.
//

import UIKit
import CoreGraphics

/// Описание кнопки
public protocol ButtonDescriptor {

	/// Сконфигурировать кнопку
	///
	/// - Parameter button:  кнопка, которую нужно сконфигурировать
	func configure(_ button: SkyButton)
}

/// Базовое описание кнопки
open class BaseButtonDescriptor: ButtonDescriptor {

	/// Размер кнопки
	public let size: SkyButtonSize
	/// Иконка
	public let icon: UIImage?

	/// Конструктор
	///
	/// - Parameters:
	///   - size: размер кнопки
	///   - icon: иконка
	public init(size: SkyButtonSize,
				icon: UIImage? = nil) {
		self.size = size
		self.icon = icon
	}

	open func configure(_ button: SkyButton) {
//		button.sky.font = .button
		button.sky.clipsToBounds = true
//		button.sky.blurred = false
		button.sky.size = size
//		button.sky.removeAllAssociations()

		let initialTransform = button.sky.transform
//		let scale = GAppearence.Button.tapScale

//		button.sky.associate(states: .default, .selected) { g in
//			g.transform = initialTransform
//			g.overlay.state = .inactive
//			g.isEnabled = true
//		}
//		button.sky.associate(states: .disabled) { g in
//			g.transform = initialTransform
//			g.isEnabled = false
//		}
//		button.sky.associate(states: .pressed) { g in
//			if case .large = g.size {
//				g.transform = initialTransform.scaledBy(x: scale, y: scale)
//			}
//			g.overlay.state = .aboveAll
//			g.isEnabled = true
//		}

		switch size {
		case .medium:
			print("medium button")
//			button.sky.cornerRadius = .circle
//			let padding = button.sky.layout.value(horizontalPadding: .molecule)
//			button.g.contentInsets = GInsets(horizontal: padding)
//			button.sky.gap = .text
		case .large:
			print("large button")
//			button.sky.cornerRadius = .small
		}
	}
}

/// Описание главной кнопки
final class PrimaryButtonDescriptor: BaseButtonDescriptor {
	override func configure(_ button: SkyButton) {
		super.configure(button)
//		button.g.associate(states: .default, .pressed) { g in
//			g.textColor = .backgroundDefault
//			g.backgroundColor = .generalPrimary
//			g.picture?.repaint(to: g.textColor)
//		}
//		button.g.associate(states: .disabled) { g in
//			g.textColor = .lentaSecondaryLight
//			g.backgroundColor = .onBackgroundTertiary
//			g.picture?.repaint(to: g.textColor)
//		}
	}
}

/// Описание вторичной кнопки
final class SecondaryButtonDescriptor: BaseButtonDescriptor {
	override func configure(_ button: SkyButton) {
		super.configure(button)
//		button.g.backgroundColor = .onBackgroundQuaternary
//		button.g.associate(states: .default, .pressed) { g in
//			g.textColor = .onSurfaceSecondary
//			g.picture?.repaint(to: g.textColor)
//		}
//		button.g.associate(states: .disabled) { g in
//			g.textColor = .lentaTertiaryDark
//			g.picture?.repaint(to: g.textColor)
//		}
	}
}

/// Описание кнопки Floating
final class FloatingButtonDescriptor: BaseButtonDescriptor {
	override func configure(_ button: SkyButton) {
		super.configure(button)
//		button.g.mode = .spring
//		button.g.backgroundColor = .surfaceDefault
//		button.g.shadow = .small
//		button.g.associate(states: .default, .pressed) { g in
//			g.textColor = .onSurfacePrimary
//			g.picture?.repaint(to: g.textColor)
//		}
//		button.g.associate(states: .pressed, .disabled) { g in
//			g.textColor = .onSurfaceSecondary
//		}
	}
}

/// Описание  кнопки c текстом
final class TextButtonDescriptor: ButtonDescriptor {
	func configure(_ button: SkyButton) {
//		button.g.font = .button
//		button.g.clipsToBounds = true
//		button.g.cornerRadius = .zero
//		button.g.blurred = false
//		button.g.size = .large
//		button.g.removeAllAssociations()
//		button.g.associate(states: .default, .selected) { g in
//			g.isEnabled = true
//			g.textColor = .onBackgroundSecondary
//			g.picture?.repaint(to: g.textColor)
//		}
//		button.g.associate(states: .disabled) { g in
//			g.isEnabled = false
//			g.textColor = .onBackgroundTertiary
//			g.picture?.repaint(to: g.textColor)
//		}
//		button.g.associate(states: .pressed) { g in
//			g.isEnabled = true
//			g.textColor = .onBackgroundTertiary
//			g.picture?.repaint(to: .onBackgroundQuaternary)
//		}
//		button.g.associate(states: .selected) { g in
//			g.isEnabled = true
//			g.textColor = .generalBrand
//			g.picture?.repaint(to: g.textColor)
//		}
	}
}

/// Кнопка с прозрачным юэкграундом
struct ClearButtonDescriptor: ButtonDescriptor {

	private let color: Color
	private let icon: UIImage?

	/// Конструктор
	///
	/// - Parameters:
	///   - icon: иконка для отображения
	///   - color:цвет иконки в дефолтном состоянии
	init(icon: UIImage?, color: Color) {
		self.icon = icon
		self.color = color
	}

	func configure(_ button: SkyButton) {
//		button.g.clipsToBounds = false
//		button.g.cornerRadius = .circle
//		button.g.backgroundColor = .clear
//		button.g.picture = button.g.album.optionalIcon(icon, color: color)
//		button.g.removeAllAssociations()
//		button.g.associate(states: .default) { [color] g in
//			g.picture?.repaint(to: color)
//			g.isEnabled = true
//		}
//		button.g.associate(states: .pressed) { g in
//			g.picture?.repaint(to: .lentaTapOverlay)
//			g.isEnabled = true
//		}
//		button.g.associate(states: .disabled) { g in
//			g.picture?.repaint(to: .lentaTapOverlay)
//			g.isEnabled = false
//		}
	}
}

/// Описание кнопки Check
final class CheckButtonDescriptor: ButtonDescriptor {
	func configure(_ button: SkyButton) {
//		button.g.size = .large
//		button.g.backgroundColor = .clear
//		button.g.mode = .sticky
//		button.g.gap = .atom
//		button.g.associate(states: .default) { g in
//			g.picture = g.album.icon(.checkboxOff, color: .onBackgroundSecondary)
//		}
//		button.g.associate(states: .pressed) { g in
//			g.picture?.repaint(to: .lentaTapOverlay)
//		}
//		button.g.associate(states: .selected) { g in
//			g.picture = g.album.icon(.checkboxOn, color: .generalBrand)
//		}
	}
}

/// Описание кнопки Radio
final class RadioButtonDescriptor: ButtonDescriptor {
	func configure(_ button: SkyButton) {
//		button.g.size = .large
//		button.g.backgroundColor = .clear
//		button.g.mode = .sticky
//		button.g.gap = .atom
//		button.g.associate(states: .default) { g in
//			g.picture = g.album.icon(.radiobox, color: .onBackgroundSecondary)
//		}
//		button.g.associate(states: .pressed) { g in
//			g.picture?.repaint(to: .lentaTapOverlay)
//		}
//		button.g.associate(states: .selected) { g in
//			g.picture = g.album.icon(.radioboxOn, color: .generalBrand)
//		}
	}
}

