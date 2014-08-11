//
//  ViewController.m
//  試し
//
//  Created by 加藤 周 on 2014/05/27.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end
@implementation ViewController{
    int ope;
    int number;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    a = 0;
    canvas = [[UIImageView alloc]initWithImage:nil];
    canvas.backgroundColor = [UIColor whiteColor];
    canvas.frame = self.view.frame;
    [self.view insertSubview:canvas atIndex:0];
    rgb = 0;
    c = 0;
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

-(IBAction)tweet{
    CGRect rect = CGRectMake(0, 30, 320, 380);
    UIGraphicsBeginImageContext(rect.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    capure = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(capure, nil, nil, nil);
    UIGraphicsEndImageContext();
    SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitter setInitialText:@"こんな絵を描きました。"];
    [twitter addImage:capure];
    
    [self presentModalViewController:twitter animated:YES];
}
//-(IBAction)tapBtn{
//
//    
//    c = c + 1;
//    if (c == 1) {
//        
//    
//    myButton.center=CGPointMake(445,306);
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2];
//    myButton.center=CGPointMake(485, 306);
//    [UIView commitAnimations];
//    NSLog(@"オーイオーイオーイオーイオーイオーイ");
//    }else if (c ==2 ){
//        NSLog(@"co2");
//        myButton.center=CGPointMake(485,306);
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:2];
//        myButton.center=CGPointMake(500, 306);
//        [UIView commitAnimations];
//        NSLog(@"オーイ1オーイ1オーイ1オーイ1オーイオーイ1");
//    }else{
//        NSLog(@"co3");
//        myButton.center=CGPointMake(500,306);
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:2];
//        myButton.center=CGPointMake(530, 306);
//        [UIView commitAnimations];
//        NSLog(@"オーイ2オーイ1オーイ1オーイ1オーイオーイ1");
//    }
//}

//-(IBAction)next1{
//    NSLog(@"next1");
//    a=a+1;
//    NSLog(@"%d",a);
//    if (a== 1) {
//        [UIView animateWithDuration:2 animations:^{
//            CGRect frame = myView.frame;
//            frame.origin.y += -483;
//            myView.frame = frame;
//            
//        }];
//    }else if (a == 2){
//        
//        [UIView animateWithDuration:5 animations:^{
//            CGRect frame = myView.frame;
//            frame.origin.y += -480;
//            myView.frame = frame;
//            
//        }];
//    }
//}
//-(IBAction)next2{
//    NSLog(@"next2");
//    a=a+1;
//    NSLog(@"%d",a);
//    if (a== 1) {
//        [UIView animateWithDuration:2 animations:^{
//            CGRect frame = myView.frame;
//            frame.origin.y += -483;
//            myView.frame = frame;
//            
//        }];
//    }else if (a == 2){
//        
//        [UIView animateWithDuration:5 animations:^{
//            CGRect frame = myView.frame;
//            frame.origin.y += -480;
//            myView.frame = frame;
//            
//        }];
//    }
//}
@end