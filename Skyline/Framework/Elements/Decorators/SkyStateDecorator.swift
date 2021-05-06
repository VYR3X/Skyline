//
//  SkyStateDecorator.swift
//  Skyline
//
//  Created by 17790204 on 06.05.2021.
//

/// Тип ассоциирования действия и состояния объекта
///
/// - add: действие добавляется к ранее ассоциированным действиям
/// - clear: сохраняется только это действие, ранее переданные затираются
public enum AssociationType {
	case add
	case clear
}

/// Декоратор состояний объекта
public final class SkyStateDecorator<ConfigurationType: AnyObject, StateType: Hashable> {

	/// Длительность анимаций при переключении между состояниями
	public var animationDuration: Double = 0.15

	/// Конфигурация объекта
	weak var g: ConfigurationType?

	/// Текущее состояние
	private(set) var state: StateType

	/// Предыдущее состояние
	private(set) var previousState: StateType

	private var statePairs = [StateType: [((g: ConfigurationType) -> Void)]]()

	/// Конструктор
	///
	/// - Parameters
	///   - state: изначальное состояние декоратора
	init(state: StateType) {
		self.state = state
		self.previousState = state
	}

	/// Ассоциировать состояния объекта с действием
	///
	/// - Parameters:
	///   - states: Состояния объекта
	///   - type: Тип ассоциирования
	///   - action: Действие, с которым нужно ассоциировать состояния
	public func associate(states: [StateType],
						  type: AssociationType = .add,
						  with action: @escaping ((_ g: ConfigurationType) -> Void)) {
		for state in states {
			var actions: [((ConfigurationType) -> Void)]
			switch type {
			case .add:
				actions = statePairs[state] ?? []
				actions.append(action)
			case .clear:
				actions = [action]
			}
			statePairs[state] = actions
			if state == self.state {
				update(to: state)
			}
		}
	}

	/// Обновить состояние объекта
	///
	/// - Parameter state: состояние, до которого нужно обновить
	public func update(to state: StateType, animated: Bool = true) {
		self.previousState = self.state
		self.state = state
		performActions(for: state, animated: animated)
	}

	/// Вернуться в предыдущее состояние
	/// - Parameter animated: использовать ли анимацию
	public func revertToPreviousState(animated: Bool = true) {
		update(to: previousState, animated: animated)
	}

	/// Тригернуть действия для текущего состояния
	/// - Parameter animated: использовать ли анимацию
	func retriggerActionsForCurrentState(animated: Bool = true) {
		performActions(for: state, animated: animated)
	}

	/// Удалить все ассоциации
	func removeAllAssociations() {
		statePairs.removeAll()
	}

	private func performActions(for state: StateType, animated: Bool) {
		guard let g = g, let actions = statePairs[state] else { return }
		let duration = animated ? animationDuration : 0
//		GView.animate(withDuration: duration,
//					   delay: .zero,
//					   options: [.allowUserInteraction, .curveEaseInOut],
//					   animations: {
//						for action in actions {
//							action(g)
//						}
//		})
	}
}

