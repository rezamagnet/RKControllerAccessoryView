# RKControllerAccessoryView

<p align="center">
<img src="Images/demo.png" alt="RKControllerAccessoryView" title="RKControllerAccessoryView" width="316" height="684"/>
</p>

Add custom view above iOS keyboard


```swift
import RKControllerAccessoryView

class ViewController: BaseInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = UIView()
        bottomMarginSpace = 20 // (default is 20)
    }
}
```
