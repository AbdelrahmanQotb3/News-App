import 'package:news_app/Utilities/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../../../../../model/articleResponse.dart';
import '../../../../../model/sourcesResponse.dart';

class NewsLocalDataSource{
  Future<SourceResponse?> loadTabsList(String categoryID) async {
    CollectionReference tabsCollection =
    FirebaseFirestore.instance.collection(FireStoreConstants.tabsCollectionName);
    DocumentSnapshot documentSnapshot = await tabsCollection.doc(categoryID).get();
    Map json = documentSnapshot.data() as Map;
    return SourceResponse.fromJson(json);
  }

  Future<ArticleResponse?> loadTabDetails(String sourceID) async{
    return null ;

  }
  Future<void> saveTabsResponse(String categoryID , SourceResponse response) async {
     CollectionReference tabsCollection =
     FirebaseFirestore.instance.collection(FireStoreConstants.tabsCollectionName);
     tabsCollection.doc(categoryID).set(response.toJson());
  }

  Future<void> saveArticles(String sourceID , ArticleResponse response) async{


  }
}