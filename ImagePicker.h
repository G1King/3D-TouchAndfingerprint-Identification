//
//  ImagePicker.h
//  GoBang
//
//  Created by Sobf GlKing on 16/8/19.
//  Copyright © 2016年 SOBF. All rights reserved.
//

// 背景

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "GB.h"
typedef void(^pickerImage)(UIImage * imagePicker);
@interface ImagePicker : NSObject <UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property (nonatomic,weak) id vc;
/**
 *  是否允许编辑 默认为YES
 */
@property (nonatomic,assign) BOOL isAllowEditing;
/**
 *  图片显示样式 UIImagePickerControllerLivePhoto UIImagePickerControllerMediaMetadata UIImagePickerControllerReferenceURL
 *  UIImagePickerControllerMediaURL UIImagePickerControllerCropRect UIImagePickerControllerEditedImage UIImagePickerControllerOriginalImage
 */
@property (nonatomic,assign) NSInteger modelInteger;
/**
 *  回调的blcok
 */
@property (nonatomic,copy) pickerImage pickerImage;
/**
 *  单例
 *
 *  @return
 */
X_SINGLETON_DEC(ImagePicker);
/**
 *  显示在哪个view
 *
 *  @param vc           vc
 *  @param view         view
 *  @param modelInteger 图片模式
 */
-(void)GlDelegateVc:(id)vc showSheetOfView:(UIView*)view showImageModel:(NSInteger)modelInteger;
/**
 *  选中图片的回调
 *
 *  @param pickerImage block
 */
-(void)GlGetImage:(pickerImage)pickerImage;
@end
