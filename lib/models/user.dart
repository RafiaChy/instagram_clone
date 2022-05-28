class User {
 final String username;
 final String uid;
 final String bio;
 final String email;
 final List followers;
 final List following;
 final String profilePhotoUrl;
  User({
    required this.username,
    required this.uid,
    required this.bio,
    required this.email,
    required this.followers,
    required this.following,
    required this.profilePhotoUrl,
  });


  Map<String, dynamic> toJson() => {
          'username': username,
          'uid': uid,
          'bio': bio,
          'email': email,
          'followers': [],
          'following': [],
          'profilePhotoUrl': profilePhotoUrl,
  };
}

