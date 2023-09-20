import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photo Gallery'),
        ),
        body: PhotoGallery(),
      ),
    );
  }
}

class PhotoGallery extends StatelessWidget {
  // List of image URLs
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/1170986/pexels-photo-1170986.jpeg',
    'https://images.pexels.com/photos/1643457/pexels-photo-1643457.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/2499282/pexels-photo-2499282.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/13722001/pexels-photo-13722001.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/57416/cat-sweet-kitty-animals-57416.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1359307/pexels-photo-1359307.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            'Welcome to the Photo Gallery!',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your text here',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: imageUrls.length, // Number of images
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Image ${index + 1} Clicked'),
                    ),
                  );
                },
                child: Card(
                  elevation: 3.0,
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        imageUrls[index], // Use dynamic image URL
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Image ${index + 1}'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16.0),
          // List of sample photos with titles and subtitles
          ListView.builder(
            itemCount: 3, // Number of sample photos
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 25.0, // Adjust the size as needed
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg?auto=compress&cs=tinysrgb&w=600'),
                ),
                title: Text('Photo ${index + 1}'),
                subtitle: Text('Dimensions for photo ${index + 1}'),
              );
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Photos Uploaded Successfully!'),
                ),
              );
            },
            child: Icon(Icons.upload_rounded),
          ),
        ],
      ),
    );
  }
}
