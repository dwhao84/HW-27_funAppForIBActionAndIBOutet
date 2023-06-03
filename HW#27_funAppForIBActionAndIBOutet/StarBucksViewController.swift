//
//  StarBucksViewController.swift
//  HW#27_funAppForIBActionAndIBOutet
//
//  Created by Dawei Hao on 2023/5/29.
//

import UIKit

class StarBucksViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        drinksType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        drinksType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        drinksTypeTextField.text = drinksType[row]
        drinksTypeTextField.resignFirstResponder()
    }
    
    @IBOutlet weak var productImageView: SharpImageView!
    @IBOutlet weak var secondProductImageView: SecondSharpImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var caffeineLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var numberRateLabel: UILabel!
    
    @IBOutlet weak var drinksTypeTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var rateSlider: UISlider!
    
    @IBOutlet var drinksPickerView: UIPickerView!
    @IBOutlet var drinksToolBar: UIToolbar!
    
    @IBOutlet weak var drinkSizeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var starDatePicker: UIDatePicker!

    @IBOutlet weak var caffeineSwitch: UISwitch!
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let drinksType = ["咖啡飲品 Coffee", "茶瓦納 Tea", "星冰樂 Blended Beverage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //drinks帶入delegate & dataSource
        drinksPickerView.delegate = self
        drinksPickerView.dataSource = self
        drinksTypeTextField.delegate = self
        
        
        drinksTypeTextField.inputView = drinksPickerView
        drinksTypeTextField.inputAccessoryView = drinksToolBar

        animatedProductImage()
        secondLabelUpdate()
        goButtonAddShadow()
    }
    
     @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
            let controller = ResultViewController(coder: coder)
         
         let dateformatter = DateFormatter()
         dateformatter.dateFormat = "MM-dd"

         controller?.moodRate = Int(rateSlider.value)
         controller?.drinkSizeIndex = Int(drinkSizeSegmentedControl.selectedSegmentIndex)
         
         controller?.dateString = dateformatter.string(from: starDatePicker.date)
         controller?.drinkTypeResult = drinksTypeTextField.text
         controller?.caffeineSwitchValue = caffeineSwitch.isOn
            return controller
        }
    
   
    //鍵盤消失
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
        print("keyboard dismiss")
    }
    
    //點擊toolBar裡面的cancelBarButton
    @IBAction func cancelBarTapped(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        print("cancelBarButton Tapped")
    }
    
    //點擊cancelButton之後，字串為0，回到初始設定。
    @IBAction func cancelButtonTapped(_ sender: Any) {
        nameTextField.text = ""
        drinksTypeTextField.text = ""
        numberRateLabel.text = "0"
        rateSlider.value = 0
        print("cancelButton Tapped")
    }
    
    //點擊toolBar裡面的doneBarButton
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let row = drinksPickerView.selectedRow(inComponent: 0)
        drinksTypeTextField.text = drinksType[row]
        view.endEditing(true)
        print("doneBarButton Tapped")
    }
    
    //Slider滑動時，numberRateLabel的值一起變動。
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        numberRateLabel.text = String(Int(rateSlider.value))
        
        //drand48 函數將生成一個在 0.0 到 1.0 之間的隨機雙精度浮點數。
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBlue = CGFloat(drand48())
        
        print("value changed")
        
        //建立slider調整數字時，Slider的顏色變化。
        if rateSlider.value >= 0 {
            rateSlider.tintColor = UIColor(red: randomRed, green: randomBlue, blue: randomGreen, alpha: 1)
            numberRateLabel.textColor = .black
        }
    }
    
    @IBAction func goButtonTapped(_ sender: Any) {
        //drinksTypeTextFieldIsEmpty()
       // nameTextFieldIsEmpty()
    }
    
    //當nameTextField是空的時候顯示UIAlertController
    func nameTextFieldIsEmpty() {
        if nameTextField.text?.isEmpty == true {
            let alertController = UIAlertController(title: "少寫了名字!", message: "記得填上名字", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true)
            print("missing nameTextField content")
        } else if nameTextField.text?.isEmpty == false {
            print("fill the nameTextField already")
        }
    }
    
    //當drinksTypeTextField是空的時候顯示UIAlertController
    func drinksTypeTextFieldIsEmpty() {
        if drinksTypeTextField.text?.isEmpty == true {
            let alertController = UIAlertController(title: "少寫填了飲料種類", message: "記得選擇你愛喝的種類!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true)
            print("missing drinksTypeTextField content")
        } else if drinksTypeTextField.text?.isEmpty == false {
            print("fill the drinksTypeTextField already")
        }
    }
    
    //productImageView變成
    func animatedProductImage() {
        let animatedPicture = UIImage.animatedImageNamed("pics_", duration: 3)
        productImageView.image = animatedPicture
    }
    
    func secondLabelUpdate() {
        secondTitleLabel.layer.masksToBounds = false
        secondTitleLabel.layer.shadowColor = UIColor.black.cgColor
        secondTitleLabel.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        secondTitleLabel.layer.shadowOpacity = 0.9
        secondTitleLabel.layer.shadowRadius = 5
        view.addSubview(secondTitleLabel)
    }
 
    func goButtonAddShadow() {
        goButton.layer.shadowColor = UIColor.black.cgColor
        goButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        goButton.layer.shadowOpacity = 0.5
        goButton.layer.shadowRadius = 30
        view.addSubview(goButton)
    }
}
