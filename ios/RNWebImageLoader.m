/**
 * Copyright (c) Eric Lewis.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RNWebImageLoader.h"

#if __has_include("RCTUtils.h")
#import "RCTUtils.h"
#else
#import <React/RCTUtils.h>
#endif

#import <SDWebImage/SDWebImageManager.h>

@implementation RNWebImageLoader

RCT_EXPORT_MODULE()

- (BOOL)canLoadImageURL:(NSURL *)requestURL
{
  NSString *scheme = [requestURL scheme];
  BOOL isWebURL = [scheme isEqualToString:@"http"] || [scheme isEqualToString:@"https"];
  
  NSString *extension = [requestURL pathExtension];
  BOOL isImageURL = [extension isEqualToString:@"gif"] || [extension isEqualToString:@"png"] || [extension isEqualToString:@"jpg"] || [extension isEqualToString:@"jpeg"];
  
  return !RCTIsLocalAssetURL(requestURL) && isWebURL && isImageURL;
}

- (RCTImageLoaderCancellationBlock)loadImageForURL:(NSURL *)imageURL
                                              size:(CGSize __unused)size
                                             scale:(CGFloat __unused)scale
                                        resizeMode:(RCTResizeMode __unused)resizeMode
                                   progressHandler:(RCTImageLoaderProgressBlock)progressHandler
                                partialLoadHandler:(RCTImageLoaderPartialLoadBlock)partialLoadHandler
                                 completionHandler:(RCTImageLoaderCompletionBlock)completionHandler
{
  
  SDWebImageManager *manager = [SDWebImageManager sharedManager];
  SDWebImageCombinedOperation *operation = [manager loadImageWithURL:imageURL options:SDWebImageProgressiveLoad context:nil progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * __unused _Nullable targetURL) {
    if (progressHandler) {
      progressHandler(receivedSize, expectedSize);
    }
  } completed:^(UIImage * _Nullable image, NSData * __unused _Nullable data, NSError * _Nullable error, SDImageCacheType __unused cacheType, BOOL finished, NSURL * __unused _Nullable imgURL) {
    if (finished) {
      completionHandler(error, image);
    } else if (partialLoadHandler) {
      partialLoadHandler(image);
    }
  }];
  
  dispatch_block_t cancellationBlock = ^{
    [operation cancel];
  };
  
  return cancellationBlock;
}


@end
