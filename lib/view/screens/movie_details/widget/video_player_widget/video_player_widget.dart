import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:play_lab/core/utils/my_color.dart';
import 'package:play_lab/core/utils/url_container.dart';
import 'package:play_lab/data/controller/movie_details_controller/movie_details_controller.dart';
import 'package:play_lab/view/screens/sub_category/widget/player_shimmer_effect/player_shimmer_widget.dart';
import 'package:play_lab/view/screens/subscribe_plan/web_view/webview_widget.dart';
import 'player_pre_loader_image.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPlayerWidget extends StatefulWidget {
  MovieDetailsController controller;
  VideoPlayerWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
      overlays: SystemUiOverlay.values);
    super.dispose();
  }

  Widget _buildVideoPlayerWidget(MovieDetailsController controller) {
    if (controller.playVideoLoading) {
      return Center(
        child: PlayerShimmerWidget(
          press: () async {
            await controller.clearData();
            Get.back();
          },
        ),
      );
    } else if (controller.lockVideo || controller.videoUrl.isEmpty) {
      return PlayerPreLoaderImage(
        image:
            '${UrlContainer.baseUrl}${controller.playerAssetPath}${controller.playerImage}',
        isShowLoader: controller.videoUrl.isEmpty && !controller.lockVideo,
      );
    } else if (controller.webcontroller != null &&
        controller.videoDetailsLoading == false)
    // (controller.chewieController != null && controller.chewieController!.videoPlayerController.value.isInitialized && controller.videoDetailsLoading == false)

    {
 SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ));
       SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
        overlays: [SystemUiOverlay.bottom]);
      return Stack(
        children: [
          Container(
            color: Colors.black,
            child: Center(
              child:WebViewWidget(
                controller: controller.webcontroller!..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..addJavaScriptChannel(
                    'VideoFullscreen',
                    onMessageReceived: (JavaScriptMessage message) {
                      if (message.message == 'enter') {
                        // Hide both status bar and navigation bar in fullscreen
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.landscapeRight,
                        ]);
                      } else if (message.message == 'exit') {
                        // Show only navigation bar when exiting fullscreen
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
                          overlays: [SystemUiOverlay.bottom]);
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                        ]);
                      }
                    },
                  ),
              ),
            ),
          ),
          // !controller.videoPlayerController.value.isPlaying
          //     ?
          IconButton(
            onPressed: () async {
              await controller.clearData();
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: MyColor.primaryColor,
            ),
          )
          // : const SizedBox.shrink(),
        ],
      );
    } else {
      return PlayerPreLoaderImage(
        image:
            '${UrlContainer.baseUrl}${controller.playerAssetPath}${controller.playerImage}',
        isShowLoader: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildVideoPlayerWidget(widget.controller);
    // return GetBuilder<MovieDetailsController>(
    //   builder: _buildVideoPlayerWidget,
    // );
  }
}
