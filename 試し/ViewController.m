//
//  ViewController.m
//  試し
//
//  Created by 加藤 周 on 2014/05/27.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    int ope;
    int number;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    canvas = [[UIImageView alloc]initWithImage:nil];
    canvas.backgroundColor = [UIColor whiteColor];
    canvas.frame = self.view.frame;
    [self.view insertSubview:canvas atIndex:0];
    rgb = 0;
    gazou = [UIImage imageNamed:@"スクリーンショット 2014-07-12 20.03.27.png"];
    
   
    
//    canvas.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"スクリーンショット 2014-07-05 23.05.54.png"]];
//    [yellow addTarget:self
//               action:@selector(segment_ValueChanged:)
//     forControlEvents:UIControlEventValueChanged];
}
-(IBAction)dai{
    number = 0;
}
-(IBAction)shou{
    number = 1;
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
}-(IBAction)black{
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
     CGRectMake(0, 0, canvas.frame.size.width, canvas.frame.size.height)];
    //線の角を丸くする
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);


    switch (number) {
        case 0:
                CGContextSetLineWidth(UIGraphicsGetCurrentContext(),10.0);
            break;
        case 1:
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
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
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
-(IBAction)save{
    [self png];
    UIImageWriteToSavedPhotosAlbum(
                                   capure,
                                   self,
                                   @selector(onCompleteCapture:didFinishSavingWithError:contextInfo:),
                                   NULL);
    
    
}
-(void)onCompleteCapture:(UIImage *)screenImage didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSString *message = @"保存しました。";
    if(error) message = @"保存に失敗しました\nError.";
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@""
                                                   message:message delegate:nil cancelButtonTitle:@"確認" otherButtonTitles:nil, nil];
    [alert show];
}


-(IBAction)tuito{

    [self png];

    SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];

    [twitter setInitialText:@"こんな絵を描きました。"];
        [twitter addImage:gazou];
    gazou.image = [UIImage imageNamed:capure];



    
    [self presentViewController:twitter animated:YES completion:nil];
}

@end
