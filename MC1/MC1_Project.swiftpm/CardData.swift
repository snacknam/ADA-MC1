//
//  Data.swift
//  MC1_Project
//
//  Created by 관식 on 2023/03/30.
//

import Foundation

struct CardData {
    var cardEmoji: String
    var cardTitle: String
    var cardDescription: String
}

var cardNumber = Int.random(in: 0..<card.count)

let card = [
    CardData(
        cardEmoji: "🧙‍♂️",
        cardTitle: "옹달샘 현자를 찾아서...",
        cardDescription: "다같이 일어나서 카페테리아로 갑니다. 물을 한 잔 마시고 가장 먼저 눈이 마주친 멘토에게 조언을 구합니다."
    ),
    CardData(
        cardEmoji: "🤫",
        cardTitle: "깊은 사념에 침묵한 그대여...",
        cardDescription: "오늘 제일 조용했던 사람을 지목해보세요. 가장 많은 지목을 당한 사람이 결정권자!"
    ),
    CardData(
        cardEmoji: "✈️",
        cardTitle: "잠시 동심으로 가보자!",
        cardDescription: "각자 종이 비행기를 접어 가장 멀리 날린 사람의 의견을 따르세요."
    ),
    CardData(
        cardEmoji: "🧻",
        cardTitle: "심호흡을 해보자!",
        cardDescription: "얼굴에 휴지를 올려 입으로 바람을 부는 게임! 휴지가 가장 오래 공중에 떠있는 사람의 의견을 따릅니다."
    ),
    CardData(
        cardEmoji: "📚",
        cardTitle: "마음의 양식",
        cardDescription: "링고의 책장에 갑니다. 책장에서 책을 한권 선택하세요. 펼침면 왼쪽에 알파벳 C가 가장 많이 나온 사람의 의견으로 통일합니다."
    ),
    CardData(
        cardEmoji: "👖",
        cardTitle: "외부인의 시선",
        cardDescription: "메인랩에 있는 러너 중 청바지를 입은 사람을 찾으세요. 잠시 초대해 토론중인 내용을 설명하고 그 러너의 의견을 적극 수용합니다."
    ),
    CardData(
        cardEmoji: "👀",
        cardTitle: "눈치게임",
        cardDescription: "멘토 이름 말하기 눈치게임입니다. 가장 늦게 말한 사람 또는 이름을 언급하지 않은 최후의 사람이 결정권자!"
    ),
    CardData(
        cardEmoji: "🍧",
        cardTitle: "베스킨라빈스 31",
        cardDescription: "가위바위보로 이긴 사람이 순서 및 방향 정합니다. 한 사람 당 숫자 3개까지 말할 수 있습니다. '31'을 말하는 사람이 결정권자 당첨!"
    ),
    CardData(
        cardEmoji: "🅰️ 🅱️",
        cardTitle: "초성퀴즈",
        cardDescription: "제한시간 내에 말하지 못하는 사람은 탈락입니다. 공정한 심사를 위해 심사위원을 한 명 초빙하기를 권유합니다. 제시 초성 : ᄋᄂ"
    ),
    CardData(
        cardEmoji: "🗣️",
        cardTitle: "이 순간 당신도 이야기 작가",
        cardDescription: "아래의 템플릿에 맞춰 이야기 만들기! 말하는 순서는 선착순! 이야기가 이어지지 않아도 괜찮아요. 끊기는 사람 또는 마지막에 말하는 사람이 결정권자! 옛날 옛적에... 매일 매일... 그러던 어느날... 그것 때문에... 그것 때문에... 마침내... 그날 이후로... 이 이야기의 교훈은..."
    ),
    CardData(
        cardEmoji: "🐔",
        cardTitle: "건강한 체력에 건강한 정신이!",
        cardDescription: "닭싸움 최강자의 의견을 따릅니다. (제한시간 5분)"
    ),
    CardData(
        cardEmoji: "🙌🏻",
        cardTitle: "지성과 체력을 써보자!",
        cardDescription: "손바닥 밀치기 승자의 의견을 따릅니다. (토너먼트 진행)"
    ),
    CardData(
        cardEmoji: "🔖",
        cardTitle: "제비뽑기",
        cardDescription: "쉽죠?"
    ),
    CardData(
        cardEmoji: "✊✋✌️",
        cardTitle: "가위 바위 보",
        cardDescription: "이긴 사람에게 반박불가!"
    ),
    CardData(
        cardEmoji: "🎉",
        cardTitle: "당신은 사랑받기 위해 태어난 사람",
        cardDescription: "오늘 기준으로 가장 가까운 생일의 사람이 오늘 하루 왕!"
    )]

