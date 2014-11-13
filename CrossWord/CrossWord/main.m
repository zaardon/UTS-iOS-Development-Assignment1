//
//  main.m
//  CrossWord
//
//  Created by Alex Smith on 6/09/2014.
//  Copyright (c) 2014 Alex Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ctype.h>
#import "PrintUtility.h"
#import "WordList.h"

BOOL hasOnlyAlphaCharacters(NSString* searchWord);
BOOL hasOnlyLettersOrUnderscores(NSString* searchWord);
void createPatterns(NSString* file, NSString* searchWord, WordList* wordList, PrintUtility* print);
void createAnagrams(NSString* file, NSString* searchWord, WordList* wordList, PrintUtility* print);

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        //PrintUtility object that allows the object to use error messages
        PrintUtility* print = [[PrintUtility alloc] init];
        //WordList object that will generate the user's input
        WordList* wordList = [[WordList alloc] init];
        NSString* command;
        NSString* file;
        NSString* searchWord;
        
        //Prints the program's header
        [print programHeader];
        
        //If the command arguments are not equal to 4...
        if(argc != 4)
        {
            //Print error and end program.
            [print invalidCommandLines];
            return 0;
        }
        //Else, obtain the command line arguements.
        else
        {
            command = [NSString stringWithUTF8String:argv[1]];
            file = [NSString stringWithUTF8String:argv[2]];
            searchWord = [NSString stringWithUTF8String:argv[3]];
        }
        
        //If pattern command is given...
        if([command isEqualTo:@"P"])
        {
            createPatterns(file, searchWord, wordList, print);
        }
        //Else if anagram command is given...
        else if ([command isEqualTo:@"A"])
        {
            createAnagrams(file, searchWord, wordList, print);
        }
        //Else print error.
        else
        {
            [print invalidCommandType];
        }
    }
    return 0;
}

/*
 * Returns true/false on whether a search word contains only alphabetical characters as
 * required by the 'Anagram' functionality.
 */

BOOL hasOnlyAlphaCharacters(NSString* searchWord)
{
    //For each character in the searchWord...
    for(int i = 0; i < [searchWord length]; i++)
    {
        //If the character is an alphabetical character...
        if(isalpha([searchWord characterAtIndex:i]))
        {
            continue;
        }
        //Else, the characters are an incorrect format.
        else
        {
            return false;
        }
    }
    return true;
}

/*
 * Returns true/false on whether a search word contains only alphabetical or underscore
 * characters, as required by the 'Pattern' functionality.
 */

BOOL hasOnlyLettersOrUnderscores(NSString* searchWord)
{
    //For each character in the search word...
    for(int i = 0; i < [searchWord length]; i++)
    {
        //Check if the character is an alphabetical character...
        if(isalpha([searchWord characterAtIndex:i]))
        {
            continue;
        }
        //... Or is an '_' character...
        else if([searchWord characterAtIndex:i] == '_')
        {
            continue;
        }
        //Else, the characters are an incorrect format.
        else
        {
            return false;
        }
    }
    return true;
}

/*
 * Generates the 'Pattern' functionality of the program using a file name, search word,
 * a word list, and a print utility.
 */

void createPatterns(NSString* file, NSString* searchWord, WordList* wordList, PrintUtility* print)
{
    //Checks the search word's characters...
    if(hasOnlyLettersOrUnderscores(searchWord))
    {
        //If dictionary list is created...
        if([wordList isWordListCreatedWith:file andLength:(int)[searchWord length]])
        {
            //... Generate pattern words and print the list
            [wordList generatePatternsWith:searchWord];
            [wordList printWordList];
        }
    }
    //Else, show an error.
    else
    {
        [print invalidPattern];
    }
}

/*
 * Generates the 'Anagram' functionality of the program using a file name, search word,
 * a word list and a print utility.
 */

void createAnagrams(NSString* file, NSString* searchWord, WordList* wordList, PrintUtility* print)
{
    //Checks the search word's characters...
    if(hasOnlyAlphaCharacters(searchWord))
    {
        //If dictionary list is created...
        if([wordList isWordListCreatedWith:file andLength:(int)[searchWord length]])
        {
            //... Generate anagram words and print the list.
            [wordList generateAnagramsWith:searchWord];
            [wordList printWordList];
        }
    }
    //Else, show an error.
    else
    {
        [print invalidLetters];
    }
}
