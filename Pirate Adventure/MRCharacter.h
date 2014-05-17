//
//  MRCharacter.h
//  Pirate Adventure
//
//  Created by Mark Rabins on 5/15/14.
//  Copyright (c) 2014 Mark Rabins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRArmour.h"
#import "MRWeapon.h"

@interface MRCharacter : NSObject

@property (strong, nonatomic) MRArmour *armour;
@property (strong, nonatomic) MRWeapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;


@end
