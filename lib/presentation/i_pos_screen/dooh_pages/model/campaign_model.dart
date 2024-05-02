class CampaignModel {
  final String timePeriod;
 // final String date;
  final String time;
  final String numberOfPlays;

  CampaignModel({
    required this.timePeriod,
  //  required this.date,
    required this.time,
    required this.numberOfPlays,
  });

  // Convert CampaignModel to a map
  Map<String, dynamic> toMap() {
    return {
      'timePeriod': timePeriod,
  //    'date': date,
      'time': time,
      'numberOfPlays': numberOfPlays,
    };
  }

  // Create a CampaignModel from a map
  factory CampaignModel.fromMap(Map<String, dynamic> map) {
    return CampaignModel(
      timePeriod: map['timePeriod'],
      //date: map['date'],
      time: map['time'],
      numberOfPlays: map['numberOfPlays'],
    );
  }
}
