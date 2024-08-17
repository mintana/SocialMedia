import 'package:get/get.dart';
import 'package:socialmedia/api/apiservice.dart';
import 'package:socialmedia/models/commentmodel.dart';
import 'package:socialmedia/models/usermodel.dart';

class PostDetailsController extends GetxController {
  var comments = <CommentModel>[].obs;
  var isLoading = true.obs;

  final ApiService apiService;
  final int postId;

  PostDetailsController({
    required this.apiService,
    required this.postId, required int userId,
  });

  @override
  void onInit() {
    super.onInit();
    fetchComments();
  }

  void fetchComments() async {
    try {
      isLoading.value = true;
      final fetchedComments = await apiService.fetchComments(postId);
      comments.assignAll(fetchedComments);
    } catch (e) {
    } 
  }
}