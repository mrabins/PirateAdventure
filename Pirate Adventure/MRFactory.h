//
//  MRFactory.h
//  Pirate Adventure
//
//  Created by Mark Rabins on 5/13/14.
//  Copyright (c) 2014 Mark Rabins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRCharacter.h"
#import "MRBoss.h"


@interface MRFactory : NSObject

-(NSArray *) title;
-(MRCharacter *) character;
-(MRBoss *)boss;



@end
