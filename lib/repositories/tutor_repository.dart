import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:models/models.dart';

class TutorRepository {
  /* final DbClient dbClient;

  const TutorRepository({required this.dbClient});

  Future<List<Tutor>> fetchTutors() async {
    try {
      final tutorsData = await dbClient.fetchAll(collection: 'sampleTutors');
      return tutorsData
          .map<Tutor>(
            (tutorsData) => Tutor.fromJson(tutorsData.data, id: tutorsData.id),
          )
          .toList();
    } catch (err) {
      throw Exception('Failed to fetch the categories:$err');
    }
  }

  Future<void> createTutor() async {
    try {
      for (var tutor in sampleTutors) {
        await dbClient.add(collection: 'sampleTutors', data: tutor);
      }
    } catch (err) {
      throw Exception('Failed to create the categories:$err');
    }
  }
}*/
  final CollectionReference tutorsCollection =
      FirebaseFirestore.instance.collection('tutors');

  Future<List<Tutor>> fetchTutors() async {
    try {
      final QuerySnapshot tutorsSnapshot =
          await FirebaseFirestore.instance.collection('sampleTutors').get();
      return tutorsSnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Tutor.fromJson(data, id: doc.id);
      }).toList();
    } catch (error) {
      throw Exception('Failed to fetch tutors: $error');
    }
  }

  Future<void> createTutor(Tutor tutor) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user logged in');
      }

      final CollectionReference tutorsCollection =
          FirebaseFirestore.instance.collection('sampleTutors');

      final QuerySnapshot result = await tutorsCollection
          .where('userId', isEqualTo: currentUser.uid)
          .limit(1)
          .get();
      final List<DocumentSnapshot> documents = result.docs;

      if (documents.isNotEmpty) {
        // Update the existing document
        DocumentReference docRef = documents.first.reference;
        await docRef.update(tutor.toJson());
      } else {
        // Create a new document with the user's ID
        DocumentReference docRef = await tutorsCollection.add({
          ...tutor.toJson(),
          'userId':
              currentUser.uid, // Associate the tutor document with the user
        });

        // Optionally, update the document with its own ID
        await docRef.update({'id': docRef.id});
      }
    } catch (error) {
      throw Exception('Failed to create or update tutor: $error');
    }
  }

  Future<void> updateSubject(List<String> subjects) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user logged in');
      }

      final String uid = currentUser.uid;
      // Prepare the data to update
      final Map<String, dynamic> data = {"subjects": subjects};
      // Reference to the Firestore instance and collection
      final CollectionReference tutorsCollection =
          FirebaseFirestore.instance.collection('sampleTutors');

      // Find the document that belongs to the current user
      final QuerySnapshot result =
          await tutorsCollection.where('userId', isEqualTo: uid).limit(1).get();
      final List<DocumentSnapshot> documents = result.docs;

      if (documents.isNotEmpty) {
        // Get the document reference
        DocumentReference docRef = documents.first.reference;
        // Update the document with the new subjects
        await docRef.set(data, SetOptions(merge: true)); // Merge the new data
      } else {
        throw Exception('Tutor document not found for the logged-in user');
      }
    } catch (error) {
      throw Exception('Failed to update subjects: $error');
    }
  }

  Future<bool> isUserTutor() async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user logged in');
      }

      final String uid = currentUser.uid;

      // Reference to the Firestore instance and collection
      final DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      // Check if the user exists and has a role field
      if (userSnapshot.exists && userSnapshot.data() != null) {
        final Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        final String? userRole = userData['role'] as String?;
        // Check if the user's role is 'Tutor'
        if (userRole != null && userRole.toLowerCase() == 'tutor') {
          return true;
        }
      }

      // If the user is not a tutor or the role field is missing, return false
      return false;
    } catch (error) {
      throw Exception('Failed to check user role: $error');
    }
  }

  Future<void> updateWorkingHours(List<DateTime> workingHours) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user logged in');
      }

      final String uid = currentUser.uid;
      // Convert List<DateTime> to List<String> of formatted time strings
      final List<String> formattedHours = workingHours
          .map((dateTime) =>
              '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}')
          .toList();
      // Prepare the data to update
      final Map<String, dynamic> data = {"workingHours": formattedHours};
      // Reference to the Firestore instance and collection
      final CollectionReference tutorsCollection =
          FirebaseFirestore.instance.collection('sampleTutors');

      // Find the document that belongs to the current user
      final QuerySnapshot result =
          await tutorsCollection.where('userId', isEqualTo: uid).limit(1).get();
      final List<DocumentSnapshot> documents = result.docs;

      if (documents.isNotEmpty) {
        // Get the document reference
        DocumentReference docRef = documents.first.reference;
        // Update the document with the new working hours
        await docRef.set(data, SetOptions(merge: true)); // Merge the new data
      } else {
        throw Exception('Tutor document not found for the logged-in user');
      }
    } catch (error) {
      throw Exception('Failed to update working hours: $error');
    }
  }
}

/*
const sampleTutors = [
  {
    "id": "1",
    "name": "Amer Alloushhhh",
    "bio":
        "Born into a family of educators, I discovered my love for mathematics at a young age. With a desire to inspire and innovate, I embarked on a mission to teach math in a way that sparks curiosity and fosters understanding. Through creativity and dedication, I strive to empower my students to embrace math as both a tool for problem-solving and a source of endless fascination.",
    "profileImageUrl":
        "https://portwiki.net/wp-content/uploads/2016/12/Math-Teacher.jpg",
    "category": "Math",
    "subjects": ["Algebra", "Geometry", "Calculus"],
    "rating": 4.5,
    "reviewCount": 100,
    "studentCount": 1000
  },
  {
    "id": "2",
    "name": "Amer Alloush",
    "bio": "Geographic teacher",
    "profileImageUrl":
        "https://images.unsplash.com/photo-1557683316-973673baf926",
    "category": "Geography",
    "subjects": ["World Geography", "Human Geography"],
    "rating": 4.5,
    "reviewCount": 100,
    "studentCount": 1000
  },
  {
    "id": "3",
    "name": "Amer Alloush",
    "bio": "Geographic teacher",
    "profileImageUrl":
        "https://images.unsplash.com/photo-1557683316-973673baf926",
    "category": "Geography",
    "subjects": ["World Geography", "Human Geography"],
    "rating": 4.5,
    "reviewCount": 100,
    "studentCount": 1000
  },
  {
    "id": "4",
    "name": "Amer Alloush",
    "bio": "Geographic teacher",
    "profileImageUrl":
        "https://images.unsplash.com/photo-1557683316-973673baf926",
    "category": "Geography",
    "subjects": ["World Geography", "Human Geography"],
    "rating": 4.5,
    "reviewCount": 100,
    "studentCount": 1000
  }
];
*/
