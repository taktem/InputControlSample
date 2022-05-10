//
//  Created by taktem on 2022/05/10.
//  Copyright © 2022 taktem All rights reserved.
//

import UIKit

final class MockInputButton: UIControl {
    private var didSelectHandler: (Int) -> () = { _ in }

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        addTarget(self, action: #selector(Self.didTap), for: .touchUpInside)
    }

    func setHandler(didSelect: @escaping (Int) -> ()) {
        self.didSelectHandler = didSelect
    }

    override var canBecomeFirstResponder: Bool {
        true
    }

    @objc private func didTap() {
        becomeFirstResponder()
    }

    override var inputView: UIView? {
        let stackView = UIStackView(frame: .zero)
        stackView.distribution = .fillEqually
        stackView.spacing = 16

        (0..<3).forEach { index in
            let button = UIButton(frame: .zero)
            button.backgroundColor = UIColor.blue
            button.setTitle("\(index)", for: .normal)
            button.addAction(
                .init { [weak self] _ in
                    self?.didSelectHandler(index)
                    self?.resignFirstResponder()
                },
                for: .touchUpInside
            )
            stackView.addArrangedSubview(button)
        }

        let container = UIView()
        container.addSubview(stackView)
        container.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        return container
    }
}
