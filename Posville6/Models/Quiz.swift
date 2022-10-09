//
//  Quiz.swift
//  Posville6
//
//  Created by Chicken on 2022/10/09.
//

import Foundation

enum Level {
    case Beginning
    case Intermediate
    case Advanced
}

struct Quiz {
    // TODO: 선지 한 배열로 묶기
    let level: Level
    let question: String
    var options: [String]
    let rightAnswer: String
    
    init(level: Level, question: String, options: [String], rightAnswer: String) {
        self.level = level
        self.question = question
        self.options = options
        self.rightAnswer = rightAnswer
    }
    
    init(level: Level, options: [String], rightAnswer: String) {
        self.init(level: level, question: "", options: options, rightAnswer: rightAnswer)
    }
    
}

extension Quiz {
    static let grammarQuizzes: [Quiz] = [
        // firstOption 정답 / secondOption: 오답
        
        // 10
        Quiz(level: .Beginning, options: ["깨끗이", "깨끗히"], rightAnswer: "깨끗이"),
        Quiz(level: .Beginning, question: "( )을 찌푸리다", options: ["눈살", "눈쌀"], rightAnswer: "눈살"),
        Quiz(level: .Beginning, options: ["사실상", "사실 상"], rightAnswer: "사실상"),
        Quiz(level: .Beginning, options: ["단언컨대", "단언컨데"], rightAnswer: "단언컨대"),
        Quiz(level: .Beginning, options: ["웃도리", "윗도리"], rightAnswer: "윗도리"),
        Quiz(level: .Beginning, options: ["재작년", "제작년"], rightAnswer: "재작년"),
        Quiz(level: .Beginning, options: ["꽃봉오리", "꽃봉우리"], rightAnswer: "꽃봉오리"),
        Quiz(level: .Beginning, options: ["옴짝달싹", "옴싹달싹"], rightAnswer: "옴짝달싹"),
        Quiz(level: .Beginning, options: ["열대야", "열대아"], rightAnswer: "열대야"),
        Quiz(level: .Beginning, options: ["깨달음", "깨닳음"], rightAnswer: "깨달음"),
        
        // 20
        Quiz(level: .Beginning, options: ["일일이", "일일히"], rightAnswer: "일일이"),
        Quiz(level: .Beginning, options: ["어느덧", "어느 덧"], rightAnswer: "어느덧"),
        Quiz(level: .Beginning, options: ["요새", "요세"], rightAnswer: "요새"),
        Quiz(level: .Beginning, options: ["금세", "금새"], rightAnswer: "금세"),
        Quiz(level: .Beginning, options: ["도대체", "도데체"], rightAnswer: "도대체"),
        Quiz(level: .Beginning, options: ["꼬투리" ,"꼬트리"], rightAnswer: "꼬투리"),
        Quiz(level: .Beginning, question: "결혼을 ( ) 받았어요", options: ["승낙" ,"승락"], rightAnswer: "승낙"),
        Quiz(level: .Beginning, options: ["설거지", "설겆이"], rightAnswer: "설거지"),
        Quiz(level: .Beginning, options: ["녹슨", "녹슬은"], rightAnswer: "녹슨"),
        Quiz(level: .Beginning, options: ["결합률", "결합율"], rightAnswer: "결합률"),
        
        // 30
        Quiz(level: .Beginning, options: ["콧배기", "코빼기"], rightAnswer: "콧배기"),
        Quiz(level: .Beginning, options: ["안쓰럽다", "안스럽다"], rightAnswer: "안쓰럽다"),
        Quiz(level: .Beginning, options: ["오뚝이", "오뚜기"], rightAnswer: "오뚝이"),
        Quiz(level: .Beginning, options: ["사레들다", "사래들다"], rightAnswer: "사레들다"),
        Quiz(level: .Beginning, options: ["게재하다", "게제하다"], rightAnswer: "게재하다"),
        Quiz(level: .Beginning, options: ["으스대다", "으시대다"], rightAnswer: "으스대다"),
        Quiz(level: .Beginning, question: "( ) 문이 열렸다", options: ["그때","그 때"], rightAnswer: "그때"),
        Quiz(level: .Beginning, question: "두 팔을 ( )", options: ["벌리다", "벌이다"], rightAnswer: "벌리다"),
        Quiz(level: .Beginning, options: ["재떨이", "재털이"], rightAnswer: "재떨이"),
        Quiz(level: .Beginning, options: ["봬요", "뵈요"], rightAnswer: "봬요"),
        
        // 40
        Quiz(level: .Beginning, options: ["곰곰이", "곰곰히"], rightAnswer: "곰곰이"),
        Quiz(level: .Beginning, options: ["초점", "촛점"], rightAnswer: "초점"),
        Quiz(level: .Beginning, question: "손으로 차를 ( )", options: ["가리켰다", "가르켰다"], rightAnswer: "가리켰다"),
        Quiz(level: .Beginning, options: ["일사분란", "일사불란"], rightAnswer: "일사불란"),
        Quiz(level: .Beginning, options: ["시래기", "시레기"], rightAnswer: "시래기"),
        Quiz(level: .Beginning, options: ["화병", "홧병"], rightAnswer: "화병"),
        Quiz(level: .Beginning, options: ["몽당연필", "몽땅연필"], rightAnswer: "몽당연필"),
        Quiz(level: .Beginning, options: ["혼쭐내다", "혼줄내다"], rightAnswer: "혼쭐내다"),
        Quiz(level: .Beginning, question: "다시 만난 가족들은 서로 ( )안았다", options: ["부둥켜", "부등켜"], rightAnswer: "부둥켜"),
        Quiz(level: .Beginning, options: ["어떡해", "어떻해"], rightAnswer: "어떡해"),
        
        // 50
        Quiz(level: .Intermediate, question: "봉투에 물건을 ( )", options: ["욱여넣었다", "우겨넣었다"], rightAnswer: "욱여넣었다"),
        Quiz(level: .Intermediate, question: "행복하길 ( )", options: ["바라","바래"], rightAnswer: "바라"),
        Quiz(level: .Intermediate, options: ["고난도 문제", "고난이도 문제"], rightAnswer: "고난도 문제"),
        Quiz(level: .Intermediate, options: ["애당초", "애시당초"], rightAnswer: "애당초"),
        Quiz(level: .Intermediate, options: ["얻다 대고", "어따 대고"], rightAnswer: "얻다 대고"),
        Quiz(level: .Intermediate, question: "발바닥을 ( )", options: ["간질이다", "간지르다"], rightAnswer: "간질이다"),
        Quiz(level: .Intermediate, options: ["전 좌석", "전좌석"], rightAnswer: "전 좌석"),
        Quiz(level: .Intermediate, options: ["수개월", "수 개월"], rightAnswer: "수개월"),
        Quiz(level: .Intermediate, question: "이따가 공부할 ( )", options: ["거예요", "거에요"], rightAnswer: "거예요"),
        Quiz(level: .Intermediate, options: ["잇따라", "이따라"], rightAnswer: "잇따라"),
        
        // 60
        Quiz(level: .Intermediate, options: ["추스르다", "추스리다"], rightAnswer: "추스르다"),
        Quiz(level: .Intermediate, options: ["꼼꼼히", "꼼꼼이"], rightAnswer: "꼼꼼히"),
        Quiz(level: .Intermediate, options: ["장맛비", "장마비"], rightAnswer: "장맛비"),
        Quiz(level: .Intermediate, options: ["어슴푸레", "어슴프레"], rightAnswer: "어슴푸레"),
        Quiz(level: .Intermediate, question: "손이 ( ) 장갑을 꼈다", options: ["시려","시려워"], rightAnswer: "시려"),
        Quiz(level: .Intermediate, options: ["희한하다", "희안하다"], rightAnswer: "희한하다"),
        Quiz(level: .Intermediate, options: ["뒤통수", "뒷통수"], rightAnswer: "뒤통수"),
        Quiz(level: .Intermediate, options: ["예부터", "옛부터"], rightAnswer: "예부터"),
        Quiz(level: .Intermediate, options: ["기다랗다", "길다랗다"], rightAnswer: "기다랗다"),
        Quiz(level: .Intermediate, question: "눈에 ( ) 좋아졌는데!", options: ["띄게", "띠게"], rightAnswer: "띄게"),
        
        // 70
        Quiz(level: .Intermediate, options: ["되레 화내다", "되려 화내다"], rightAnswer: "되레 화내다"),
        Quiz(level: .Intermediate, question: "눈시울이 ( )", options: ["붉어졌다", "불거졌다"], rightAnswer: "붉어졌다"),
        Quiz(level: .Intermediate, question: "장난감을 ( )뜨렸다", options: ["널브러", "널부러"], rightAnswer: "널브러"),
        Quiz(level: .Intermediate, options: ["보고 싶어", "보고싶어"], rightAnswer: "보고 싶어"),
        Quiz(level: .Intermediate, options: ["외로이", "외로히"], rightAnswer: "외로이"),
        Quiz(level: .Intermediate, options: ["왠지", "웬지"], rightAnswer: "왠지"),
        Quiz(level: .Intermediate, options: ["흥밋거리", "흥미거리"], rightAnswer: "흥밋거리"),
        Quiz(level: .Intermediate, question: "죄 없는 사람을 ( )", options: ["몰아붙이다", "몰아부치다"], rightAnswer: "몰아붙이다"),
        Quiz(level: .Intermediate, options: ["베개", "베게"], rightAnswer: "베개"),
        Quiz(level: .Intermediate, options: ["그러든 말든", "그러던 말던"], rightAnswer: "그러든 말든"),
        
        // 80
        Quiz(level: .Advanced, options: ["여러 가지", "여러가지"], rightAnswer: "여러 가지"),
        Quiz(level: .Advanced, options: ["밤을 지새우다", "밤을 지새다"], rightAnswer: "밤을 지새우다"),
        Quiz(level: .Advanced, question: "가을이 오니 마음이 ( )하다", options: ["싱숭", "생숭"], rightAnswer: "싱숭"),
        Quiz(level: .Advanced, options: ["널찍한", "넓직한"], rightAnswer: "널찍한"),
        Quiz(level: .Advanced, options: ["귀띔", "귀뜸"], rightAnswer: "귀띔"),
        Quiz(level: .Advanced, options: ["우유갑", "우유곽"], rightAnswer: "우유갑"),
        Quiz(level: .Advanced, options: ["아등바등" ,"아둥바둥"], rightAnswer: "아등바등"),
        Quiz(level: .Advanced, question: "굳은살이 ( ) 손", options: ["박인","박힌"], rightAnswer: "박인"),
        Quiz(level: .Advanced, options: ["구시렁거리다", "궁시렁거리다"], rightAnswer: "구시렁거리다"),
        Quiz(level: .Advanced, question: "라면이 ( )", options: ["붇다", "불다"], rightAnswer: "붇다"),
        
        // 90
        Quiz(level: .Advanced, question: "태극기를 ( )하다", options: ["게양", "계양"], rightAnswer: "게양"),
        Quiz(level: .Advanced, question: "이 병은 ( ) 치료가 불가능합니다", options: ["현재로서는", "현재로써는"], rightAnswer: "현재로서는"),
        Quiz(level: .Advanced, options: ["그끄제", "그그제"], rightAnswer: "그끄제"),
        Quiz(level: .Advanced, question: "강아지가 새끼를 ( )", options: ["뱄나 봐", "벴나 봐"], rightAnswer: "뱄나 봐"),
        Quiz(level: .Advanced, options: ["감색", "곤색"], rightAnswer: "감색"),
        Quiz(level: .Advanced, question: "자물쇠를 ( )", options: ["잠갔다", "잠궜다"], rightAnswer: "잠갔다"),
        Quiz(level: .Advanced, options: ["눈곱", "눈꼽"], rightAnswer: "눈곱"),
        Quiz(level: .Advanced, options: ["생뚱맞은 이야기", "쌩뚱맞은 이야기"], rightAnswer: "생뚱맞은 이야기"),
        Quiz(level: .Advanced, question: "하늘이 ( ) 흐려졌다", options: ["끄물끄물","꾸물꾸물"], rightAnswer: "끄물끄물"),
        Quiz(level: .Advanced, options: ["500만 원", "500만원"], rightAnswer: "500만 원"),
        
        // 100
        Quiz(level: .Advanced, options: ["삐거덕거리다", "삐그덕거리다"], rightAnswer: "삐거덕거리다"),
        Quiz(level: .Advanced, options: ["생각할는지", "생각할런지"], rightAnswer: "생각할는지"),
        Quiz(level: .Advanced, options: ["원고 측", "원고측"], rightAnswer: "원고 측"),
        Quiz(level: .Advanced, question: "( )한 눈", options: ["흐리멍덩","흐리멍텅"], rightAnswer: "흐리멍덩"),
        Quiz(level: .Advanced, question: "( ) 내가 좋아하는 것은 치킨이다", options: ["그중", "그 중"], rightAnswer: "그중"),
        Quiz(level: .Advanced, options: ["오랜만에", "오랫만에"], rightAnswer: "오랜만에"),
        Quiz(level: .Advanced, options: ["며칠", "몇 일"], rightAnswer: "며칠"),
        Quiz(level: .Advanced, options: ["구레나룻", "구렛나루"], rightAnswer: "구레나룻"),
        Quiz(level: .Advanced, question: "담배를 ( )", options: ["피우다", "피다"], rightAnswer: "피우다"),
        Quiz(level: .Advanced, options: ["송두리째","송두리채"], rightAnswer: "송두리째"),
    ]
}