//
//  CryptoCurrencyItem.swift
//  Crypticc
//
//  Created by Squiretoss on 2.04.2020.
//  Copyright © 2020 Oguz Demirhan. All rights reserved.
//

import Foundation

struct CryptoCurrencyItem: Codable {
    let status: String
    let data: DataClass
}

struct DataClass: Codable {
    let stats: Stats
    let base: Base
    let coins: [Coin]
}

// MARK: - Base
struct Base: Codable {
    let symbol, sign: String
}

// MARK: - Coin
struct Coin: Codable {
    let id: Int
    let uuid, slug, symbol, name: String
    let coinDescription, color: String?
    let iconType: IconType
    let iconURL: String
    let websiteURL: String?
    let socials, links: [Link]
    let confirmedSupply: Bool
    let numberOfMarkets, numberOfExchanges: Int
    let type: CoinType
    let volume, marketCap: Int
    let price: String
    let circulatingSupply, totalSupply: Double
    let approvedSupply: Bool
    let firstSeen: Int
    let change: Double
    let rank: Int
    let history: [String]
    let allTimeHigh: AllTimeHigh
    let penalty: Bool

    enum CodingKeys: String, CodingKey {
        case id, uuid, slug, symbol, name
        case coinDescription = "description"
        case color, iconType
        case iconURL = "iconUrl"
        case websiteURL = "websiteUrl"
        case socials, links, confirmedSupply, numberOfMarkets, numberOfExchanges, type, volume, marketCap, price, circulatingSupply, totalSupply, approvedSupply, firstSeen, change, rank, history, allTimeHigh, penalty
    }
}

// MARK: - AllTimeHigh
struct AllTimeHigh: Codable {
    let price: String
    let timestamp: Int
}

enum IconType: String, Codable {
    case vector = "vector"
}

// MARK: - Link
struct Link: Codable {
    let name: String
    let type: LinkType
    let url: String
}

enum LinkType: String, Codable {
    case bitcointalk = "bitcointalk"
    case discord = "discord"
    case explorer = "explorer"
    case facebook = "facebook"
    case github = "github"
    case instagram = "instagram"
    case medium = "medium"
    case reddit = "reddit"
    case telegram = "telegram"
    case twitter = "twitter"
    case website = "website"
    case youtube = "youtube"
}

enum CoinType: String, Codable {
    case coin = "coin"
}

// MARK: - Stats
struct Stats: Codable {
    let total, offset, limit: Int
    let order, base: String
    let totalMarkets, totalExchanges: Int
    let totalMarketCap, total24HVolume: Double

    enum CodingKeys: String, CodingKey {
        case total, offset, limit, order, base, totalMarkets, totalExchanges, totalMarketCap
        case total24HVolume = "total24hVolume"
    }
}
