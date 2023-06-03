//
//  ResultViewController.swift
//  HW#27_funAppForIBActionAndIBOutet
//
//  Created by Dawei Hao on 2023/6/1.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var titleOneLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var moodPhraseLabel: UILabel!
    @IBOutlet weak var titleThreeLabel: UILabel!
    @IBOutlet weak var moodTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var memberJoinButton: UIButton!
    
    
    let moodPhrases: [String] = [
        "心情如旭日，光芒四溢!",
        "波折中微笑，如彩虹努力~",
        "未來未卜，如日落後的天~~~",
        "黑暗中堅強，如夜晚的星!",
        "心痛中堅持，朝霞將至!!!"
    ]
    
    //星冰樂 Blended Beverage，有咖啡因的飲料
    let caffeinatedFrappuccino: [String] = [
            "濃巧克力風味咖啡星冰樂",
            "咖啡星冰樂",
            "焦糖星冰樂",
            "焦糖可可碎片星冰樂",
            "摩卡可可碎片星冰樂"
        ]

    //星冰樂 Blended Beverage，無咖啡因的飲料
    let deCaffeinatedFrappuccino: [String] = [
        "芝麻杏仁豆腐星冰樂",
        "草莓派風味星冰樂",
        "醇濃抹茶星冰樂",
        "香草風味星冰樂",
        "巧克力可可碎片星冰樂"
    ]
    
    //茶瓦納 Tea，有咖啡因的飲料
    let teaMenu: [String] = [
        "草莓派風味醇濃抹茶那堤",
        "冰草莓派風味醇濃抹茶那堤",
        "醇濃抹茶那堤",
        "冰醇濃抹茶那堤",
        "福吉茶那堤",
        "冰福吉茶那堤",
        "伯爵茶那堤",
        "經典紅茶那堤",
        "冰經典紅茶那堤",
        "玫瑰蜜香茶那堤",
        "冰玫瑰蜜香茶那堤",
        "蜜桃蘋果風味烏龍茶",
        "冰搖紅茶",
        "冰搖檸檬果茶",
        "冰西印度櫻桃紅茶",
        "阿里山蜜柚烏龍青茶",
        "冰蜜柚紅茶",
        "冰搖果茶",
        "冰搖檸檬紅茶",
        "西印度櫻桃紅茶",
        "茶瓦納洋甘菊花草茶",
        "茶瓦納英式早餐紅茶",
        "熱蜜柚紅茶",
        "阿里山烏龍茶"
    ]
    
    let coffeeMenu: [String] = [
            "氮氣冷萃咖啡歐蕾",
            "冰每日精選咖啡",
            "每日精選咖啡",
            "咖啡密斯朵",
            "荔枝百里香風味特調咖啡",
            "鹹焦糖風味可可瑪奇朵",
            "冰鹹焦糖風味可可瑪奇朵",
            "開心果白巧克力風味瑪奇朵",
            "冰開心果白巧克力風味瑪奇朵",
            "栗香蒙布朗風味那堤",
            "冰栗香蒙布朗風味那堤",
            "可可瑪奇朵",
            "冰可可瑪奇朵",
            "雲朵冰搖濃縮咖啡",
            "那堤",
            "冰那堤",
            "焦糖瑪奇朵",
            "冰焦糖瑪奇朵",
            "摩卡",
            "冰摩卡",
            "卡布奇諾",
            "美式咖啡",
            "冰美式咖啡",
            "濃縮咖啡",
            "特選馥郁那堤",
            "冰特選馥郁那堤",
            "馥列白",
            "冰馥列白"
        ]
    
    var moodRate: Int!
    
    var drinkSizeIndex: Int!
    
    var dateString: String!
    
    var drinkName: String!
    var drinkTypeResult: String!
    
    var caffeineSwitchValue: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moodChanged()
        drinkSizeLabelUpdate()
        showDrinksImage()
        
        dateLabel.text = dateString
        
        productImageView.layer.cornerRadius = 20
        
        loginButton.layer.shadowColor = UIColor.gray.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 15
        view.addSubview(loginButton)
        
        memberJoinButton.layer.shadowColor = UIColor.gray.cgColor
        memberJoinButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        memberJoinButton.layer.shadowOpacity = 0.5
        memberJoinButton.layer.shadowRadius = 20
        view.addSubview(memberJoinButton)
        
        
    }

    func moodChanged () {
        if moodRate >= 0 && moodRate <= 20 {
            moodPhraseLabel.text = "心情如旭日，光芒四溢。"
        } else if moodRate >= 21 && moodRate <= 40 {
            moodPhraseLabel.text = "波折中微笑，如彩虹努力。"
        } else if moodRate >= 41 && moodRate <= 60 {
            moodPhraseLabel.text = "未來未卜，如日落後的天。"
        } else if moodRate >= 61 && moodRate <= 80 {
            moodPhraseLabel.text = "黑暗中堅強，如夜晚的星。"
        } else if moodRate >= 81 && moodRate <= 100 {
            moodPhraseLabel.text = "心痛中堅持，朝霞將至。"
        }
    }

    
    func drinkSizeLabelUpdate() {
        let drinkSizeText = ["中杯", "大杯", "特大杯"]
        if let index = drinkSizeIndex, index >= 0, index < drinkSizeText.count {
            titleThreeLabel.text = "適合一杯\(drinkSizeText[index])的"
           } else {
        }
    }
    
    func showDrinksImage() {
        var drinkName: String?
        
        if drinkTypeResult == "咖啡飲品 Coffee" {
            drinkName = coffeeMenu.randomElement()
        } else if drinkTypeResult == "茶瓦納 Tea" {
            drinkName = teaMenu.randomElement()
        } else if drinkTypeResult == "星冰樂 Blended Beverage" && caffeineSwitchValue == true {
            drinkName = caffeinatedFrappuccino.randomElement()
        } else if drinkTypeResult == "星冰樂 Blended Beverage" && caffeineSwitchValue == false {
            drinkName = deCaffeinatedFrappuccino.randomElement()
        }
        
        if let drinkName = drinkName {
            productNameLabel.text = drinkName
            productImageView.image = UIImage(named: drinkName)
            print(drinkName)
        } else {
            
        }
    }

    

}
