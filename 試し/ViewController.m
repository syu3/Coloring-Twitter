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
    AVAudioPlayer*player;
    UIImage *trimmedImage;

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSLog(@"slderが呼ばれているよ");
    

    
    
    NSLog(@"%.1f",sl);
    
    
    [slider addTarget:self action:@selector(hoge:)
 forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    
    
    
    slider.value = 1.0;
    sl = slider.value;
    
    
    
    
    
    back1.hidden = YES;
    slider.maximumValue = 1.0;
    slider.minimumValue = 0.0;
    NSLog(@"%d",hyojo);
    
    switch (hyojo) {
        case 1:
            imageview.image = [UIImage imageNamed:@"ら1.png"];

            yohaku.hidden = NO;
            yohaku1.hidden = NO;
            
            break;
        case 2:
            imageview.image = [UIImage imageNamed:@"ぞ1.png"];
            yohaku.hidden = YES;
            yohaku1.hidden = YES;

            
            break;

        case 3:
            imageview.image = [UIImage imageNamed:@"ひ1.png"];
            yohaku.hidden = YES;
            yohaku1.hidden = YES;
            
            break;

        case 4:
            imageview.image = [UIImage imageNamed:@"ゆ1.png"];
            yohaku.hidden = YES;
            yohaku1.hidden = YES;
            
            break;

        case 5:
            imageview.image = [UIImage imageNamed:@"ひこ1.png"];
            yohaku.hidden = YES;
            yohaku1.hidden = YES;
            
            break;

        case 6:
            imageview.image = [UIImage imageNamed:@"く1.png"];
            yohaku.hidden = YES;
            yohaku1.hidden = YES;
            
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










-(void)hoge:(UISlider*)slider{
    sl = slider.value;
    NSLog(@"%.1f",sl);
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

    NSString *path = [[NSBundle mainBundle] pathForResource:@"button75" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    if(url){
        NSError *err = nil;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    }
    [player play];
    ope = 0;
}
-(IBAction)green{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"button75" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    if(url){
        NSError *err = nil;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    }
    [player play];

    ope = 1;
}
-(IBAction)blue{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"button75" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    if(url){
        NSError *err = nil;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    }
    [player play];

    ope = 2;
}
-(IBAction)yellow{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"button75" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    if(url){
        NSError *err = nil;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    }
    [player play];

    ope = 3;
}
-(IBAction)black{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"button75" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    if(url){
        NSError *err = nil;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    }
    [player play];

    ope = 4;
}
-(IBAction)white{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"button75" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    if(url){
        NSError *err = nil;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    }
    [player play];

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
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.9, 0.0, 0.0,sl);
            break;
        case 1:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.6, 0.0,sl);
            break;
        case 2:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.8,sl);
            break;
        case 3:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 0.0, sl);
            break;
        case 4:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.2, 0.2, 0.2,sl);
            break;
        case 5:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0,sl);
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
-(void)rectimage{
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
    
    CGRect trimArea = CGRectMake(10, 200, 800, 850);
    
    // CoreGraphicsの機能を用いて、
    // 切り抜いた画像を作成する。
    CGImageRef srcImageRef = [srcImage CGImage];
    CGImageRef trimmedImageRef = CGImageCreateWithImageInRect(srcImageRef, trimArea);
    trimmedImage = [UIImage imageWithCGImage:trimmedImageRef];
    
    // 描画を終了します。
    
    UIGraphicsEndImageContext();
    
    trimmedImage = [UIImage imageWithCGImage:trimmedImage.CGImage scale:trimmedImage.scale orientation:UIImageOrientationLeft];
    UIImageWriteToSavedPhotosAlbum(trimmedImage, nil, nil, nil);
  UIGraphicsEndImageContext();
}
-(void)linevoid{

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, trimmedImage.size.width/2, trimmedImage.size.height/2); // 回転の中心点を移動
    CGContextScaleCTM(context, 1.0, -1.0); // Y軸方向を補正
    
    float radian = -45 * M_PI / 180; // 45°回転させたい場合
    CGContextRotateCTM(context, radian);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(-trimmedImage.size.width/2, -trimmedImage.size.height/2, trimmedImage.size.width, trimmedImage.size.height), trimmedImage.CGImage);
    
    UIImage *rotatedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // UIImageViewに回転後の画像を設定
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = rotatedImage;
    lineimage = imageview.image;
}
- (IBAction)line
{
    [self linevoid];
    NSLog(@"LINEが押されたよ");

    
    
    
    
    
    
    


    
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setData:UIImagePNGRepresentation(lineimage)
      forPasteboardType:@"public.png"];
    NSString *LineUrlString = [NSString stringWithFormat:@"line://msg/image/%@", pasteboard.name];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:LineUrlString]];
}


-(IBAction)tweet{
    [self rectimage];
    SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitter setInitialText:@"こんな絵を描きました。"];
    [twitter addImage:trimmedImage];
    
    [self presentModalViewController:twitter animated:YES];
}

    



-(IBAction)next{
    back1.hidden = NO;
    imag.image = [UIImage imageNamed:@"white2.png"];
    canvas.image = imag;
    
    rgb = 0;

    if (number1 == 1) {
        back1.alpha = 1.0;
    }


    NSLog(@"next");
    number1= number1+1;
    if (hyojo == 1&&number1 == 1) {
            imageview.image = [UIImage imageNamed:@"ら2.png"];
        back1.alpha = 1.0;
    }else if (hyojo == 1&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ら3.png"];
    }else if (hyojo == 1&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ら4.png"];
    }else if (hyojo == 1&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ら5.png"];
    }else if (hyojo == 1&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ら6.png"];
        next1.alpha = 0.0;
    
    }else if (hyojo == 2&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"ぞ1.png"];
    }else if (hyojo == 2&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ぞ2.png"];
    }else if (hyojo == 2&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ぞ3.png"];
    }else if (hyojo == 2&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ぞ4.png"];
    }else if (hyojo == 2&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ぞ5.png"];
    }else if (hyojo == 2&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ぞ6.png"];
        
    }else if (hyojo == 2&&number1 == 6) {
        imageview.image = [UIImage imageNamed:@"ぞ7.png"];
               next1.alpha = 0.0;
        
    }else if (hyojo == 3&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ひ2.png"];

    }else if (hyojo == 3&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ひ3.png"];
    }else if (hyojo == 3&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ひ4.png"];
    }else if (hyojo == 3&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ひ5.png"];
    }else if (hyojo == 3&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ひ6.png"];
        
    }else if (hyojo == 3&&number1 == 6) {
        imageview.image = [UIImage imageNamed:@"ひ7.png"];
               next1.alpha = 0.0;
        
    }else if (hyojo == 4&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ゆ2.png"];
    }else if (hyojo == 4&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ゆ3.png"];
    }else if (hyojo == 4&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ゆ4.png"];
    }else if (hyojo == 4&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ゆ5.png"];
    }else if (hyojo == 4&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ゆ6.png"];
        
    }else if (hyojo == 4&&number1 == 6) {
        imageview.image = [UIImage imageNamed:@"ゆ6.png"];
               next1.alpha = 0.0;
        
    }else if (hyojo == 5&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ひこ2.png"];
        
    }else if (hyojo == 5&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ひこ3.png"];
    }else if (hyojo == 5&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ひこ4.png"];
    }else if (hyojo == 5&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ひこ5.png"];
    }else if (hyojo == 5&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ひこ6.png"];
        
    }else if (hyojo == 5&&number1 == 6) {
        imageview.image = [UIImage imageNamed:@"ひこ7.png"];
               next1.alpha = 0.0;
    }
    else if (hyojo == 6&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"く2.png"];
    }else if (hyojo == 6&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"く3.png"];
    }else if (hyojo == 6&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"く4.png"];
    }else if (hyojo == 6&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"く5.png"];
    }else if (hyojo == 6&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"く6.png"];
        
    }else if (hyojo == 6&&number1 == 6) {
        imageview.image = [UIImage imageNamed:@"く7.png"];
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

        imageview.image = [UIImage imageNamed:@"ら1.png"];
        
    }else if (hyojo == 1&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ら2.png"];
    }else if (hyojo == 1&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ら3.png"];
    }else if (hyojo == 1&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ら4.png"];
    }else if (hyojo == 1&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ら5.png"];
        next1.alpha = 1.0;
    }
    
    
    
    
    else if (hyojo == 2&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"ぞ1.png"];
    }else if (hyojo == 2&&number1 == 1) {
        
        imageview.image = [UIImage imageNamed:@"ぞ2.png"];
        
    }else if (hyojo == 2&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ぞ3.png"];
    }else if (hyojo == 2&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ぞ4.png"];
    }else if (hyojo == 2&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ぞ5.png"];
    }else if (hyojo == 2&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ぞ6.png"];
                next1.alpha = 1.0;
    }else if (hyojo == 3&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"ひ1.png"];
    }else if (hyojo == 3&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ひ2.png"];
    }else if (hyojo == 3&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ひ3.png"];
    }else if (hyojo == 3&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ひ4.png"];
    }else if (hyojo == 3&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ひ5.png"];
    }else if (hyojo == 3&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ひ6.png"];
                next1.alpha = 1.0;
    }
    
    
    
    
    

    
    
    else if (hyojo == 4&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"ゆ1.png"];
    }else if (hyojo == 4&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ゆ2.png"];
    }else if (hyojo == 4&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ゆ3.png"];
    }else if (hyojo == 4&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ゆ4.png"];
    }else if (hyojo == 4&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ゆ5.png"];
    }else if (hyojo == 4&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ゆ6.png"];
                next1.alpha = 1.0;
    }
    
    
    
    
    
    
    
    else if (hyojo == 5&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"ひこ1.png"];
    }else if (hyojo == 5&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"ひこ2.png"];
    }else if (hyojo == 5&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"ひこ3.png"];
    }else if (hyojo == 5&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"ひこ4.png"];
    }else if (hyojo == 5&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"ひこ5.png"];
    }else if (hyojo == 5&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"ひこ6.png"];
                next1.alpha = 1.0;
    }
    
    
    
    
    
    
    
    

    else if (hyojo == 6&&number1 == 0) {
        imageview.image = [UIImage imageNamed:@"く1.png"];
    }else if (hyojo == 6&&number1 == 1) {
        imageview.image = [UIImage imageNamed:@"く2.png"];
    }else if (hyojo == 6&&number1 == 2) {
        imageview.image = [UIImage imageNamed:@"く3.png"];
    }else if (hyojo == 6&&number1 == 3) {
        imageview.image = [UIImage imageNamed:@"く4.png"];
    }else if (hyojo == 6&&number1 == 4) {
        imageview.image = [UIImage imageNamed:@"く5.png"];
    }else if (hyojo == 6&&number1 == 5) {
        imageview.image = [UIImage imageNamed:@"く6.png"];
                next1.alpha = 1.0;
    }

}
@end