import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_kazi/Community/ChatPage.dart';
import 'package:mr_kazi/Community/NotificationsPage.dart';

class CommunityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CommunityPage(),
    );
  }
}

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final Color primaryColor = Color(0xFF26547D);
  final Color secondaryColor = Color(0xFFEF436B);
  final Color accentColor = Color(0xFFFFCE5C);
  final Color backgroundColor = Color(0xFFFFF5EB);
  final Color successColor = Color(0xFF05C793);
  final TextEditingController _postController = TextEditingController();
  XFile? _image;

  final List<Map<String, String>> stories = [
    {"username": "Your Story", "imageUrl": "assets/Community/hridoy.jpg"},
    {"username": "Jawadun Noor", "imageUrl": "assets/Community/jawad.jpg"},
    {"username": "Rahimul", "imageUrl": "assets/Community/rahim.jpg"},
    {"username": "Tajree", "imageUrl": "assets/Community/6.jpg"},
    {"username": "Shaj", "imageUrl": "assets/Community/5.jpg"},
    {"username": "Borson", "imageUrl": "assets/Community/4.jpg"},
    {"username": "Hridoy", "imageUrl": "assets/Community/1.jpg"},
    {"username": "Prithi", "imageUrl": "assets/Community/2.jpg"},
  ];

  final List<Map<String, dynamic>> posts = [
    {
      "username": "Jawadun Noor",
      "content": "One of the most popular thoughts about rainy days...",
      "imageUrl": "assets/Community/4.jpg",
      "likes": 453,
      "comments": 251,
      "liked": false,
      "commentList": [],
    },
    {
      "username": "Rahimul Hasan",
      "content": "This is a beautiful day to share some thoughts!",
      "imageUrl": "assets/Community/1.jpg",
      "likes": 120,
      "comments": 34,
      "liked": false,
      "commentList": [],
    },
    {
      "username": "Minhajul Islam Borson",
      "content": "Look at this breathtaking mountain view!",
      "imageUrl": "assets/Community/3.jpg",
      "likes": 230,
      "comments": 87,
      "liked": false,
      "commentList": [],
    },
    {
      "username": "Fowzia Fariha Shaj",
      "content": "Look at this breathtaking mountain view!",
      "imageUrl": "assets/Community/5.jpg",
      "likes": 230,
      "comments": 87,
      "liked": false,
      "commentList": [],
    },
    {
      "username": "Jannatul Ferdows Tajree",
      "content": "Look at this breathtaking mountain view!",
      "imageUrl": "assets/Community/2.jpg",
      "likes": 230,
      "comments": 87,
      "liked": false,
      "commentList": [],
    },
    {
      "username": "Sadman Shawon",
      "content": "Look at this breathtaking mountain view!",
      "imageUrl": "assets/Community/6.jpg",
      "likes": 230,
      "comments": 87,
      "liked": false,
      "commentList": [],
    },
  ];

  void toggleLike(int index) {
    setState(() {
      posts[index]['liked'] = !posts[index]['liked'];
      posts[index]['liked']
          ? posts[index]['likes']++
          : posts[index]['likes']--;
    });
  }

  void addComment(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController commentController = TextEditingController();
        return AlertDialog(
          title: Text("Add a Comment"),
          content: TextField(
            controller: commentController,
            decoration: InputDecoration(hintText: "Write your comment here..."),
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("Submit"),
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  setState(() {
                    posts[index]['commentList'].add(commentController.text);
                    posts[index]['comments']++;
                  });
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void postContent() {
    if (_postController.text.isNotEmpty) {
      setState(() {
        posts.insert(0, {
          "username": "Kawsar Ahmmed Hridoy",
          "content": _postController.text,
          "imageUrl": _image?.path ?? "assets/Community/hridoy.jpg", // Add a default or user-provided image URL
          "likes": 0,
          "comments": 0,
          "liked": false,
          "commentList": [],
        });
        _postController.clear(); // Clear the text field after posting
        _image = null;
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage; // Set the selected image
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          "Community",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage()),);},
          ),
          IconButton(
            icon: Icon(Icons.message, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(
                    // username: "Bella Huffman", // Replace with dynamic username
                    // profileImage: "assets/Community/hridoy.jpg", // Replace with dynamic image
                  ),
                ),
              );
            },
          ),

        ],
      ),
      body: Column(
        children: [
          // What's on your mind section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage("assets/Community/hridoy.jpg"),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: _postController,
                    decoration: InputDecoration(
                      hintText: "What's on your mind?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  icon: Icon(Icons.photo, size: 30, color: Colors.brown.withOpacity(0.8)),
                  onPressed: _pickImage, // Pick image when clicked
                ),
                SizedBox(width: 5),
                IconButton(
                  icon: Icon(Icons.send, size: 30, color: Colors.blue),
                  onPressed: postContent,
                ),
              ],
            ),
          ),
          Divider(),
          // Story Section
          Container(
            color: successColor.withOpacity(0.1),
            height: 90,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: story['imageUrl'] != null
                                ? NetworkImage(story['imageUrl']!)
                                : null,
                            backgroundColor: Colors.grey[200],
                          ),
                          if (index == 0)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add, size: 12, color: Colors.white),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        story['username']!,
                        style: TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          // Post Feed
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage("assets/Community/hrid.jpg"),
                          ),
                          title: Text(
                            post['username'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.more_horiz),
                        ),
                        if (post['imageUrl'] != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                post['imageUrl'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 250,
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(post['content']),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () => toggleLike(index),
                              child: Row(
                                children: [
                                  Icon(
                                    post['liked'] ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                                    color: post['liked'] ? Colors.blue : Colors.blueGrey,
                                  ),
                                  SizedBox(width: 5),
                                  Text("${post['likes']} Likes"),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () => addComment(index),
                              child: Row(
                                children: [
                                  Icon(Icons.comment_outlined, color: successColor.withOpacity(0.7)),
                                  SizedBox(width: 5),
                                  Text("${post['comments']} Comments"),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.share_outlined, color: Colors.blue.withOpacity(0.7)),
                                SizedBox(width: 5),
                                Text("Share"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


void main() {
  runApp(CommunityApp());
}
