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
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    canvas = [[UIImageView alloc]initWithImage:nil];
    canvas.backgroundColor = [UIColor whiteColor];
    canvas.frame = self.view.frame;
    [self.view insertSubview:canvas atIndex:0];
    

    rgb = 0;//初期設定は0
    //最初、スイッチをOFFにする
    keshigom.on = NO;
    //スイッチの値が変更されたときに呼ばれるメソッドを設定
    [keshigom addTarget:self
                 action:@selector(switch_ValueChanged:)
       forControlEvents:UIControlEventValueChanged];
    //最初、セグメントの初期値を0番目に設定しておく
    seg.selectedSegmentIndex = 0;
    //セグメントの選択が変更されたときに呼ばれるメソッドを設定
    [seg addTarget:self
            action:@selector(segment_ValueChanged:)
  forControlEvents:UIControlEventValueChanged];
}
//セグメントの選択が変更されたとき
-(void)segment_ValueChanged:(id)sender{
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    switch (segment.selectedSegmentIndex) {
        case 0://黒が選択されたとき
            rgb = 0;
            break;
        case 1://赤が選択されたとき
            rgb = 2;
            break;
        case 2://緑が選択されたとき
            rgb = 3;
            break;
        case 3://青が選択されたとき
            rgb = 4;
            break;
        case 4://青が選択されたとき
            rgb = 5;
            break;
            
        default:
            break;
    }
    keshigom.on = NO;
}
//スイッチの値が変更されたとき
-(void)switch_ValueChanged:(id)sender{
    UISwitch *sw = sender;
    if (sw.on) {
        rgb = 1;
    }else{
        rgb = 0;
    }
}
//画面に指をタッチしたときの処理
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //タッチ開始座標を先ほど宣言したtouchPointという変数に入れる
    UITouch *touch = [touches anyObject];
    touchPoint = [touch locationInView:canvas];
}
//画面に指がタッチされた状態で動かしているときの処理
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //現在のタッチ座標をcurrentPointという変数に入れる
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:canvas];
    //お絵描きできる範囲をcanvasの大きさで生成
    UIGraphicsBeginImageContext(canvas.frame.size);
    //canvasにセットされている画像(UIImage)を用意
    [canvas.image drawInRect:CGRectMake(0, 0, canvas.frame.size.width, canvas.frame.size.height)];
    //線の角を丸くする
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    //線の太さを指定
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 10.0);
    //    //線の色を指定(RGBというRed,Green,Blueの3色の加減で様々な色を表現する)
    //CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContextntext(), 0.0, 0.0, 0.0, 1.0);
    switch (rgb) {
        case 0:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0);
            break;
        case 1:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0);
            break;
        case 2://線の色を指定(RGBというred,green,blueの3色の加減で様々な色を表現する)
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
            break;
        case 3://線の色を指定(RGBというred,green,blueの3色の加減で様々な色を表現する)
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 1.0, 0.0, 1.0);
            break;
        case 4://線の色を指定(RGBというred,green,blueの3色の加減で様々な色を表現する)
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 1.0, 1.0);
            break;
        case 5://線の色を指定(RGBというred,green,blueの3色の加減で様々な色を表現する)
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 0.0, 1.0);
            break;
            
        default:
            break;
    }
    //線の描画開始座標をセットする
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), touchPoint.x, touchPoint.y);
    //線の描画終了座標をセットする
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(),currentPoint.x, currentPoint.y);
    //描画の開始~終了座標までの線を引く
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    //描画領域を画像(UIImage)としてcanvasにセット
    canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    //描画領域のクリア
    UIGraphicsEndImageContext();
    //現在のタッチ座標を次の開始座標にバトンタッチ(受け渡す)!!
    touchPoint = currentPoint;
}
-(void)png{
    //保存する範囲を指定(haikeiの範囲を取得している)
    CGRect rect = canvas.bounds;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextFillRect(ctx, rect);
    [canvas.layer renderInContext:ctx];
    //普通に保存するとJPEG形式で保存され荒れるのでPNG形式にしている
    NSData *data = UIImagePNGRepresentation(UIGraphicsGetImageFromCurrentImageContext());
    capture = [UIImage imageWithData:data];
    UIGraphicsEndImageContext();
}
//-(IBAction)save{
//    [self png];
//    UIImageWriteToSavedPhotosAlbum(capture, self, @selector(onCompleteCapture:didFinishSavingWithError:contextInfo:), NULL);
//}
//-(void)onCompleteCapture:(UIImage *)screenImage didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
//    NSString *message = @"画像を保存しました。";
//    if (error) message = @"保存に失敗しました。\nError.";
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@""
//                                                   message:message
//                                                  delegate:nil
//                                         cancelButtonTitle:@"確認"
//                                         otherButtonTitles:nil];
//    [alert show];
//}

//-(IBAction)tweetButton{
//    [self png];
//    SLComposeViewController *twitter = [[SLComposeViewController alloc]init];
//    
//    [twitter setInitialText:@"こんな絵を描きました。"];
//    [twitter addImage:capture];
//    
//    [self presentModalViewController:twitter animated:YES];
//}
- (void)viewWillAppear:(BOOL)animated{
    UIAlertView*aleart = [[UIAlertView alloc]initWithTitle:@"keikoku"
                                                   message:@"hi!" delegate:nil
                                         cancelButtonTitle:@"ok" otherButtonTitles:nil];
}
@end
