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
	
	static let historyQuizzes: [Quiz] = [
        Quiz(level: .Beginning, question: "청동기 시대에 커다란 돌을 쌓아 만든 족장의 무덤?", options: ["고인물", "석가탑", "고인돌"], rightAnswer: "고인돌"),
			Quiz(level: .Beginning, question: "우리 나라 최초의 국가는?", options: ["고조선", "고조할아버지", "조선"], rightAnswer: "고조선"),
			Quiz(level: .Beginning, question: "‘널리 인간을 이롭게 한다.’는 고조선의 건국 이념?", options: ["홍석천", "홍익인간", "홍익대학교"], rightAnswer: "홍익인간"),
			Quiz(level: .Beginning, question: "단군 왕검이 하늘에 제사를 지낸 참성단이 있는 곳?", options: ["강황", "강화석", "강화도"], rightAnswer: "강화도"),
			Quiz(level: .Beginning, question: "동명 성왕인 주몽이 세운 나라의 이름은?", options: ["고구마", "고구려", "고려"], rightAnswer: "고구려"),
			Quiz(level: .Beginning, question: "대조영이 옛 고구려의 영토에 세운 나라?", options: ["발해", "신라", "청나라"], rightAnswer: "발해"),
			Quiz(level: .Beginning, question: "세종 대왕 때 만들어진 비가 온 양을 재는 기구는?", options: ["자격루", "측우기", "앙부일구"], rightAnswer: "측우기"),
			Quiz(level: .Beginning, question: "신사임당의 아들이며 10만 양병설을 주장한 유학자?", options: ["율곡 이이", "퇴계 이황", "정약용"], rightAnswer: "율곡 이이"),
			Quiz(level: .Beginning, question: "신라를 세운 사람은 누구인가?", options: ["주몽", "박혁거세", "김유신"], rightAnswer: "박혁거세"),
			Quiz(level: .Beginning, question: "고려가 도읍지로 정한 곳은 어디인가?", options: ["경주", "한양", "개경"], rightAnswer: "개경"),
			Quiz(level: .Beginning, question: "거란의 10만 대군을 귀주에서 크게 무찌른 사람은?", options: ["을지문덕", "강감찬", "관우"], rightAnswer: "강감찬"),
			Quiz(level: .Beginning, question: "거중기를 이용하여 화성(수원성)을 쌓은 사람은?", options: ["장영실", "정약용", "김정호"], rightAnswer: "정약용"),
			Quiz(level: .Beginning, question: "하얼빈에서 이토 히로부미를 암살한 독립 운동가는?", options: ["김구", "안중근", "윤봉길"], rightAnswer: "안중근"),
			Quiz(level: .Beginning, question: "아우내 장터에서 독립 만세를 주도한 사람?", options: ["김구", "유관순", "안중근"], rightAnswer: "유관순"),
			Quiz(level: .Beginning, question: "실학을 집대성하고 목민심서를 만든 사람은?", options: ["장영실", "김정호", "정약용"], rightAnswer: "정약용"),
			Quiz(level: .Beginning, question: "세계에서 가장 오래된 목판 인쇄물은?", options: ["직지심체요절", "무구정광대다라니경", "팔만대장경"], rightAnswer: "무구정광대다라니경"),
			Quiz(level: .Beginning, question: "조선 후기에 실증적 실제적으로 일어난 학문은?", options: ["유학", "실학", "인문학"], rightAnswer: "실학"),

			Quiz(level: .Intermediate, question: "신라가 삼국 통일의 위업을 달성할 때의 왕은?", options: ["문무왕", "무열왕", "장수왕"], rightAnswer: "문무왕"),
			Quiz(level: .Intermediate, question: "화랑도 정신인 세속 오계를 지은 사람은?", options: ["원광 법사", "혜민 스님", "성철 스님"], rightAnswer: "원광 법사"),
			Quiz(level: .Intermediate, question: "고려와 친교를 맺고 사이좋게 지냈던 나라는?", options: ["송나라", "원나라", "청나라"], rightAnswer: "송나라"),
			Quiz(level: .Intermediate, question: "의령 지방에서 의병을 일으킨 의병장은?", options: ["윤봉길", "곽재우", "김구"], rightAnswer: "곽재우"),
			Quiz(level: .Intermediate, question: "최초의 훈민정음 글로 왕실의 역사를 노래한 것은?", options: ["사미인가", "용비어천가", "청산별곡"], rightAnswer: "용비어천가"),
			Quiz(level: .Intermediate, question: "조선이 일본과 교류를 끊는 계기가 된 사건은?", options: ["병자호란", "임진왜란", "신미양요"], rightAnswer: "임진왜란"),
			Quiz(level: .Intermediate, question: "전라도 고부에서 동학교도와 농민들이 일으킨 운동은?", options: ["등속직선운동", "동학농민운동", "3.1운동"], rightAnswer: "동학농민운동"),
			Quiz(level: .Intermediate, question: "우리 나라 최초의 천주교 신자는 누구인가?", options: ["이순신", "이승훈", "김현수"], rightAnswer: "이승훈"),
			Quiz(level: .Intermediate, question: "과거 제도, 노비 제도 폐지 등의 내용의 개혁은?", options: ["을미개혁", "갑오개혁", "광무개혁"], rightAnswer: "갑오개혁"),
			Quiz(level: .Intermediate, question: "최초의 한글날 이름은?", options: ["국어날", "가나다날", "가갸날"], rightAnswer: "가갸날"),
			Quiz(level: .Intermediate, question: "‘님의 침묵’을 지어 저항 문학에 앞장선 사람은?", options: ["윤동주", "한용운", "김소월"], rightAnswer: "한용운"),
			Quiz(level: .Intermediate, question: "‘서시’,‘별 헤는 밤’ 등을 지은 시인은?", options: ["윤동주", "한용운", "김소월"], rightAnswer: "윤동주"),
			Quiz(level: .Intermediate, question: "인내천 사상으로 동학을 창시한 사람은?", options: ["김재우", "최제우", "윤봉길"], rightAnswer: "최제우"),
			Quiz(level: .Intermediate, question: "경제개발 5개년 계획의 시작년도는?", options: ["1975년", "1962년", "1935년"], rightAnswer: "1962년"),
			Quiz(level: .Intermediate, question: "유교정치강화를 위해 고려가 최승로를 통해 만든것은?", options: ["루소 23조", "시무 28조", "내통장 15조"], rightAnswer: "시무 28조"),
			Quiz(level: .Intermediate, question: "고려의 무신들은 어떤 일을 계기로 정권을 장악했는가?", options: ["무오정변", "무신정변", "5.16 군사정변"], rightAnswer: "무신정변"),
			Quiz(level: .Intermediate, question: "자유당의 부정과 3.15 부정 선거를 계기로 일어난 일은?", options: ["무오정변", "4.19혁명", "5.16 군사정변"], rightAnswer: "4.19혁명"),
			Quiz(level: .Intermediate, question: "화랑도는 어느 왕때 조직 및 형성이 확대 되었는가?", options: ["문무왕", "진흥왕", "무열왕"], rightAnswer: "진흥왕")
			]
    
    static let signQuizzes: [Quiz] = [
        // 10
        Quiz(level: .Beginning, question: "mg", options: ["밀리그램", "메가그램"], rightAnswer: "밀리그램"),
        Quiz(level: .Beginning, question: "t", options: ["톤", "티"], rightAnswer: "톤"),
        Quiz(level: .Beginning, question: "㎖", options: ["밀리리터", "마일"], rightAnswer: "밀리리터"),
        Quiz(level: .Beginning, question: "mm", options: ["밀리미터", "미리미터"], rightAnswer: "밀리미터"),
        Quiz(level: .Beginning, question: "㎗", options: ["데시리터", "델리"], rightAnswer: "데시리터"),
        Quiz(level: .Beginning, question: "m³", options: ["세제곱미터", "쓰리미터"], rightAnswer: "세제곱미터"),
        Quiz(level: .Beginning, question: "ft", options: ["피트", "피쳐링"], rightAnswer: "피트"),
        Quiz(level: .Beginning, question: "yd", options: ["야드", "와이드"], rightAnswer: "야드"),
        Quiz(level: .Beginning, question: "oz", options: ["온스", "오즈"], rightAnswer: "온스"),
        Quiz(level: .Beginning, question: "mach", options: ["마하", "매치"], rightAnswer: "마하"),
        
        // 20
        Quiz(level: .Beginning, question: "KB", options: ["킬로바이트", "킬로비트"], rightAnswer: "킬로바이트"),
        Quiz(level: .Beginning, question: "gal", options: ["갤런", "갤리"], rightAnswer: "갤런"),
        Quiz(level: .Beginning, question: "TB", options: ["테라바이트", "텍스바이트"], rightAnswer: "테라바이트"),
        Quiz(level: .Beginning, question: "hPa", options: ["헥토파스칼", "헥파스칼"], rightAnswer: "헥토파스칼"),
        Quiz(level: .Beginning, question: "Ω", options: ["옴", "암"], rightAnswer: "옴"),
        Quiz(level: .Beginning, question: "1000mm =", options: ["1m", "10m"], rightAnswer: "1m"),
        Quiz(level: .Beginning, question: "™", options: ["상표 기호", "수심 깊이"], rightAnswer: "상표 기호"),
        Quiz(level: .Beginning, question: "♂︎", options: ["남자", "여자"], rightAnswer: "남자"),
        Quiz(level: .Beginning, question: "( )", options: ["소괄호", "중괄호"], rightAnswer: "소괄호"),
        Quiz(level: .Beginning, question: "{ }", options: ["대괄호", "중괄호"], rightAnswer: "대괄호"),
        
        // 30
        Quiz(level: .Beginning, question: "♖", options: ["룩", "비숍"], rightAnswer: "룩"),
        Quiz(level: .Beginning, question: "☢︎", options: ["방사능", "바람"], rightAnswer: "방사능"),
        Quiz(level: .Beginning, question: "🔞", options: ["18세 미만", "18세 이하"], rightAnswer: "18세 미만"),
        Quiz(level: .Beginning, question: "🅏", options: ["화장실", "회사"], rightAnswer: "화장실"),
        Quiz(level: .Beginning, question: "K", options: ["칼륨", "칼슘"], rightAnswer: "칼륨"),
        Quiz(level: .Beginning, question: "Ca", options: ["칼슘", "칼륨"], rightAnswer: "칼슘"),
        Quiz(level: .Beginning, question: "H", options: ["수소", "황산"], rightAnswer: "수소"),
        Quiz(level: .Beginning, question: "Fe", options: ["철", "납"], rightAnswer: "철"),
        Quiz(level: .Beginning, question: "Pb", options: ["납", "파리바게뜨"], rightAnswer: "납"),
        Quiz(level: .Beginning, question: "He", options: ["헬륨", "수소"], rightAnswer: "헬륨"),
        
        // 40
        Quiz(level: .Beginning, question: "P", options: ["인", "납"], rightAnswer: "인"),
        Quiz(level: .Beginning, question: "Mg", options: ["마그네슘", "밀리그램"], rightAnswer: "마그네슘"),
        Quiz(level: .Beginning, question: "Ne", options: ["네온", "나트륨"], rightAnswer: "네온"),
        Quiz(level: .Beginning, question: "&", options: ["엔퍼샌드", "퍼샌드"], rightAnswer: "엔퍼샌드"),
        Quiz(level: .Beginning, question: "♬", options: ["16분음표", "8분음표"], rightAnswer: "16분음표"),
        Quiz(level: .Beginning, question: "♭", options: ["플랫", "샵"], rightAnswer: "플랫"),
        Quiz(level: .Beginning, question: "𝄞", options: ["높은음자리표", "낮은음자리표"], rightAnswer: "높은음자리표"),
        Quiz(level: .Beginning, question: "ㆁ", options: ["옛이응", "아래 아"], rightAnswer: "옛이응"),
        Quiz(level: .Beginning, question: "￥", options: ["엔", "유로"], rightAnswer: "엔"),
        Quiz(level: .Beginning, question: "$", options: ["달러", "유로"], rightAnswer: "달러"),
        
        // 50
        Quiz(level: .Beginning, question: "€", options: ["유로", "엔"], rightAnswer: "유로"),
        Quiz(level: .Beginning, question: "IV", options: ["4", "6"], rightAnswer: "4"),
        Quiz(level: .Beginning, question: "IX", options: ["9", "11"], rightAnswer: "9"),
        Quiz(level: .Beginning, question: "㎐", options: ["헤르쯔", "헥토파스칼"], rightAnswer: "헤르쯔"),
        Quiz(level: .Beginning, question: "√", options: ["루트", "나누기"], rightAnswer: "루트"),
        Quiz(level: .Beginning, question: "Σ", options: ["대괄호", "시그마"], rightAnswer: "시그마"),
        Quiz(level: .Beginning, question: "π", options: ["파이", "ㅠㅠ"], rightAnswer: "파이"),
        Quiz(level: .Beginning, question: "♲", options: ["방사능", "재활용"], rightAnswer: "재활용"),
        Quiz(level: .Beginning, question: "♤", options: ["스페이드", "클로버"], rightAnswer: "스페이드"),
        Quiz(level: .Beginning, question: "℃", options: ["섭씨", "화씨"], rightAnswer: "섭씨")
    ]

}
