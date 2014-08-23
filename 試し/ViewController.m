//
//  ViewController.m
//  試し
//
//  Created by 加藤 周 on 2014/05/27.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "IllustrationViewController.h"

@interface ViewController ()

@end
@implementation ViewController{
    int ope;
    int number;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%d",hyojo);
    switch (hyojo) {
        case 1:
            imageview.image = [UIImage imageNamed:@"ライオン　１笑顔.png"];

            break;
        case 2:
            imageview.image = [UIImage imageNamed:@"ゾウ　１笑顔.png"];
            
            break;

        case 3:
            imageview.image = [UIImage imageNamed:@"ひまわり　１笑顔.png"];
            
            break;

        case 4:
            imageview.image = [UIImage imageNamed:@"雪だるま全身　１笑顔.png"];
            
            break;

        case 5:
            imageview.image = [UIImage imageNamed:@"飛行機　１笑顔.png"];
            
            break;

        case 6:
            imageview.image = [UIImage imageNamed:@"車　１笑顔.png"];
            
            break;

            
        default:
            break;
    }
    [self.view insertSubview:canvas atIndex:0];
    rgb = 0;
    c = 0;
    if (hyojo == 1) {
        CGRect rect = CGRectMake(0, 0, 800, 800);
        white21.frame = rect;
        white21.backgroundColor = [UIColor blackColor];
    }

    
   //
//
//
//
////    canvas.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"スクリーンショット 2014-07-05 23.05.54.png"]];
////    [yellow addTarget:self
////               action:@selector(segment_ValueChanged:)
////     forControlEvents:UIControlEventValueChanged];
//}
}

-(IBAction)dai{
    number = 0;
}
-(IBAction)tyu{
    number=1;
}
-(IBAction)shou{
    number = 2;
}
-(IBAction)red{
    ope = 0;
}
-(IBAction)green{
    ope = 1;
}
-(IBAction)blue{
    ope = 2;
}
-(IBAction)yellow{
    ope = 3;
}
-(IBAction)black{
    ope = 4;
}
-(IBAction)white{
    ope = 5;
}
//画面に指をタッチしたときの処理

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //タッチ開始座標を先ほど宣言したtouchPointという変数に入れる
    UITouch *touch = [touches anyObject];
    touchPoint = [touch locationInView:canvas];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    //現在のタッチ座標をcurrentPointという変数に入れる
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:canvas];
    //お絵描きできる範囲をcanvasの大きさで作成
    UIGraphicsBeginImageContext(canvas.frame.size);
    //canvasにセットされている画像(UIImage)を用意
    [canvas.image drawInRect:
     CGRectMake(0,0, canvas.frame.size.width, canvas.frame.size.height)];
    //線の角を丸くする
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);


    switch (number) {
        case 0:
                CGContextSetLineWidth(UIGraphicsGetCurrentContext(),30.0);
            break;
        case 1:
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(),15.0);
            break;
        case 2:
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(),4.0);
            break;
            
            
        default:
            break;
    }
    switch (ope) {
        case 0:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
            break;
        case 1:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 1.0, 0.0, 1.0);
            break;
        case 2:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 1.0, 1.0);
            break;
        case 3:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 0.0, 1.0);
            break;
        case 4:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.2, 0.2, 0.2, 1.0);
            break;
        case 5:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0);
            break;
           
        default:
            break;
    }
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), touchPoint.x, touchPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    touchPoint = currentPoint;
}
-(void)png{
    CGRect rect = canvas.bounds;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextFillRect(ctx, rect);
    [canvas.layer renderInContext:ctx];
    NSData *data = UIImagePNGRepresentation(UIGraphicsGetImageFromCurrentImageContext());
    capure = [UIImage imageWithData:data];
    UIGraphicsEndImageContext();
}
-(void)onCompleteCapture:(UIImage *)screenImage didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSString *message = @"保存しました。";
    if(error) message = @"保存に失敗しました\nError.";
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@""
                                                   message:message delegate:nil cancelButtonTitle:@"確認" otherButtonTitles:nil, nil];
    [alert show];
}

-(IBAction)tweet{
    
    // キャプチャ対象をWindowにします。
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    // キャプチャ画像を描画する対象を生成します。
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Windowの現在の表示内容を１つずつ描画して行きます。
    for (UIWindow *aWindow in [[UIApplication sharedApplication] windows]) {
        [aWindow.layer renderInContext:context];
    }
    
    // 描画した内容をUIImageとして受け取ります。
    UIImage *srcImage = UIGraphicsGetImageFromCurrentImageContext();

    CGRect trimArea = CGRectMake(10, 200, 800, 550);
    
    // CoreGraphicsの機能を用いて、
    // 切り抜いた画像を作成する。
    CGImageRef srcImageRef = [srcImage CGImage];
    CGImageRef trimmedImageRef = CGImageCreateWithImageInRect(srcImageRef, trimArea);
    UIImage *trimmedImage = [UIImage imageWithCGImage:trimmedImageRef];
    
    // 描画を終了します。
    
    UIGraphicsEndImageContext();
    
    trimmedImage = [UIImage imageWithCGImage:trimmedImage.CGImage scale:trimmedImage.scale orientation:UIImageOrientationLeft];
    
    
    
//    // 元の画像。ここではtest.pngという画像があるとします。
//    trimmedImage = trimmedImage;
//        CGContextRef context1 = UIGraphicsGetCurrentContext();
//    CGContextTranslateCTM(context1, trimmedImage.size.width/2, trimmedImage.size.height/2); // 回転の中心点を移動
//    CGContextScaleCTM(context1, 1.0, -1.0); // Y軸方向を補正
//    
//    float radian = 45 * M_PI / 180; // 45°回転させたい場合
//    CGContextRotateCTM(context1, radian);
//    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(-trimmedImage.size.width/2, -trimmedImage.size.height/2, trimmedImage.size.width, trimmedImage.size.height), trimmedImage                                                                                                                                               .CGImage);
//    
//    UIImage *rotatedImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    // UIImageViewに回転後の画像を設定
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = rotatedImage;

    
    
    
    
    
    
    
    
    
    
    
    

//    CGRect rect = CGRectMake(0, 30, 320, 380);
//    UIGraphicsBeginImageContext(rect.size);
//    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
//    capure = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
    UIImageWriteToSavedPhotosAlbum(trimmedImage, nil, nil, nil);
    UIGraphicsEndImageContext();
    SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitter setInitialText:@"こんな絵を描きました。"];
    [twitter addImage:trimmedImage];
    
    [self presentModalViewController:twitter animated:YES];
}
-(IBAction)next{
    rgb = 0;

    if (number1 == 1) {
        back1.alpha = 1.0;
    }


    NSLog(@"next");
    number1= number1+1;
    if (hyojo == 1&&number1 == 1) {
            imageview.image = [UIImage imageNamed:@"ライオン　2笑顔.png"];
        back1.alpha = 1.0;
    }else if (hyojo == 1&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ライオン　3ムスッと.png"];
    }else if (hyojo == 1&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ライオン　4怒.png"];
    }else if (hyojo == 1&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ライオン　5ニコニコ"];
    }else if (hyojo == 1&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ライオン　6泣.png"];
        next1.alpha = 0.0;
    
    }else if (hyojo == 2&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"ゾウ　１笑顔.png"];
    }else if (hyojo == 2&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ゾウ　2笑顔.png"];
    }else if (hyojo == 2&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ゾウ　3ムスッと.png"];
    }else if (hyojo == 2&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ゾウ　4怒.png"];
    }else if (hyojo == 2&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ゾウ　5ニコニコ.png"];
    }else if (hyojo == 2&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ゾウ　６泣.png"];
        
    }else if (hyojo == 2&&number1 == 6) {
        imageview.image = [UIImage imageNamed:@"ゾウ　7泣.png"];
               next1.alpha = 0.0;
        
    }else if (hyojo == 3&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ひまわり　2笑顔.png"];

    }else if (hyojo == 3&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ひまわり　3ムスッと.png"];
    }else if (hyojo == 3&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ひまわり　4ニコニコ.png"];
    }else if (hyojo == 3&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ひまわり　5怒.png"];
    }else if (hyojo == 3&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ひまわり　6焦.png"];
        
    }else if (hyojo == 3&&number1 == 6) {
        imageview.image = [UIImage imageNamed:@"ひまわり　7泣.png"];
               next1.alpha = 0.0;
        
    }else if (hyojo == 4&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　2笑顔.png"];
    }else if (hyojo == 4&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　3ムスッと.png"];
    }else if (hyojo == 4&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　4.png"];
    }else if (hyojo == 4&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　5怒.png"];
    }else if (hyojo == 4&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　6焦.png"];
        
    }else if (hyojo == 4&&number1 == 6) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　７泣.png"];
               next1.alpha = 0.0;
        
    }else if (hyojo == 5&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"飛行機　2笑顔.png"];
        
    }else if (hyojo == 5&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"飛行機　3ムスッと.png"];
    }else if (hyojo == 5&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"飛行機　4ニコニコ.png"];
    }else if (hyojo == 5&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"飛行機　5怒.png"];
    }else if (hyojo == 5&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"飛行機　6泣.png"];
        
    }else if (hyojo == 5&&number1 == 6) {
        imageview.image = [UIImage imageNamed:@"飛行機　7焦.png"];
               next1.alpha = 0.0;
    }
    else if (hyojo == 6&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"車　2笑顔.png"];
    }else if (hyojo == 6&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"車　3ムスッと.png"];
    }else if (hyojo == 6&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"車　4.png"];
    }else if (hyojo == 6&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"車　5怒.png"];
    }else if (hyojo == 6&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"車　6焦.png"];
        
    }else if (hyojo == 6&&number1 == 6) {
        imageview.image = [UIImage imageNamed:@"車　7泣.png"];
               next1.alpha = 0.0;
        
    }




}
-(IBAction)back{
    rgb = 0;


    number1 = number1-1;
    if (number1 == 0) {
                back1.alpha = 0.0;
    }
    if (hyojo == 1&&number1 == 5) {
        back1.alpha = 1.0;
    }else if (hyojo == 2&&hyojo == 3&&hyojo == 4&&hyojo == 5&&hyojo == 6&&number1 == 6){
        back1.alpha = 1.0;
    }
    if (hyojo == 1&&number1 == 0) {

        imageview.image = [UIImage imageNamed:@"ライオン　１笑顔.png"];
        
    }else if (hyojo == 1&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ライオン　2笑顔.png"];
    }else if (hyojo == 1&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ライオン　3ムスッと.png"];
    }else if (hyojo == 1&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ライオン　4怒.png"];
    }else if (hyojo == 1&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ライオン　5ニコニコ.png"];
        next1.alpha = 1.0;
    }
    
    
    
    
    else if (hyojo == 2&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"ゾウ　１笑顔.png"];
    }else if (hyojo == 2&&number1 == 1) {
        
        imageview.image = [UIImage imageNamed:@"ゾウ　2笑顔.png"];
        
    }else if (hyojo == 2&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ゾウ　3ムスッと.png"];
    }else if (hyojo == 2&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ゾウ　4怒.png"];
    }else if (hyojo == 2&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ゾウ　5ニコニコ.png"];
    }else if (hyojo == 2&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ゾウ　６泣.png"];
                next1.alpha = 1.0;
    }else if (hyojo == 3&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"ひまわり　１笑顔.png"];
    }else if (hyojo == 3&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ひまわり　2笑顔.png"];
    }else if (hyojo == 3&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ひまわり　3ムスッと.png"];
    }else if (hyojo == 3&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ひまわり　4ニコニコ.png"];
    }else if (hyojo == 3&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ひまわり　5怒.png"];
    }else if (hyojo == 3&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ひまわり　6焦.png"];
                next1.alpha = 1.0;
    }
    
    
    
    
    

    
    
    else if (hyojo == 4&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　１笑顔.png"];
    }else if (hyojo == 4&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　2笑顔.png"];
    }else if (hyojo == 4&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　3ムスッと.png"];
    }else if (hyojo == 4&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　4.png"];
    }else if (hyojo == 4&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　5怒.png"];
    }else if (hyojo == 4&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"雪だるま全身　6焦.png"];
                next1.alpha = 1.0;
    }
    
    
    
    
    
    
    
    else if (hyojo == 5&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"飛行機　１笑顔.png"];
    }else if (hyojo == 5&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"飛行機　2笑顔.png"];
    }else if (hyojo == 5&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"飛行機　3ムスッと.png"];
    }else if (hyojo == 5&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"飛行機　4ニコニコ.png"];
    }else if (hyojo == 5&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"飛行機　5怒.png"];
    }else if (hyojo == 5&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"飛行機　6泣.png"];
                next1.alpha = 1.0;
    }
    
    
    
    
    
    
    
    

    else if (hyojo == 6&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"車　１笑顔.png"];
    }else if (hyojo == 6&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"車　2笑顔.png"];
    }else if (hyojo == 6&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"車　3ムスッと.png"];
    }else if (hyojo == 6&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"車　4.png"];
    }else if (hyojo == 6&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"車　5怒.png"];
    }else if (hyojo == 6&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"車　6焦.png"];
                next1.alpha = 1.0;
    }

}
@end