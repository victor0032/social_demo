import '../../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getUserProfile(String userId);
  Future<List<UserModel>> getAllUsers();
}

// Simulated local data
List<UserModel> allUsers = [
  UserModel(
    id: '1',
    name: 'Victor Gomez',
    email: 'victor0032@outlook.es',
    profilePicture: 'https://randomuser.me/api/portraits/men/26.jpg',
  ),
  UserModel(
    id: '2',
    name: 'Jane Doe',
    email: 'janedoe@example.com',
    profilePicture: 'https://randomuser.me/api/portraits/women/49.jpg',
  ),
  UserModel(
    id: '3',
    name: 'John Doe',
    email: 'johndoe@example.com',
    profilePicture: 'https://randomuser.me/api/portraits/men/68.jpg',
  ),
  UserModel(
    id: '4',
    name: 'Morgan Hunt',
    email: 'johndoe@example.com',
    profilePicture: 'https://randomuser.me/api/portraits/men/79.jpg',
  ),
  UserModel(
    id: '5',
    name: 'John Doe',
    email: 'johndoe@example.com',
    profilePicture: 'https://randomuser.me/api/portraits/men/2.jpg',
  ),
  UserModel(
  id: '6',
  name: 'John Smith',
  email: 'johnsmith@example.com',
  profilePicture: 'https://randomuser.me/api/portraits/men/45.jpg',
),
UserModel(
  id: '7',
  name: 'Emily Johnson',
  email: 'emilyjohnson@example.com',
  profilePicture: 'https://randomuser.me/api/portraits/women/33.jpg',
),
UserModel(
  id: '8',
  name: 'Michael Brown',
  email: 'michaelbrown@example.com',
  profilePicture: 'https://randomuser.me/api/portraits/men/32.jpg',
),
UserModel(
  id: '9',
  name: 'Sarah Davis',
  email: 'sarahdavis@example.com',
  profilePicture: 'https://randomuser.me/api/portraits/women/65.jpg',
),
UserModel(
  id: '10',
  name: 'David Wilson',
  email: 'davidwilson@example.com',
  profilePicture: 'https://randomuser.me/api/portraits/men/21.jpg',
),
UserModel(
  id: '11',
  name: 'Laura Martinez',
  email: 'lauramartinez@example.com',
  profilePicture: 'https://randomuser.me/api/portraits/women/41.jpg',
),
UserModel(
  id: '12',
  name: 'James Anderson',
  email: 'jamesanderson@example.com',
  profilePicture: 'https://randomuser.me/api/portraits/men/55.jpg',
),
UserModel(
  id: '13',
  name: 'Patricia Thomas',
  email: 'patriciathomas@example.com',
  profilePicture: 'https://randomuser.me/api/portraits/women/52.jpg',
),
];

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<UserModel> getUserProfile(String userId) async {
    for (var element in allUsers) {
      if (element.id == userId) {
        return element;
      }
    }
    return UserModel(
      id: '1',
      name: 'Victor Gomez',
      email: 'victor0032@outlook.es',
      profilePicture: 'https://randomuser.me/api/portraits/men/26.jpg',
    );
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    return allUsers;
  }
}
