//
//  UserGroupStackedViewController.swift
//  DesignSystemExample
//
//  Created by 17790204 on 09.05.2021.
//

import UIKit
import Skyline

class UserGroupStackedViewController: UserGroupViewController {

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		let presentable = members[indexPath.row]
		let viewController = StackedProfileViewController(presentable: presentable)

		presentPanModal(viewController)
	}

	override var shortFormHeight: PanModalHeight {
		return longFormHeight
	}
}
