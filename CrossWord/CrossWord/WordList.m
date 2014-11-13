//
//  WordList.m
//  CrossWord
//
//  Created by Alex Smith on 14/09/2014.
//  Copyright (c) 2014 Alex Smith. All rights reserved.
//

#import "WordList.h"

@implementation WordList

-(id) init;
{
    wordList = [NSMutableArray array];
    print = [[PrintUtility alloc] init];
    return self;
}

/*
 * Creates a list of words from a file name and word length. Returns true/false
 * depending on its outcome
 */

-(BOOL) isWordListCreatedWith: (NSString*) fileName andLength: (int) lengthOfWord;
{
    NSFileManager *fm = [NSFileManager defaultManager];
    
    //If the file exists with the given location/name...
    if([self fileExistsWith:fm withFilePath:fileName])
    {
        //Get the file's data.
        NSString *data = [NSString stringWithContentsOfFile:fileName
                                                   encoding:NSUTF8StringEncoding error:nil];
        
        //If the data does not exist, print an unreadable error...
        if (data == nil)
        {
            [print fileUnreadable:fileName];
            return false;
        }
        
        //Create an array that holds each line of the provided file.
        NSArray *lines = [data componentsSeparatedByCharactersInSet:
                          [NSCharacterSet newlineCharacterSet]];
        
        //For each line in the array of lines...
        for (NSString *line in lines)
        {
            //If the found line's length EQUALS the search word's length...
            if([line length] == lengthOfWord)
            {
                //Create a word object and add it to the word list.
                Word *word = [[Word alloc] init];
                [word setLetters:line ];
                [wordList addObject:word];
            }
        }
    }
    else
    {
        //Print a file not found message.
        [print fileNotFound:fileName];
        return false;
    }
    return true;
}

/*
 * Changes the 'Word List' to only hold 'Word' objects that match a searched word's pattern
 */

-(void) generatePatternsWith: (NSString*) searchWord;
{
    NSMutableArray *tempList = [NSMutableArray array];
    
    //For each word object in the word list...
    for(Word *word in wordList)
    {
        BOOL matches = true;
        
        //For each character in the search word...
        for(int i = 0; i < [searchWord length]; i++)
        {
            //If the character exists in the SAME index of the search word and list word...
            if([[word getWord]characterAtIndex:i] == tolower([searchWord characterAtIndex:i]))
            {
                continue;
            }
            //... Or if the search word's character is an '_'...
            else if([searchWord characterAtIndex:i] == '_')
            {
                continue;
            }
            //Else, the words do not match as a pattern.
            else
            {
                matches = false;
                break;
            }
        }
        
        if(matches)
        {
            //Add it to the temporary word list.
            [tempList addObject:word];
        }
    }
    //Set the word list to equal what was placed in the temporary word list.
    wordList = tempList;
}

/*
 * Changes the 'Word List' to only hold 'Word' objects that match a searched word's anagram
 */

-(void) generateAnagramsWith: (NSString*) searchWord;
{
    NSMutableArray *tempList = [NSMutableArray array];
    
    //For each word object in the word list...
    for (Word *word in wordList)
    {
        BOOL matches = true;
        //Makes a temporary word to store in the list of words
        NSString* myString = [word getWord];
        Word *tempWord = [[Word alloc] init];
        [tempWord setLetters: myString];
        
        //For each character in the search word...
        for(int i = 0 ; i < [searchWord length]; i++)
        {
            //If the search word's character exists in the list word...
            if([word hasCharacter:[searchWord characterAtIndex:i]])
            {
                continue;
            }
            //Else, the words do not match as an anagram.
            else
            {
                matches = false;
                break;
            }
        }
        
        if(matches)
        {
            //Add it to the temporary word list.
            [tempList addObject:tempWord];
        }
    }
    //Set the word list to equal what was placed in the temporary word list.
    wordList = tempList;
}

/*
 * Prints each 'Word' in the 'Word List' and the number of Words it contains.
 */

-(void) printWordList;
{
    //Print each word in the word list.
    for (Word *word in wordList)
    {
        [word printWord];
    }
    
    //Print the word count
    NSNumber *count = @([wordList count]);
    [print foundWords: count];
}

/*
 * Determines whether the file exists or not.
 */

-(BOOL) fileExistsWith: (NSFileManager*) fm withFilePath: (NSString*) path;
{
    //Checks if the file exists at a path
    if([fm fileExistsAtPath:path] == NO)
    {
        return false;
    }
    return true;
}

@end
