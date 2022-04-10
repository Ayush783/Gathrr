import 'package:equatable/equatable.dart';

enum EventType {
  past,
  live,
  upcoming,
}

class Event extends Equatable {
  const Event(
    this.eventId,
    this.eventName,
    this.eventCategory_id,
    this.eventOrganizer_id,
    this.eventDescription,
    this.eventStartdate,
    this.eventEnddate,
    this.eventStarttime,
    this.eventEndtime,
    this.eventBanneroneimg,
    this.eventType,
    this.eventAmount,
    this.eventCode,
    this.eventBannertwoimg,
    this.eventQrcode,
    this.eventLocation,
    this.eventLat,
    this.eventLong,
    this.eventTwitter,
    this.eventFacebook,
    this.eventLinkedin,
    this.eventInstragram,
    this.eventYoutube,
    this.eventSkype,
    this.eventWechat,
    this.eventStatus,
    this.eventCreated_at,
    this.categoryId,
    this.categoryOrganizer_id,
    this.categoryFor,
    this.categoryName,
    this.categoryImage,
    this.categoryStatus,
    this.categoryCreated_at,
    this.Rating,
    this.isCheckin,
    this.isAgenda,
    this.isSpeaker,
    this.isBooking,
    this.isRates,
    this.event_banner_img1,
    this.event_banner_img2,
  );

  Event.fromJson({Map<String, dynamic>? json})
      : eventId = json!['eventId'],
        eventName = json['eventName'],
        eventCategory_id = json['eventCategory_id'],
        eventOrganizer_id = json['eventOrganizer_id'] ?? -1,
        eventDescription = json['eventDescription'],
        eventStartdate = json['eventStartdate'],
        eventEnddate = json['eventEnddate'],
        eventStarttime = json['eventStarttime'],
        eventEndtime = json['eventEndtime'],
        eventBanneroneimg = json['eventBanneroneimg'],
        eventType = json['eventType'],
        eventAmount = json['eventAmount'] ?? '',
        eventCode = json['eventCode'],
        eventBannertwoimg = json['eventBannertwoimg'],
        eventQrcode = json['eventQrcode'],
        eventLocation = json['eventLocation'],
        eventLat = json['eventLat'],
        eventLong = json['eventLong'],
        eventTwitter = json['eventTwitter'] ?? '',
        eventFacebook = json['eventFacebook'] ?? '',
        eventLinkedin = json['eventLinkedin'] ?? '',
        eventInstragram = json['eventInstragram'] ?? '',
        eventYoutube = json['eventYoutube'] ?? '',
        eventSkype = json['eventSkype'] ?? '',
        eventWechat = json['eventWechat'] ?? '',
        eventStatus = json['eventStatus'],
        eventCreated_at = json['eventCreated_at'],
        categoryId = json['categoryId'],
        categoryOrganizer_id = json['categoryOrganizer_id'],
        categoryFor = json['categoryFor'],
        categoryName = json['categoryName'],
        categoryImage = json['categoryImage'],
        categoryStatus = json['categoryStatus'],
        categoryCreated_at = json['categoryCreated_at'],
        Rating = json['Rating'],
        isCheckin = json['isCheckin'],
        isAgenda = json['isAgenda'],
        isSpeaker = json['isSpeaker'],
        isBooking = json['isBooking'],
        isRates = json['isRates'],
        event_banner_img1 = json['event_banner_img1'],
        event_banner_img2 = json['event_banner_img2'];

  final int? eventId;
  final String? eventName;
  final int? eventCategory_id;
  final int? eventOrganizer_id;
  final String? eventDescription;
  final String? eventStartdate;
  final String? eventEnddate;
  final String? eventStarttime;
  final String? eventEndtime;
  final String? eventBanneroneimg;
  final String? eventType;
  final String? eventAmount;
  final String? eventCode;
  final String? eventBannertwoimg;
  final String? eventQrcode;
  final String? eventLocation;
  final String? eventLat;
  final String? eventLong;
  final String? eventTwitter;
  final String? eventFacebook;
  final String? eventLinkedin;
  final String? eventInstragram;
  final String? eventYoutube;
  final String? eventSkype;
  final String? eventWechat;
  final int? eventStatus;
  final String? eventCreated_at;
  final int? categoryId;
  final int? categoryOrganizer_id;
  final int? categoryFor;
  final String? categoryName;
  final String? categoryImage;
  final int? categoryStatus;
  final String? categoryCreated_at;
  final int? Rating;
  final String? isCheckin;
  final String? isAgenda;
  final String? isSpeaker;
  final String? isBooking;
  final String? isRates;
  final String? event_banner_img1;
  final String? event_banner_img2;

  EventType getEventType() {
    final eventStartDateTime =
        DateTime.parse(eventStartdate! + " " + eventStarttime!);
    final eventEndDateTime =
        DateTime.parse(eventStartdate! + " " + eventStarttime!);
    if (eventStartDateTime.compareTo(DateTime.now()) < 0) {
      return EventType.upcoming;
    } else if (eventEndDateTime.compareTo(DateTime.now()) > 0) {
      return EventType.past;
    } else {
      return EventType.live;
    }
  }

  @override
  List<Object?> get props => [
        eventId,
        eventName,
        eventCategory_id,
        eventDescription,
        eventStartdate,
        eventEnddate,
        eventStarttime,
        eventEndtime,
        eventBanneroneimg,
        eventType,
        eventCode,
        eventBannertwoimg,
        eventQrcode,
        eventLocation,
        eventLat,
        eventLong,
        eventStatus,
        eventCreated_at,
        categoryId,
        categoryOrganizer_id,
        categoryFor,
        categoryName,
        categoryImage,
        categoryStatus,
        categoryCreated_at,
        Rating,
        isCheckin,
        isAgenda,
        isSpeaker,
        isBooking,
        isRates,
        event_banner_img1,
        event_banner_img2,
      ];
}
