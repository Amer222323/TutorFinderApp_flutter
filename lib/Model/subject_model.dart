import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Subjects {
  final _logedUser = FirebaseAuth.instance.currentUser;
  final _fireStore = FirebaseFirestore.instance;

  /*
  * Create a Subject to the _fireStore
  * @POST Function required A
  * Subjects{
  * 'tutor': Email!,
  * 'SubjectsName':,
  * 'hourlyWage':,
  * 'description':,
  * 'imgPath':,
  * } form for the Table Subjects
  * */

  Future<void> createSubject(String SubjectsName, String hourlyWage,
      String description, String imgPath) {
    return _fireStore.collection("Subjects").add(
      {
        'Tutor': _logedUser!.email
            .toString(), //to reduce the problems trun to a String
        'subjectsName': SubjectsName,
        'hourlyWage': hourlyWage,
        'description': description,
        'imgPath': imgPath,
      },
    );
  }

  // /*
  // * get all Subjects from _fireStore
  // * @return(Future<Stream<QuerySnapshot<Map<String, dynamic>>>>) a snapshots Stream/Live list
  // * */
  // getSubjects() async {
  //   var subjects = await _fireStore.collection("Subjects");
  //   return subjects;
  // }

  /*
  * get a Subjects by tutor email
  * @required a tutor email to find a subject
  * @return(Future<Stream<QuerySnapshot<Map<String, dynamic>>>>) a snapshots Stream/Live list
  * */
  // Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getSubjectByTutor(
  //     String tutor) async {
  //   var subjects = _fireStore
  //       .collection("Subjects")
  //       .where('tutor', isEqualTo: tutor)
  //       .snapshots();
  //   return subjects;
  // }

  // /*
  // *
  // *
  // *  get a Subject by Subject id
  // * @required a Subject id to find a subject
  // * @return(Future<Stream<DocumentSnapshot<Map<String, dynamic>>>>) a snapshots Stream/Live list
  // *  */
  // getSubjectById(String id) async {
  //   var subjects = _fireStore.collection("Subjects").doc(id).snapshots();
  //   return subjects;
  // }
}
