//
//  Model.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//

import Foundation

// MARK: - Todos
struct Todos: Codable {
    let devicesMap: DevicesMap
}

// MARK: - DevicesMap
struct DevicesMap: Codable {
    let clearance: Clearance
    let preOwned: PreOwned
    let rogersSmartPhones: RogersSmartPhones
    let rogersBasicPhones: RogersBasicPhones
    
    enum CodingKeys: String, CodingKey {
        case clearance = "Clearance"
        case preOwned = "PreOwned"
        case rogersSmartPhones, rogersBasicPhones
    }
}

// MARK: - Clearance
struct Clearance: Codable {
    let modelMap: ClearanceModelMap
    let manufacturerMap: ClearanceManufacturerMap
    let categoryMap: CategoryMap
    let displayOrder: Int
}

// MARK: - CategoryMap
struct CategoryMap: Codable {
    let en, fr: String
    
    enum CodingKeys: String, CodingKey {
        case en = "EN"
        case fr = "FR"
    }
}

// MARK: - ClearanceManufacturerMap
struct ClearanceManufacturerMap: Codable {
    let google, samsung, huawei: Google
    
    enum CodingKeys: String, CodingKey {
        case google = "Google"
        case samsung = "Samsung"
        case huawei = "Huawei"
    }
}

// MARK: - Google
struct Google: Codable {
    let name: CategoryMap
    let modelCount: Int
}

// MARK: - ClearanceModelMap
struct ClearanceModelMap: Codable {
    let prod900429, prod900428: Prod90042
    let prod340317, prod900427: Prod340317Class
}

// MARK: - Prod340317Class
struct Prod340317Class: Codable {
    let manufacturerMap: CategoryMap
    let manufacturer: String
    let displayName, size: CategoryMap
    let skusByMemory: [PurpleSkusByMemory]
    let id: String
    let boosterPoints: Int
    let deviceType: String
    let exclusiveOfferPresent: Bool
    let mediaMap: MediaMap
    let limitedOfferPresent, exclusivePricingAvailable, currentExclusiveOfferPresent: Bool
}

// MARK: - MediaMap
struct MediaMap: Codable {
    let osIcon: OSIcon
    
    enum CodingKeys: String, CodingKey {
        case osIcon = "os_icon"
    }
}

// MARK: - OSIcon
struct OSIcon: Codable {
    let url: URLEnum
}

enum URLEnum: String, Codable {
    case android = "android"
    case apple = "apple"
    case blackberry = "blackberry"
}

// MARK: - PurpleSkusByMemory
struct PurpleSkusByMemory: Codable {
    let wirelessSKUMap: [PurpleWirelessSKUMap]
}

// MARK: - PurpleWirelessSKUMap
struct PurpleWirelessSKUMap: Codable {
    let externalID, id: String
    let displayName, color, memoryMap, size: CategoryMap
    let memory: String
    let price: Int
    let exclusiveOfferPresent: Bool
    let exclusiveOfferDevicePrice, maxDeviceBALWaiverAmnt, connectionFee: Int
    let featuresList: FeaturesList
    let promotionsList: PromotionsList
    let marketingContent: CategoryMap
    let limitedOfferPresent: Bool
    let defaultPricePlanCategory: PurpleDefaultPricePlanCategory
    let defaultLowestMSF: Int
    let deviceTerm: String
    let featureGroupMap: FeatureGroupMap
    let noTermPrice: Int
    let bogoOfferPresent: Bool
    let strikePrice: Int
    let fidoFave, gwpOffersPresent: Bool
    let lowestMSFByCategory: PurpleLowestMSFByCategory
    let monthlyInstallmentAmount, financingAmount, installments: Int
    let financing: Bool
    let mandatoryPayment: Int
    let deviceEligibleForExpShip: Bool
    let rvAmount, sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case externalID = "externalId"
        case id, displayName, color, memoryMap, size, memory, price, exclusiveOfferPresent, exclusiveOfferDevicePrice
        case maxDeviceBALWaiverAmnt = "maxDeviceBalWaiverAmnt"
        case connectionFee, featuresList, promotionsList, marketingContent, limitedOfferPresent, defaultPricePlanCategory, defaultLowestMSF, deviceTerm, featureGroupMap, noTermPrice, bogoOfferPresent, strikePrice, fidoFave, gwpOffersPresent, lowestMSFByCategory, monthlyInstallmentAmount, financingAmount, installments, financing, mandatoryPayment, deviceEligibleForExpShip, rvAmount, sortOrder
    }
}

enum PurpleDefaultPricePlanCategory: String, Codable {
    case edge20Tab = "EDGE20TAB"
}

// MARK: - FeatureGroupMap
struct FeatureGroupMap: Codable {
    let en, fr: [FeatureGroupMapEN]
    
    enum CodingKeys: String, CodingKey {
        case en = "EN"
        case fr = "FR"
    }
}

// MARK: - FeatureGroupMapEN
struct FeatureGroupMapEN: Codable {
    let specificationGroup: [SpecificationGroup]
    let groupHeading: GroupHeading
}

enum GroupHeading: String, Codable {
    case accessibility = "Accessibility"
    case accessibilité = "Accessibilité"
    case alarmesEtSonneries = "Alarmes et sonneries"
    case alertsAndRingtones = "Alerts and Ringtones"
    case appareil = "Appareil"
    case appareilPhoto = "Appareil photo"
    case appareilPhotoEtVidéo = "Appareil photo et vidéo "
    case applications = "Applications"
    case battery = "Battery"
    case camera = "Camera"
    case cameraVideo = "Camera & Video"
    case composantesEssentielles = "Composantes essentielles"
    case connectivity = "Connectivity"
    case connectivité = "Connectivité"
    case coreComponents = "Core Components "
    case cpu = "CPU"
    case dimensions = "Dimensions"
    case display = "Display"
    case hardware = "Hardware"
    case interface = "Interface"
    case laBoîteComprend = "La boîte comprend"
    case logiciel = "Logiciel"
    case memory = "Memory"
    case messagerie = "Messagerie"
    case messaging = "Messaging"
    case music = "Music "
    case musique = "Musique"
    case mémoire = "Mémoire"
    case pile = "Pile"
    case software = "Software"
    case whatSInTheBox = "What's in the Box"
    case écran = "Écran"
}

// MARK: - SpecificationGroup
struct SpecificationGroup: Codable {
    let displayName, displayValue: String
    let definitionKey: DefinitionKey
}

enum DefinitionKey: String, Codable {
    case amazonApp = "AmazonApp"
    case androidMessagesDefaultClientYN = "AndroidMessages(Default Client?Y/N)"
    case appStore = "AppStore"
    case bluetoothSupport = "bluetoothSupport"
    case callerID = "CallerID"
    case cameraResolution = "CameraResolution"
    case capacity = "Capacity"
    case cnap = "CNAP"
    case colour = "Colour"
    case comesWith = "ComesWith"
    case desktopSoftware = "DesktopSoftware"
    case deviceMemory = "DeviceMemory"
    case deviceSpeed = "deviceSpeed"
    case digitalTTYTDD = "Digital_TTY/TDD"
    case email = "Email"
    case enhancedMessaging = "EnhancedMessaging"
    case expandableMemory = "ExpandableMemory"
    case expandableStorage = "ExpandableStorage"
    case fmRadio = "FMRadio"
    case fmTransmitter = "FMTransmitter"
    case formFactor = "formFactor"
    case gps = "GPS"
    case gsMbands = "GSMbands"
    case gsmTalktime = "GSMTalktime"
    case handsFreeSpeaker = "Hands-freeSpeaker"
    case hearingAidCompatible = "HearingAidCompatible"
    case hspAbands = "HSPAbands"
    case includedLanguages = "IncludedLanguages"
    case instant = "instant"
    case internalMemory = "internal_memory"
    case ltEbands = "LTEbands"
    case lteTalktime = "LTETalktime"
    case musicPlayback = "musicPlayback"
    case myRogersFidoAccountAppURL = "MyRogers/FidoAccount(App&URL)"
    case nhlApp = "NHLApp"
    case numberOfColours = "NumberOfColours"
    case picture = "picture"
    case platformOperatingSystem = "Platform/OperatingSystem"
    case preInstalledGamesApplications = "Pre-installedGames&Applications"
    case processor = "Processor"
    case processorSpeed = "ProcessorSpeed"
    case ram = "RAM"
    case resolution = "Resolution"
    case resolutionFront = "ResolutionFront"
    case resolutionRear = "ResolutionRear"
    case rogersFidoAppZone = "Rogers/FidoAppZone"
    case rom = "ROM"
    case screenType = "ScreenType"
    case simCard = "SIMCard"
    case simCardFormFactor = "SIMCardFormFactor"
    case size = "Size"
    case spotifyApp = "SpotifyApp"
    case standByTime = "standByTime"
    case supportedMusicFormats = "SupportedMusicFormats"
    case supportedRingtoneFormats = "SupportedRingtoneFormats"
    case talkTime = "talkTime"
    case talkTimeHSPA = "TalkTimeHSPA"
    case talkTimeVoLTE = "TalkTimeVoLTE"
    case text = "text"
    case textInputMethod = "textInputMethod"
    case textureApp = "TextureApp"
    case vibrate = "Vibrate"
    case videoCalling = "VideoCalling"
    case videoCapture = "VideoCapture"
    case videoPlayback = "VideoPlayback"
    case voLTESupport = "VoLTESupport"
    case volume = "volume"
    case webBrowser = "WebBrowser"
    case weight = "weight"
    case wiFi = "WiFi"
    case wiFiCalling = "WiFiCalling"
    case zoom = "Zoom"
}

// MARK: - FeaturesList
struct FeaturesList: Codable {
    let en, fr: [FeaturesListEN]
    
    enum CodingKeys: String, CodingKey {
        case en = "EN"
        case fr = "FR"
    }
}

// MARK: - FeaturesListEN
struct FeaturesListEN: Codable {
    let featuretitle: String
    let featureicon: String
    let longdescription, legalreferenceid: String
}

// MARK: - PurpleLowestMSFByCategory
struct PurpleLowestMSFByCategory: Codable {
    let edge20Tab: Int
    
    enum CodingKeys: String, CodingKey {
        case edge20Tab = "EDGE20TAB"
    }
}

// MARK: - PromotionsList
struct PromotionsList: Codable {
    let en, fr: [PromotionsListEN]
    
    enum CodingKeys: String, CodingKey {
        case en = "EN"
        case fr = "FR"
    }
}

// MARK: - PromotionsListEN
struct PromotionsListEN: Codable {
    let imgpath, altdescription, enDescription, expdate: String
    
    enum CodingKeys: String, CodingKey {
        case imgpath, altdescription
        case enDescription = "description"
        case expdate
    }
}

// MARK: - Prod90042
struct Prod90042: Codable {
    let manufacturerMap: CategoryMap
    let manufacturer: String
    let displayName, size: CategoryMap
    let skusByMemory: [Prod900428SkusByMemory]
    let id: String
    let boosterPoints: Int
    let deviceType: String
    let exclusiveOfferPresent: Bool
    let mediaMap: MediaMap
    let limitedOfferPresent, exclusivePricingAvailable, currentExclusiveOfferPresent: Bool
}

// MARK: - Prod900428SkusByMemory
struct Prod900428SkusByMemory: Codable {
    let wirelessSKUMap: [FluffyWirelessSKUMap]
}

// MARK: - FluffyWirelessSKUMap
struct FluffyWirelessSKUMap: Codable {
    let externalID, id: String
    let displayName, color, memoryMap, size: CategoryMap
    let memory: String
    let price: Int
    let exclusiveOfferPresent: Bool
    let exclusiveOfferDevicePrice, maxDeviceBALWaiverAmnt, connectionFee: Int
    let featuresList: FeaturesList
    let promotionsList: FeaturesListClass
    let marketingContent: CategoryMap
    let limitedOfferPresent: Bool
    let defaultPricePlanCategory: PurpleDefaultPricePlanCategory
    let defaultLowestMSF: Int
    let deviceTerm: String
    let featureGroupMap: FeatureGroupMap
    let noTermPrice: Int
    let bogoOfferPresent: Bool
    let strikePrice: Int
    let fidoFave, gwpOffersPresent: Bool
    let lowestMSFByCategory: PurpleLowestMSFByCategory
    let monthlyInstallmentAmount, financingAmount, installments: Int
    let financing: Bool
    let mandatoryPayment: Int
    let deviceEligibleForExpShip: Bool
    let rvAmount, sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case externalID = "externalId"
        case id, displayName, color, memoryMap, size, memory, price, exclusiveOfferPresent, exclusiveOfferDevicePrice
        case maxDeviceBALWaiverAmnt = "maxDeviceBalWaiverAmnt"
        case connectionFee, featuresList, promotionsList, marketingContent, limitedOfferPresent, defaultPricePlanCategory, defaultLowestMSF, deviceTerm, featureGroupMap, noTermPrice, bogoOfferPresent, strikePrice, fidoFave, gwpOffersPresent, lowestMSFByCategory, monthlyInstallmentAmount, financingAmount, installments, financing, mandatoryPayment, deviceEligibleForExpShip, rvAmount, sortOrder
    }
}

// MARK: - FeaturesListClass
struct FeaturesListClass: Codable {
}

// MARK: - PreOwned
struct PreOwned: Codable {
    let modelMap: PreOwnedModelMap
    let manufacturerMap: PreOwnedManufacturerMap
    let categoryMap: CategoryMap
    let displayOrder: Int
}

// MARK: - PreOwnedManufacturerMap
struct PreOwnedManufacturerMap: Codable {
    let google, apple, blackBerry, samsung: Google
    let huawei: Google
    
    enum CodingKeys: String, CodingKey {
        case google = "Google"
        case apple = "Apple"
        case blackBerry = "BlackBerry"
        case samsung = "Samsung"
        case huawei = "Huawei"
    }
}

// MARK: - PreOwnedModelMap
struct PreOwnedModelMap: Codable {
    let prod1220368: Prod1220368Class
    let prod1220510, prod1270346, prod1270343, prod1270342: Prod1220509Class
    let prod1270345, prod1220509, prod1270344: Prod1220509Class
    let prod1151144: Prod1151144
}

// MARK: - Prod1151144
struct Prod1151144: Codable {
    let manufacturerMap: CategoryMap
    let manufacturer: String
    let displayName, size: CategoryMap
    let skusByMemory: [Prod1151144SkusByMemory]
    let id: String
    let boosterPoints: Int
    let deviceType: String
    let exclusiveOfferPresent: Bool
    let mediaMap: MediaMap
    let limitedOfferPresent, exclusivePricingAvailable, currentExclusiveOfferPresent: Bool
}

// MARK: - Prod1151144SkusByMemory
struct Prod1151144SkusByMemory: Codable {
    let wirelessSKUMap: [TentacledWirelessSKUMap]
}

// MARK: - TentacledWirelessSKUMap
struct TentacledWirelessSKUMap: Codable {
    let externalID, id: String
    let displayName, color, memoryMap, size: CategoryMap
    let memory: String
    let price: Int
    let exclusiveOfferPresent: Bool
    let exclusiveOfferDevicePrice, maxDeviceBALWaiverAmnt, connectionFee: Int
    let featuresList: FeaturesListClass
    let promotionsList: PromotionsList
    let marketingContent: FeaturesListClass
    let limitedOfferPresent: Bool
    let defaultPricePlanCategory: String
    let defaultLowestMSF: Int
    let deviceTerm: String
    let featureGroupMap: FeatureGroupMap
    let noTermPrice: Int
    let bogoOfferPresent: Bool
    let strikePrice: Int
    let fidoFave, gwpOffersPresent: Bool
    let lowestMSFByCategory: FluffyLowestMSFByCategory
    let monthlyInstallmentAmount, financingAmount, installments: Int
    let financing: Bool
    let mandatoryPayment: Int
    let deviceEligibleForExpShip: Bool
    let rvAmount, sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case externalID = "externalId"
        case id, displayName, color, memoryMap, size, memory, price, exclusiveOfferPresent, exclusiveOfferDevicePrice
        case maxDeviceBALWaiverAmnt = "maxDeviceBalWaiverAmnt"
        case connectionFee, featuresList, promotionsList, marketingContent, limitedOfferPresent, defaultPricePlanCategory, defaultLowestMSF, deviceTerm, featureGroupMap, noTermPrice, bogoOfferPresent, strikePrice, fidoFave, gwpOffersPresent, lowestMSFByCategory, monthlyInstallmentAmount, financingAmount, installments, financing, mandatoryPayment, deviceEligibleForExpShip, rvAmount, sortOrder
    }
}

// MARK: - FluffyLowestMSFByCategory
struct FluffyLowestMSFByCategory: Codable {
    let talkandtext: Int
    
    enum CodingKeys: String, CodingKey {
        case talkandtext = "TALKANDTEXT"
    }
}

// MARK: - Prod1220368Class
struct Prod1220368Class: Codable {
    let manufacturerMap: CategoryMap
    let manufacturer: String
    let displayName, size: CategoryMap
    let skusByMemory: [Prod1220368SkusByMemory]
    let id: String
    let boosterPoints: Int
    let deviceType: String
    let exclusiveOfferPresent: Bool
    let mediaMap: MediaMap?
    let limitedOfferPresent, exclusivePricingAvailable, currentExclusiveOfferPresent: Bool
}

// MARK: - Prod1220368SkusByMemory
struct Prod1220368SkusByMemory: Codable {
    let wirelessSKUMap: [StickyWirelessSKUMap]
}

// MARK: - StickyWirelessSKUMap
struct StickyWirelessSKUMap: Codable {
    let externalID, id: String
    let displayName, color, memoryMap, size: CategoryMap
    let memory: String
    let price: Int
    let exclusiveOfferPresent: Bool
    let exclusiveOfferDevicePrice, maxDeviceBALWaiverAmnt, connectionFee: Int
    let featuresList: FeaturesList
    let promotionsList: PromotionsList
    let marketingContent: CategoryMap
    let limitedOfferPresent: Bool
    let defaultPricePlanCategory: String
    let defaultLowestMSF: Int
    let deviceTerm: String
    let featureGroupMap: FeatureGroupMap
    let noTermPrice: Int
    let bogoOfferPresent: Bool
    let strikePrice: Int
    let fidoFave, gwpOffersPresent: Bool
    let lowestMSFByCategory: FluffyLowestMSFByCategory
    let monthlyInstallmentAmount, financingAmount, installments: Int
    let financing: Bool
    let mandatoryPayment: Int
    let deviceEligibleForExpShip: Bool
    let rvAmount, sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case externalID = "externalId"
        case id, displayName, color, memoryMap, size, memory, price, exclusiveOfferPresent, exclusiveOfferDevicePrice
        case maxDeviceBALWaiverAmnt = "maxDeviceBalWaiverAmnt"
        case connectionFee, featuresList, promotionsList, marketingContent, limitedOfferPresent, defaultPricePlanCategory, defaultLowestMSF, deviceTerm, featureGroupMap, noTermPrice, bogoOfferPresent, strikePrice, fidoFave, gwpOffersPresent, lowestMSFByCategory, monthlyInstallmentAmount, financingAmount, installments, financing, mandatoryPayment, deviceEligibleForExpShip, rvAmount, sortOrder
    }
}

// MARK: - Prod1220509Class
struct Prod1220509Class: Codable {
    let manufacturerMap: CategoryMap
    let manufacturer: String
    let displayName, size: CategoryMap
    let skusByMemory: [FluffySkusByMemory]
    let id: String
    let boosterPoints: Int
    let deviceType: String
    let exclusiveOfferPresent: Bool
    let mediaMap: MediaMap
    let limitedOfferPresent, exclusivePricingAvailable, currentExclusiveOfferPresent: Bool
}

// MARK: - FluffySkusByMemory
struct FluffySkusByMemory: Codable {
    let wirelessSKUMap: [IndigoWirelessSKUMap]
}

// MARK: - IndigoWirelessSKUMap
struct IndigoWirelessSKUMap: Codable {
    let externalID, id: String
    let displayName, color, memoryMap, size: CategoryMap
    let memory: Memory
    let price: Int
    let exclusiveOfferPresent: Bool
    let exclusiveOfferDevicePrice, maxDeviceBALWaiverAmnt, connectionFee: Int
    let featuresList: FeaturesList
    let promotionsList: PromotionsList
    let marketingContent: CategoryMap
    let limitedOfferPresent: Bool
    let defaultPricePlanCategory: FluffyDefaultPricePlanCategory
    let defaultLowestMSF: Int
    let deviceTerm: String
    let featureGroupMap: FeatureGroupMap
    let noTermPrice: Int
    let bogoOfferPresent: Bool
    let strikePrice: Int
    let fidoFave, gwpOffersPresent: Bool
    let lowestMSFByCategory: TentacledLowestMSFByCategory
    let monthlyInstallmentAmount, financingAmount, installments: Int
    let financing: Bool
    let mandatoryPayment: Int
    let deviceEligibleForExpShip: Bool
    let rvAmount, sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case externalID = "externalId"
        case id, displayName, color, memoryMap, size, memory, price, exclusiveOfferPresent, exclusiveOfferDevicePrice
        case maxDeviceBALWaiverAmnt = "maxDeviceBalWaiverAmnt"
        case connectionFee, featuresList, promotionsList, marketingContent, limitedOfferPresent, defaultPricePlanCategory, defaultLowestMSF, deviceTerm, featureGroupMap, noTermPrice, bogoOfferPresent, strikePrice, fidoFave, gwpOffersPresent, lowestMSFByCategory, monthlyInstallmentAmount, financingAmount, installments, financing, mandatoryPayment, deviceEligibleForExpShip, rvAmount, sortOrder
    }
}

enum FluffyDefaultPricePlanCategory: String, Codable {
    case edge40Tab = "EDGE40TAB"
}

// MARK: - TentacledLowestMSFByCategory
struct TentacledLowestMSFByCategory: Codable {
    let edge40Tab: Int
    
    enum CodingKeys: String, CodingKey {
        case edge40Tab = "EDGE40TAB"
    }
}

enum Memory: String, Codable {
    case the128GB = "128GB"
    case the512GB = "512GB"
    case the64GB = "64GB"
}

// MARK: - RogersBasicPhones
struct RogersBasicPhones: Codable {
    let modelMap: RogersBasicPhonesModelMap
    let manufacturerMap: RogersBasicPhonesManufacturerMap
    let categoryMap: CategoryMap
    let displayOrder: Int
}

// MARK: - RogersBasicPhonesManufacturerMap
struct RogersBasicPhonesManufacturerMap: Codable {
    let alcatel: Google
    
    enum CodingKeys: String, CodingKey {
        case alcatel = "Alcatel"
    }
}

// MARK: - RogersBasicPhonesModelMap
struct RogersBasicPhonesModelMap: Codable {
    let prod1000781: Prod1220368Class
}

// MARK: - RogersSmartPhones
struct RogersSmartPhones: Codable {
    let modelMap: RogersSmartPhonesModelMap
    let manufacturerMap: RogersSmartPhonesManufacturerMap
    let categoryMap: CategoryMap
    let displayOrder: Int
}

// MARK: - RogersSmartPhonesManufacturerMap
struct RogersSmartPhonesManufacturerMap: Codable {
    let google, apple, sonim, blackBerry: Google
    let samsung, lg, huawei, motorola: Google
    
    enum CodingKeys: String, CodingKey {
        case google = "Google"
        case apple = "Apple"
        case sonim = "Sonim"
        case blackBerry = "BlackBerry"
        case samsung = "Samsung"
        case lg = "LG"
        case huawei = "Huawei"
        case motorola = "Motorola"
    }
}

// MARK: - RogersSmartPhonesModelMap
struct RogersSmartPhonesModelMap: Codable {
    let prod1020320: Prod1220509Class
    let prod1020321: Prod1020
    let prod1020319: Prod1220509Class
    let prod1020758, prod1170400: Prod340317Class
    let prod1151103: PurpleProd1
    let prod1151104: Prod1220509Class
    let prod910362: Prod340317Class
    let prod1020677: Prod1020677Class
    let prod1151105: PurpleProd1
    let prod1200311, prod941139: Prod340317Class
    let prod1200631, prod1180561: PurpleProd1
    let prod1220388, prod1220387: Prod340317Class
    let prod1080536: Prod1220509Class
    let prod1220386: Prod340317Class
    let prod630328: Prod1220509Class
    let prod320715, prod950314, prod630326, prod1170398: Prod340317Class
    let prod1040312, prod1320425: Prod1020677Class
    let prod1170399: PurpleProd1
    let prod830583: Prod340317Class
    let prod1020621: Prod1020
    let prod1040316, prod1200640: PurpleProd1
    let prod1050333: Prod340317Class
}

// MARK: - Prod1020
struct Prod1020: Codable {
    let manufacturerMap: CategoryMap
    let manufacturer: String
    let displayName, size: CategoryMap
    let skusByMemory: [Prod1020321SkusByMemory]
    let id: String
    let boosterPoints: Int
    let deviceType: String
    let exclusiveOfferPresent: Bool
    let mediaMap: MediaMap
    let limitedOfferPresent, exclusivePricingAvailable, currentExclusiveOfferPresent: Bool
}

// MARK: - Prod1020321SkusByMemory
struct Prod1020321SkusByMemory: Codable {
    let wirelessSKUMap: [IndecentWirelessSKUMap]
}

// MARK: - IndecentWirelessSKUMap
struct IndecentWirelessSKUMap: Codable {
    let externalID, id: String
    let displayName, color, memoryMap, size: CategoryMap
    let memory: String
    let price: Int
    let exclusiveOfferPresent: Bool
    let exclusiveOfferDevicePrice, maxDeviceBALWaiverAmnt, connectionFee: Int
    let featuresList, promotionsList, marketingContent: FeaturesListClass
    let saleStatus: String
    let limitedOfferPresent: Bool
    let defaultLowestMSF: Int
    let deviceTerm: String
    let featureGroupMap: FeatureGroupMap
    let noTermPrice: Int
    let bogoOfferPresent: Bool
    let strikePrice: Int
    let fidoFave, gwpOffersPresent: Bool
    let monthlyInstallmentAmount, financingAmount, installments: Int
    let financing: Bool
    let mandatoryPayment: Int
    let deviceEligibleForExpShip: Bool
    let rvAmount, sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case externalID = "externalId"
        case id, displayName, color, memoryMap, size, memory, price, exclusiveOfferPresent, exclusiveOfferDevicePrice
        case maxDeviceBALWaiverAmnt = "maxDeviceBalWaiverAmnt"
        case connectionFee, featuresList, promotionsList, marketingContent, saleStatus, limitedOfferPresent, defaultLowestMSF, deviceTerm, featureGroupMap, noTermPrice, bogoOfferPresent, strikePrice, fidoFave, gwpOffersPresent, monthlyInstallmentAmount, financingAmount, installments, financing, mandatoryPayment, deviceEligibleForExpShip, rvAmount, sortOrder
    }
}

// MARK: - Prod1020677Class
struct Prod1020677Class: Codable {
    let manufacturerMap: CategoryMap
    let manufacturer: String
    let displayName, size: CategoryMap
    let skusByMemory: [Prod1020677SkusByMemory]
    let id: String
    let boosterPoints: Int
    let deviceType: String
    let exclusiveOfferPresent: Bool
    let mediaMap: MediaMap
    let limitedOfferPresent, exclusivePricingAvailable, currentExclusiveOfferPresent: Bool
}

// MARK: - Prod1020677SkusByMemory
struct Prod1020677SkusByMemory: Codable {
    let wirelessSKUMap: [HilariousWirelessSKUMap]
}

// MARK: - HilariousWirelessSKUMap
struct HilariousWirelessSKUMap: Codable {
    let externalID, id: String
    let displayName, color, memoryMap, size: CategoryMap
    let memory: String
    let price: Int
    let exclusiveOfferPresent: Bool
    let exclusiveOfferDevicePrice, maxDeviceBALWaiverAmnt, connectionFee: Int
    let featuresList: FeaturesList
    let promotionsList: PromotionsList
    let marketingContent: CategoryMap
    let limitedOfferPresent: Bool
    let defaultPricePlanCategory: String
    let defaultLowestMSF: Int
    let deviceTerm: String
    let featureGroupMap: FeatureGroupMap
    let noTermPrice: Int
    let bogoOfferPresent: Bool
    let strikePrice: Int
    let fidoFave, gwpOffersPresent: Bool
    let lowestMSFByCategory: StickyLowestMSFByCategory
    let monthlyInstallmentAmount: Double
    let financingAmount, installments: Int
    let financing: Bool
    let mandatoryPayment: Int
    let deviceEligibleForExpShip: Bool
    let rvAmount, sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case externalID = "externalId"
        case id, displayName, color, memoryMap, size, memory, price, exclusiveOfferPresent, exclusiveOfferDevicePrice
        case maxDeviceBALWaiverAmnt = "maxDeviceBalWaiverAmnt"
        case connectionFee, featuresList, promotionsList, marketingContent, limitedOfferPresent, defaultPricePlanCategory, defaultLowestMSF, deviceTerm, featureGroupMap, noTermPrice, bogoOfferPresent, strikePrice, fidoFave, gwpOffersPresent, lowestMSFByCategory, monthlyInstallmentAmount, financingAmount, installments, financing, mandatoryPayment, deviceEligibleForExpShip, rvAmount, sortOrder
    }
}

// MARK: - StickyLowestMSFByCategory
struct StickyLowestMSFByCategory: Codable {
    let edgefin2Tab: Int
    
    enum CodingKeys: String, CodingKey {
        case edgefin2Tab = "EDGEFIN2TAB"
    }
}

// MARK: - PurpleProd1
struct PurpleProd1: Codable {
    let manufacturerMap: CategoryMap
    let manufacturer: String
    let displayName, size: CategoryMap
    let skusByMemory: [Prod1040316SkusByMemory]
    let id: String
    let boosterPoints: Int
    let deviceType: String
    let exclusiveOfferPresent: Bool
    let mediaMap: MediaMap
    let limitedOfferPresent, exclusivePricingAvailable, currentExclusiveOfferPresent: Bool
}

// MARK: - Prod1040316SkusByMemory
struct Prod1040316SkusByMemory: Codable {
    let wirelessSKUMap: [AmbitiousWirelessSKUMap]
}

// MARK: - AmbitiousWirelessSKUMap
struct AmbitiousWirelessSKUMap: Codable {
    let externalID, id: String
    let displayName, color, memoryMap, size: CategoryMap
    let memory: Memory
    let price: Int
    let exclusiveOfferPresent: Bool
    let exclusiveOfferDevicePrice, maxDeviceBALWaiverAmnt, connectionFee: Int
    let featuresList: FeaturesList
    let promotionsList: PromotionsList
    let marketingContent: CategoryMap
    let limitedOfferPresent: Bool
    let defaultPricePlanCategory: TentacledDefaultPricePlanCategory
    let defaultLowestMSF: Int
    let deviceTerm: String
    let featureGroupMap: FeatureGroupMap
    let noTermPrice: Int
    let bogoOfferPresent: Bool
    let strikePrice: Int
    let fidoFave, gwpOffersPresent: Bool
    let lowestMSFByCategory: IndigoLowestMSFByCategory
    let monthlyInstallmentAmount, financingAmount, installments: Int
    let financing: Bool
    let mandatoryPayment: Int
    let deviceEligibleForExpShip: Bool
    let rvAmount, sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case externalID = "externalId"
        case id, displayName, color, memoryMap, size, memory, price, exclusiveOfferPresent, exclusiveOfferDevicePrice
        case maxDeviceBALWaiverAmnt = "maxDeviceBalWaiverAmnt"
        case connectionFee, featuresList, promotionsList, marketingContent, limitedOfferPresent, defaultPricePlanCategory, defaultLowestMSF, deviceTerm, featureGroupMap, noTermPrice, bogoOfferPresent, strikePrice, fidoFave, gwpOffersPresent, lowestMSFByCategory, monthlyInstallmentAmount, financingAmount, installments, financing, mandatoryPayment, deviceEligibleForExpShip, rvAmount, sortOrder
    }
}

enum TentacledDefaultPricePlanCategory: String, Codable {
    case edge30Tab = "EDGE30TAB"
}

// MARK: - IndigoLowestMSFByCategory
struct IndigoLowestMSFByCategory: Codable {
    let edge30Tab: Int
    
    enum CodingKeys: String, CodingKey {
        case edge30Tab = "EDGE30TAB"
    }
}
