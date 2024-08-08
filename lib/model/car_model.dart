class CarModel {
  final String image;
  final String title;
  final String description;
  final int price;

  CarModel({
    this.title = '',
    this.price = 0,
    this.image = '',
    this.description = '',
  });
  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      title: map['title'] ?? '',
      price: map['start_production'] ?? 0,
      image: map['image'] ?? '',
      description: map['class'] ?? "",
    );
  }
}

class CarList {
  List<Map<String, dynamic>> car = [
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/2015_Mazda_MX-5_ND_2.0_SKYACTIV-G_160_i-ELOOP_Rubinrot-Metallic_Vorderansicht.jpg/400px-2015_Mazda_MX-5_ND_2.0_SKYACTIV-G_160_i-ELOOP_Rubinrot-Metallic_Vorderansicht.jpg",
      "title": "Mazda MX-5",
      "start_production": 1989,
      "class": "Sports car Roadster"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/VW_Kuebelwagen_1.jpg/400px-VW_Kuebelwagen_1.jpg",
      "title": "Volkswagen Kübelwagen",
      "class": "Military vehicle"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/2014_Porsche_Cayenne_%2892A_MY14%29_GTS_wagon_%282015-08-07%29_01.jpg/400px-2014_Porsche_Cayenne_%2892A_MY14%29_GTS_wagon_%282015-08-07%29_01.jpg",
      "title": "Porsche Cayenne",
      "start_production": 2002,
      "class": "Mid-size luxury crossover SUV"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Vintage_car_at_the_Wirral_Bus_%26_Tram_Show_-_DSC03336.JPG/400px-Vintage_car_at_the_Wirral_Bus_%26_Tram_Show_-_DSC03336.JPG",
      "title": "Vauxhall Chevette",
      "start_production": 1975,
      "class": "Supermini"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Dynamixion_car_by_Buckminster_Fuller_1933_%28side_views%29.jpg/400px-Dynamixion_car_by_Buckminster_Fuller_1933_%28side_views%29.jpg",
      "title": "Dymaxion car",
      "start_production": 1933,
      "class": "Concept car"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Ford_Crown_Victoria_LX.jpg/400px-Ford_Crown_Victoria_LX.jpg",
      "title": "Ford Crown Victoria",
      "start_production": 1955,
      "class": "Full-size Ford"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Plymouth_Superbird.jpg/400px-Plymouth_Superbird.jpg",
      "title": "Plymouth Superbird",
      "start_production": 1970,
      "class": "Muscle car(today) and Race car(Past)"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/2nd-Saab-9000-hatch.jpg/400px-2nd-Saab-9000-hatch.jpg",
      "title": "Saab 9000",
      "start_production": 1984,
      "class": "Executive car"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/2003-2005_Pontiac_Sunfire.jpg/400px-2003-2005_Pontiac_Sunfire.jpg",
      "title": "Pontiac Sunfire",
      "start_production": 1994,
      "class": "Compact"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/1971_AMC_Javelin_SST_red_Kenosha_street.JPG/400px-1971_AMC_Javelin_SST_red_Kenosha_street.JPG",
      "title": "AMC Javelin",
      "start_production": 1967,
      "class": "{{Unbulleted list| Pony car | Muscle car },},"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Jaguar_X-Type_Estate_front_20080731.jpg/400px-Jaguar_X-Type_Estate_front_20080731.jpg",
      "title": "Jaguar X-Type",
      "start_production": 2001,
      "class": "Compact executive car"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/VW_Phaton_%282._Facelift%29_%E2%80%93_Frontansicht%2C_7._Mai_2011%2C_D%C3%BCsseldorf.jpg/400px-VW_Phaton_%282._Facelift%29_%E2%80%93_Frontansicht%2C_7._Mai_2011%2C_D%C3%BCsseldorf.jpg",
      "title": "Volkswagen Phaeton",
      "start_production": 2002,
      "class": "Full-size luxury car"
    },
  ];
}
