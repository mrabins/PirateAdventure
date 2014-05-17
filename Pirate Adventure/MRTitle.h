//
//  MRTitle.h
//  Pirate Adventure
//
//  Created by Mark Rabins on 5/13/14.
//  Copyright (c) 2014 Mark Rabins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRWeapon.h"
#import "MRArmour.h"

@interface MRTitle : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) MRWeapon *weapon;
@property (strong, nonatomic) MRArmour *armour;
@property (nonatomic) int healthEffect;




@end
