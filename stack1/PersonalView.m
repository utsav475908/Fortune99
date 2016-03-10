//
//  PersonalView.m
//  stack1
//
//  Created by WWDC on 10/03/16.
//  Copyright © 2016 WWDC. All rights reserved.
//

#import "PersonalView.h"
@interface PersonalView() <UISearchBarDelegate>
@end

@implementation PersonalView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        _searchBar = [[UISearchBar alloc] init];
        [_searchBar setPlaceholder:@"Search..."];
        [_searchBar setTranslucent:TRUE];
        [_searchBar setBarStyle:UIBarStyleDefault];
        [_searchBar setSearchBarStyle:UISearchBarStyleProminent];
        [_searchBar setDelegate:self];
        [_searchBar setBarTintColor:[UIColor whiteColor]];
        [_searchBar setTintColor:[UIColor redColor]];
        [[_searchBar layer] setBorderColor:[UIColor clearColor].CGColor];
        [_searchBar setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [_searchBar setBackgroundImage:[UIImage new]];
        [_searchBar setBackgroundColor:[UIColor whiteColor]];
        
        [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setDefaultTextAttributes:@{
                                                                                                     NSFontAttributeName:Helvetica,
                                                                                                     NSForegroundColorAttributeName:[UIColor purpleColor]
        
       
        
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:@{
                                                                                                       NSForegroundColorAttributeName:[UIColor purpleColor]
                                                                                                       } forState:UIControlStateNormal];
        
        [[UISearchBar appearance] setSearchFieldBackgroundImage:[UIImage imageNamed:@"text_box"] forState:UIControlStateNormal];
        
        UIImage* image = [UIImage imageNamed:@"searchy"];
        
        [[UIImageView appearanceWhenContainedIn:[UISearchBar class], nil] setBounds:CGRectMake(0, 0, image.size.width, image.size.height)];
        [[UISearchBar appearance] setImage:[UIImage imageNamed:@"exitred"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
        [[UISearchBar appearance] setImage:[UIImage imageNamed:@"exitred"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateHighlighted];
        [[UISearchBar appearance] setImage:[UIImage imageNamed:@"searchy"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [[UISearchBar appearance] setImage:[UIImage imageNamed:@"searchy"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateHighlighted];
        
        
        //this assumes that you have your viewController set to where the navigationBar on the top of your viewcontroller extends correctly to the height of 20 points for the status bar and XX points for the
        //height of the navigationBar, for example, 64 points for an iPhone 6+ which includes 44+20=60, this means that the top layout constraint below falls at
        //the following V|-64-[CUSTOM SUBVIEW, WHICH IS THE IMPLEMENTATION FILE], this may be confusing, but it's an important note, especially if you have removed all views that
        //are subviews of the navigation bar but have left the navigation bar in tact.
        
        NSDictionary * views = NSDictionaryOfVariableBindings(_searchBar);
        NSDictionary * metrics = @{@"sp" : @10, @"bh" : @40, @"spd" : @55};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-sp-[_searchBar]-sp-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-sp-[_searchBar(spd)]" options:0 metrics:metrics views:views]];
        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
