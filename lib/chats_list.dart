class Chat {
  String message;
  bool isSenderU;

  Chat({this.message = '', this.isSenderU = false});

  factory Chat.fromMap(Map<String, dynamic> json) => Chat(
        message: json['message'],
        isSenderU: json['isSender'],
      );
}

List chats = [
  {
    "message": "Hello! Welcome to Speedy Rentals! How can I assist you today?",
    "isSender": false // This is a message from the car rental service
  },
  {
    "message": "Hi, ?",
    "isSender": true // This is a message from the customer
  },
  {
    "message":
        "We have a wide variety of vehicles available! Would you prefer something compact, fuel-efficient, or spacious?",
    "isSender": false
  },
  {
    "message":
        "I'm looking for something fuel-efficient, as I'll be driving mostly on highways.",
    "isSender": true
  },
  {
    "message":
        "Great choice! We recommend our Toyota Prius or the Hyundai Ioniq. Both offer excellent gas mileage. Would you like to see their details?",
    "isSender": false
  },
];
