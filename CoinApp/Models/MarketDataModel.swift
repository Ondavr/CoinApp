//
//  MarketDataModel.swift
//  CoinApp
//
//  Created by Davron Usmanov on 12/01/22.
//

import Foundation

// CoinMarketData :
/*
 URL : https://api.coingecko.com/api/v3/global

 JSON response:
 
 {
   "data": {
     "active_cryptocurrencies": 12404,
     "upcoming_icos": 0,
     "ongoing_icos": 50,
     "ended_icos": 3375,
     "markets": 721,
     "total_market_cap": {
       "btc": 50027400.07719028,
       "eth": 656557740.2904894,
       "ltc": 16109147472.778044,
       "bch": 5765726898.420174,
       "bnb": 4593140646.693474,
       "eos": 763355304960.2223,
       "xrp": 2793668080718.699,
       "xlm": 7886850793043.129,
       "link": 81481234251.79108,
       "dot": 81670414606.07147,
       "yfi": 64530057.86403994,
       "usd": 2143360551954.5847,
       "aed": 7872541873723.699,
       "ars": 221801626484380.03,
       "aud": 2972123059776.109,
       "bdt": 183766608949506.62,
       "bhd": 808091938658.4711,
       "bmd": 2143360551954.5847,
       "brl": 11935731905669.49,
       "cad": 2689574555014.691,
       "chf": 1978806188938.8235,
       "clp": 1775238377156387.8,
       "cny": 13641846905025.37,
       "czk": 46022799332033.484,
       "dkk": 14030367442196.514,
       "eur": 1885516420914.9993,
       "gbp": 1572834410153.6604,
       "hkd": 16707817006568.79,
       "huf": 671508460852766.1,
       "idr": 30715131630799970,
       "ils": 6671021102230.06,
       "inr": 158433986242852.38,
       "jpy": 247260216634033.03,
       "krw": 2552290239032348.5,
       "kwd": 648182237958.7949,
       "lkr": 433641095308922,
       "mmk": 3800436027728901,
       "mxn": 43748773090750.11,
       "myr": 8972107270481.895,
       "ngn": 888422948785174.1,
       "nok": 18712890079071.797,
       "nzd": 3160172941162.396,
       "php": 109663977390562.06,
       "pkr": 378624641502777.75,
       "pln": 8546750938864.866,
       "rub": 159542114365015.62,
       "sar": 8044778040957.619,
       "sek": 19372792212528.715,
       "sgd": 2895326451199.5723,
       "thb": 71455722739076.88,
       "try": 29672201225135.082,
       "twd": 59309997226690.26,
       "uah": 58855459041158.5,
       "vef": 214614692067.21292,
       "vnd": 48657449771358000,
       "zar": 33188819312808.63,
       "xdr": 1528529004184.2034,
       "xag": 94462957855.54141,
       "xau": 1180070019.0896366,
       "bits": 50027400077190.28,
       "sats": 5002740007719028
     },
     "total_volume": {
       "btc": 2469043.6906361994,
       "eth": 32403637.68057799,
       "ltc": 795048091.002545,
       "bch": 284560692.71060324,
       "bnb": 226689072.7166513,
       "eos": 37674506300.89917,
       "xrp": 137878213494.75262,
       "xlm": 389246276230.7498,
       "link": 4021410807.3619885,
       "dot": 4030747581.9976397,
       "yfi": 3184805.366254506,
       "usd": 105783047677.8039,
       "aed": 388540076290.0983,
       "ars": 10946759287892.676,
       "aud": 146685649808.14215,
       "bdt": 9069585580627.92,
       "bhd": 39882430418.53338,
       "bmd": 105783047677.8039,
       "brl": 589074057603.3862,
       "cad": 132740799548.01543,
       "chf": 97661659975.38817,
       "clp": 87614809239141.22,
       "cny": 673277363554.9197,
       "czk": 2271401314896.2983,
       "dkk": 692452339258.3317,
       "eur": 93057452825.21172,
       "gbp": 77625398697.78316,
       "hkd": 824594724105.6334,
       "huf": 33141512969275.734,
       "idr": 1515909318554903,
       "ils": 329240426988.96826,
       "inr": 7819323680856.517,
       "jpy": 12203238163159.143,
       "krw": 125965293052045.1,
       "kwd": 31990274580.43544,
       "lkr": 21401847961737.97,
       "mmk": 187566065425192.3,
       "mxn": 2159169415282.913,
       "myr": 442807837579.2872,
       "ngn": 43847073262449.65,
       "nok": 923552755330.312,
       "nzd": 155966631279.20193,
       "php": 5412337060260.144,
       "pkr": 18686575372284.074,
       "pln": 421814874418.48474,
       "rub": 7874014045421.178,
       "sar": 397040590435.38904,
       "sek": 956121451615.4515,
       "sgd": 142895443209.84625,
       "thb": 3526613438166.826,
       "try": 1464436710865.7896,
       "twd": 2927175392250.2583,
       "uah": 2904742192895.329,
       "vef": 10592056563.978521,
       "vnd": 2401431399094338,
       "zar": 1637995274539.9055,
       "xdr": 75438757319.23509,
       "xag": 4662108559.153349,
       "xau": 58240972.55996852,
       "bits": 2469043690636.199,
       "sats": 246904369063619.94
     },
     "market_cap_percentage": {
       "btc": 37.83282498827659,
       "eth": 18.134852914772303,
       "usdt": 3.670721333601036,
       "bnb": 3.6611265470114387,
       "sol": 2.0677537331066533,
       "usdc": 2.066072094134834,
       "ada": 1.8519434824147307,
       "xrp": 1.702564185798679,
       "dot": 1.3141506007356458,
       "luna": 1.2970452987662129
     },
     "market_cap_change_percentage_24h_usd": 3.519987640410954,
     "updated_at": 1641981878
   }
 }
 */


struct GlobalData: Codable {
    let data: MarketDataModel?
}

// MARK: - DataClass
struct MarketDataModel: Codable {
    
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
 
    enum CodingKeys: String, CodingKey {

        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
            if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
                return "$" + item.value.formattedWithAbbreviations()
            }
            return ""
        }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
     }
    
    var bitcoinDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
    
    
}



