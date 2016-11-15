//
//  ImagePicker.m
//  GoBang
//
//  Created by Sobf GlKing on 16/8/19.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "ImagePicker.h"


@interface ImagePicker ()

@end

@implementation ImagePicker
{
    UIImagePickerController  *_picker;
}
X_SINGLETON_DEF(ImagePicker);
-(void)GlDelegateVc:(id)vc showSheetOfView:(UIView *)view showImageModel:(NSInteger)modelInteger{
    _picker = [UIImagePickerController new];
    _picker.delegate = self;
    self.vc = vc;
    self.modelInteger = modelInteger;
    _picker.allowsEditing = YES;
    _picker.allowsEditing  = self.isAllowEditing;
    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册", nil];
    [sheet showInView:view];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage * image = [[UIImage alloc]init];
    NSArray *array = @[@"UIImagePickerControllerMediaType",
                       @"UIImagePickerControllerOriginalImage",
                       @"UIImagePickerControllerEditedImage",
                       @"UIImagePickerControllerCropRect",
                       @"UIImagePickerControllerMediaURL",
                       @"UIImagePickerControllerReferenceURL",
                       @"UIImagePickerControllerMediaMetadata",
                       @"UIImagePickerControllerLivePhoto"];
    if (self.modelInteger) {
       
        image = [info objectForKey:array[self.modelInteger]];
    }else{
        image = [info objectForKey:array[2]];
    }
    
    if (self.pickerImage) {
        self.pickerImage(image);
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.vc dismissViewControllerAnimated:YES completion:nil];
}
-(void)GlGetImage:(pickerImage)pickerImage{
    
    self.pickerImage = ^(UIImage * image){
        pickerImage(image);
    };
    
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    switch (buttonIndex) {
        case 0:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            }
            break;
        case 1:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
            [self.vc presentViewController:_picker animated:NO completion:nil];
            break;
       
        default:
            break;
    }
    
    
}
@end
