//
//  Created by taktem on 2022/05/10.
//  Copyright © 2022 taktem All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var mockButton: MockInputButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        mockButton.setHandler {
            print("did tap \($0)")
        }
    }
}
