//
//  irasutoViewController.h
//  試し
//
//  Created by 加藤 周 on 2014/07/14.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"

@interface irasutoViewController : ViewController{
    IBOutlet UIImageView*irasuto1;
    IBOutlet UIImageView*irasuto2;
    IBOutlet UIButton *next;
    int kaisuu;
    int gazou1;
    int gazou2;
    
    
    
}
-(IBAction)next;

@end
