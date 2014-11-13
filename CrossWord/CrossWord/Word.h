//
//  Word.h
//  CrossWord
//
//  Created by Alex Smith on 6/09/2014.
//  Copyright (c) 2014 Alex Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject
{
    //NSString that holds the object's letter value
    NSMutableString* letters;
}

-(void) setLetters: (NSString*) l;
-(void) printWord;
-(NSMutableString*) getWord;
-(BOOL) hasCharacter:(char ) c;

@end
