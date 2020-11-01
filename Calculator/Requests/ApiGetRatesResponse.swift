//
//  ApiGetRatesResponse.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 1/11/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import Foundation

final class ApiGetRatesResponse: Codable {

    var rates: Rates?
    var base: String?
    var timestamp: Int?
    var date: String?
    var success: Bool?

    enum CodingKeys: String, CodingKey {
        case rates = "rates"
        case base = "base"
        case timestamp = "timestamp"
        case date = "date"
        case success = "success"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rates = try? values.decode(Rates.self, forKey: .rates)
        base = try? values.decode(String.self, forKey: .base)
        timestamp = try? values.decode(Int.self, forKey: .timestamp)
        date = try? values.decode(String.self, forKey: .date)
        success = try? values.decode(Bool.self, forKey: .success)
    }
}

struct Rates: Codable {

    var PHP: Double?
    var SRD: Double?
    var USD: Double?
    var CAD: Double?
    var LVL: Double?
    var HRK: Double?
    var BDT: Double?
    var NGN: Double?
    var NIO: Double?
    var AED: Double?
    var CLP: Double?
    var GNF: Double?
    var XCD: Double?
    var UZS: Double?
    var AUD: Double?
    var JEP: Double?
    var SCR: Double?
    var NOK: Double?
    var XPF: Double?
    var CUC: Double?
    var THB: Double?
    var KZT: Double?
    var HNL: Double?
    var BTC: Double?
    var XAF: Double?
    var KWD: Double?
    var BHD: Double?
    var MMK: Double?
    var MAD: Double?
    var EUR: Double?
    var CDF: Double?
    var EGP: Double?
    var HTG: Double?
    var AFN: Double?
    var PAB: Double?
    var KES: Double?
    var DZD: Double?
    var SBD: Double?
    var MOP: Double?
    var VND: Double?
    var TZS: Double?
    var HUF: Double?
    var NAD: Double?
    var RWF: Double?
    var MZN: Double?
    var AZN: Double?
    var ZWL: Double?
    var GIP: Double?
    var COP: Double?
    var AWG: Double?
    var IMP: Double?
    var BTN: Double?
    var OMR: Double?
    var MXN: Double?
    var LAK: Double?
    var BOB: Double?
    var TOP: Double?
    var FJD: Double?
    var SZL: Double?
    var LRD: Double?
    var QAR: Double?
    var JMD: Double?
    var UYU: Double?
    var MRO: Double?
    var IRR: Double?
    var SVC: Double?
    var CHF: Double?
    var MYR: Double?
    var LYD: Double?
    var TWD: Double?
    var RSD: Double?
    var KRW: Double?
    var STD: Double?
    var MDL: Double?
    var CZK: Double?
    var BWP: Double?
    var TRY: Double?
    var WST: Double?
    var PLN: Double?
    var GTQ: Double?
    var DKK: Double?
    var ZMK: Double?
    var GMD: Double?
    var KHR: Double?
    var GEL: Double?
    var GGP: Double?
    var ALL: Double?
    var SYP: Double?
    var TJS: Double?
    var SLL: Double?
    var GHS: Double?
    var IDR: Double?
    var KPW: Double?
    var BRL: Double?
    var UGX: Double?
    var FKP: Double?
    var LSL: Double?
    var BMD: Double?
    var JPY: Double?
    var LKR: Double?
    var BGN: Double?
    var TMT: Double?
    var SGD: Double?
    var NPR: Double?
    var MKD: Double?
    var LBP: Double?
    var INR: Double?
    var ERN: Double?
    var DOP: Double?
    var PEN: Double?
    var LTL: Double?
    var ZMW: Double?
    var VUV: Double?
    var GYD: Double?
    var BZD: Double?
    var BIF: Double?
    var KMF: Double?
    var CNY: Double?
    var XDR: Double?
    var ANG: Double?
    var CLF: Double?
    var ILS: Double?
    var GBP: Double?
    var MVR: Double?
    var BYN: Double?
    var MNT: Double?
    var BBD: Double?
    var UAH: Double?
    var RON: Double?
    var KGS: Double?
    var XAG: Double?
    var TND: Double?
    var JOD: Double?
    var VEF: Double?
    var AMD: Double?
    var SAR: Double?
    var SOS: Double?
    var YER: Double?
    var PYG: Double?
    var SHP: Double?
    var HKD: Double?
    var NZD: Double?
    var BYR: Double?
    var SDG: Double?
    var MUR: Double?
    var CUP: Double?
    var BND: Double?
    var KYD: Double?
    var XAU: Double?
    var AOA: Double?
    var MGA: Double?
    var MWK: Double?
    var ISK: Double?
    var SEK: Double?
    var BAM: Double?
    var TTD: Double?
    var BSD: Double?
    var ETB: Double?
    var XOF: Double?
    var RUB: Double?
    var IQD: Double?
    var CRC: Double?
    var DJF: Double?
    var CVE: Double?
    var PKR: Double?
    var PGK: Double?
    var ARS: Double?
    var ZAR: Double?

    enum CodingKeys: String, CodingKey {
        case PHP = "PHP"
        case SRD = "SRD"
        case USD = "USD"
        case CAD = "CAD"
        case LVL = "LVL"
        case HRK = "HRK"
        case BDT = "BDT"
        case NGN = "NGN"
        case NIO = "NIO"
        case AED = "AED"
        case CLP = "CLP"
        case GNF = "GNF"
        case XCD = "XCD"
        case UZS = "UZS"
        case AUD = "AUD"
        case JEP = "JEP"
        case SCR = "SCR"
        case NOK = "NOK"
        case XPF = "XPF"
        case CUC = "CUC"
        case THB = "THB"
        case KZT = "KZT"
        case HNL = "HNL"
        case BTC = "BTC"
        case XAF = "XAF"
        case KWD = "KWD"
        case BHD = "BHD"
        case MMK = "MMK"
        case MAD = "MAD"
        case EUR = "EUR"
        case CDF = "CDF"
        case EGP = "EGP"
        case HTG = "HTG"
        case AFN = "AFN"
        case PAB = "PAB"
        case KES = "KES"
        case DZD = "DZD"
        case SBD = "SBD"
        case MOP = "MOP"
        case VND = "VND"
        case TZS = "TZS"
        case HUF = "HUF"
        case NAD = "NAD"
        case RWF = "RWF"
        case MZN = "MZN"
        case AZN = "AZN"
        case ZWL = "ZWL"
        case GIP = "GIP"
        case COP = "COP"
        case AWG = "AWG"
        case IMP = "IMP"
        case BTN = "BTN"
        case OMR = "OMR"
        case MXN = "MXN"
        case LAK = "LAK"
        case BOB = "BOB"
        case TOP = "TOP"
        case FJD = "FJD"
        case SZL = "SZL"
        case LRD = "LRD"
        case QAR = "QAR"
        case JMD = "JMD"
        case UYU = "UYU"
        case MRO = "MRO"
        case IRR = "IRR"
        case SVC = "SVC"
        case CHF = "CHF"
        case MYR = "MYR"
        case LYD = "LYD"
        case TWD = "TWD"
        case RSD = "RSD"
        case KRW = "KRW"
        case STD = "STD"
        case MDL = "MDL"
        case CZK = "CZK"
        case BWP = "BWP"
        case TRY = "TRY"
        case WST = "WST"
        case PLN = "PLN"
        case GTQ = "GTQ"
        case DKK = "DKK"
        case ZMK = "ZMK"
        case GMD = "GMD"
        case KHR = "KHR"
        case GEL = "GEL"
        case GGP = "GGP"
        case ALL = "ALL"
        case SYP = "SYP"
        case TJS = "TJS"
        case SLL = "SLL"
        case GHS = "GHS"
        case IDR = "IDR"
        case KPW = "KPW"
        case BRL = "BRL"
        case UGX = "UGX"
        case FKP = "FKP"
        case LSL = "LSL"
        case BMD = "BMD"
        case JPY = "JPY"
        case LKR = "LKR"
        case BGN = "BGN"
        case TMT = "TMT"
        case SGD = "SGD"
        case NPR = "NPR"
        case MKD = "MKD"
        case LBP = "LBP"
        case INR = "INR"
        case ERN = "ERN"
        case DOP = "DOP"
        case PEN = "PEN"
        case LTL = "LTL"
        case ZMW = "ZMW"
        case VUV = "VUV"
        case GYD = "GYD"
        case BZD = "BZD"
        case BIF = "BIF"
        case KMF = "KMF"
        case CNY = "CNY"
        case XDR = "XDR"
        case ANG = "ANG"
        case CLF = "CLF"
        case ILS = "ILS"
        case GBP = "GBP"
        case MVR = "MVR"
        case BYN = "BYN"
        case MNT = "MNT"
        case BBD = "BBD"
        case UAH = "UAH"
        case RON = "RON"
        case KGS = "KGS"
        case XAG = "XAG"
        case TND = "TND"
        case JOD = "JOD"
        case VEF = "VEF"
        case AMD = "AMD"
        case SAR = "SAR"
        case SOS = "SOS"
        case YER = "YER"
        case PYG = "PYG"
        case SHP = "SHP"
        case HKD = "HKD"
        case NZD = "NZD"
        case BYR = "BYR"
        case SDG = "SDG"
        case MUR = "MUR"
        case CUP = "CUP"
        case BND = "BND"
        case KYD = "KYD"
        case XAU = "XAU"
        case AOA = "AOA"
        case MGA = "MGA"
        case MWK = "MWK"
        case ISK = "ISK"
        case SEK = "SEK"
        case BAM = "BAM"
        case TTD = "TTD"
        case BSD = "BSD"
        case ETB = "ETB"
        case XOF = "XOF"
        case RUB = "RUB"
        case IQD = "IQD"
        case CRC = "CRC"
        case DJF = "DJF"
        case CVE = "CVE"
        case PKR = "PKR"
        case PGK = "PGK"
        case ARS = "ARS"
        case ZAR = "ZAR"
    }
}
