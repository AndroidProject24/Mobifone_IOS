//
//  ModelUser.swift
//  uHotel
//
//  Created by HungLe-iMac on 9/13/16.
//  Copyright © 2016 uHotel. All rights reserved.
//

import ObjectMapper

 class settingUser: Mappable {
	var watchTvState: Bool?
	var fnaState: Bool?
	var moviesState: Bool?
	var roomControlState: Bool?
	var conciergeState: Bool?

	required  init?(map: Map) {

	}

	 func mapping(map: Map) {
		watchTvState <- map["watchTvState"]
		fnaState <- map["fnaState"]
		moviesState <- map["moviesState"]
		roomControlState <- map["roomControlState"]
		conciergeState <- map["conciergeState"]
	}
}

 class birthDate: Mappable {
	var orig_year: String?
	var orig_month: String?
	var orig_day: String?
	var orig_hour: String?
	var orig_minute: String?
	var orig_second: String?
	var orig_timezone: String?
	var year: String?
	var month: String?
	var day: String?
	var timezone: String?
	var hour: String?
	var minute: String?
	var second: String?
	required  init?(map: Map) {

	}

	 func mapping(map: Map) {
		orig_year <- map["orig_year"]
		orig_month <- map["orig_month"]
		orig_day <- map["orig_day"]
		orig_hour <- map["orig_hour"]
		orig_minute <- map["orig_minute"]
		orig_second <- map["orig_second"]
		orig_timezone <- map["orig_timezone"]
		year <- map["year"]
		month <- map["month"]
		day <- map["day"]
		timezone <- map["timezone"]
		hour <- map["hour"]
		minute <- map["minute"]
		second <- map["second"]
	}
}

 class resultUser: Mappable {
	var subscriberUid: String?
	var profileUid: String?
	var name: String?
	var gender: String?
	var languageId: NSInteger?
	var birth: birthDate?
	var parentalRating: NSInteger?
	var autoSubtitlesEnabled: Bool?
	var autoAudioEnabled: Bool?
	var tvRecommendationsEnabled: Bool?
	var vodRecommendationsEnabled: Bool?
	var sipPhoneNotificationsEnabled: Bool?
	var setting: String?
	var userId: NSInteger?
	var regionId: NSInteger?

	required  init?(map: Map) {

	}

	 func mapping(map: Map) {
		subscriberUid <- map["subscriberUid"]
		profileUid <- map["profileUid"]
		name <- map["name"]
		gender <- map["gender"]
		languageId <- map["languageId"]
		birth <- map["birthDate"]
		parentalRating <- map["parentalRating"]
		autoSubtitlesEnabled <- map["autoSubtitlesEnabled"]
		autoAudioEnabled <- map["autoAudioEnabled"]
		tvRecommendationsEnabled <- map["tvRecommendationsEnabled"]
		vodRecommendationsEnabled <- map["vodRecommendationsEnabled"]
		sipPhoneNotificationsEnabled <- map["sipPhoneNotificationsEnabled"]
		setting <- map["setting"]
		userId <- map["userId"]
		regionId <- map["regionId"]
	}
}

 class ModelUser: Mappable {
	var result: resultUser?
	var type: String?
	var code: NSInteger?
	required  init?(map: Map) {

	}

	 func mapping(map: Map) {
		result <- map["result"]
		type <- map["type"]
		code <- map["code"]
	}
}

 class ModelPIN: Mappable {
	var result: Bool?
	var type: String?
	var code: NSInteger?
	required  init?(map: Map) {

	}

	 func mapping(map: Map) {
		result <- map["result"]
		type <- map["type"]
		code <- map["code"]
	}
}
