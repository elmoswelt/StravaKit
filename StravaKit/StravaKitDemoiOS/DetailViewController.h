//
//  DetailViewController.h
//  StravaKitDemoiOS
//
//  Created by Elmar Tampe on 03/12/14.
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

