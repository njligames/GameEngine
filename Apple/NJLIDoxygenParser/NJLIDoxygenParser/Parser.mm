//
//  Parser.m
//  NJLIDoxygenParser
//
//  Created by James Folk on 2/10/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#import "Parser.h"

const NSString *START = @"SYMBOLS start  =======================================";
const NSString *FINISH = @"SYMBOLS finish =======================================";

const NSString *BREAK = @"===================================================";
const NSString *CLASS = @"(class)";
const NSString *CDECL = @"(cdecl)";
const NSString *ENUMITEM = @"(enumitem)";
const NSString *ENUM = @"(enum)";
const NSString *CONSTANT = @"(constant)";
const NSString *CLASSFORWARD = @"(classforward)";
const NSString *TEMPLATE = @"(template)";
const NSString *CONSTRUCTOR = @"(constructor)";
const NSString *DESTRUCTOR = @"(destructor)";
const NSString *NAMESPACE = @"(namespace)";

@interface Parser () <NSXMLParserDelegate>

@property (assign) BOOL didAbortParsing;

// a stack queue containing  elements as they are being parsed, used to detect malformed XML.
@property (nonatomic, strong) NSMutableArray *elementStack;
@property NSMutableArray *processedItems;
@property NSMutableDictionary *swigSymbols;

@property NSDictionary *currentAttribute;
@property NSString *currentElement;

@property BOOL b_inscope;
@property BOOL b_static;

@property NSString *compoundname;

@property NSMutableDictionary *returnType;
@property NSString *functionDefinition;
@property NSString *functionArgmentString;
@property NSString *functionName;
@property NSString *functionBriefDescription;
@property NSString *functionInbodydescription;
@property NSDictionary *functionLocation;

@property NSMutableArray *functionParaArray;
@property NSString *currentFunctionPara;

@property NSMutableDictionary *currentFunctionParameterNameDict;
@property NSMutableArray *functionParameterNameList;

@property NSMutableDictionary *currentFunctionParameterTypeDict;
@property NSMutableArray *functionParameterTypeList;

@property NSString *functionReturnDescription;
@property NSString *functionAuthor;

@property BOOL b_inauthor;
@property BOOL b_returnDescription;

@property BOOL b_listOnly;

@property NSMutableArray *classList;


@end



@implementation Parser

@synthesize stubsDirectory;
@synthesize ldocDirectory;
@synthesize sublimeSnippetDirectory;

- (NSString*)stubs
{
    NSArray *chunks = [self.compoundname componentsSeparatedByString: @"::"];
    NSString *classname = [chunks objectAtIndex:0];
    if ([chunks count] >= 2)
    {
        classname = [self trimPCDATA:[chunks objectAtIndex:1]];
    }
    
    NSString *fileData = [[NSString alloc] initWithFormat:@"\n\
--Test the functions for %@\n\
local Test = {}\n\
\n", classname];
    
    NSMutableArray *functions = [[NSMutableArray alloc] init];
    int function_index = 0;
    
    for (NSDictionary *item in self.processedItems)
    {
        if ([self functionExists:item[@"functionName"] className:item[@"classname"] namespaceName:item[@"namespace"]])
        {
            NSMutableArray *lines = [[NSMutableArray alloc] init];
            int index = 0;
            
            NSNumber *n = item[@"static"];
            BOOL b_static = [n boolValue];
            
            NSString *paramstring = @"";
            NSString *paramstring_underscore = @"";
            int i = 0;
            for (NSDictionary *param in item[@"functionParameters"])
            {
                if(![paramstring isEqualToString:@""])
                {
                    paramstring = [paramstring stringByAppendingString:@", "];
                    NSString *pname = param[@"name"];
                    if ([pname isEqualToString:@""])
                    {
                        pname = [NSString stringWithFormat:@"param%d", i+1];
                    }
                    paramstring = [paramstring stringByAppendingString:pname];
                    
                }
                else
                {
                    NSString *pname = param[@"name"];
                    if ([pname isEqualToString:@""])
                    {
                        pname = [NSString stringWithFormat:@"param%d", i+1];
                    }
                    paramstring = [paramstring stringByAppendingString:pname];
                }
                
                
                
                
                if(![paramstring_underscore isEqualToString:@""])
                {
                    paramstring_underscore = [paramstring_underscore stringByAppendingString:@"_"];
                    NSString *pname = param[@"name"];
                    if ([pname isEqualToString:@""])
                    {
                        pname = [NSString stringWithFormat:@"param%d", i+1];
                    }
                    paramstring_underscore = [paramstring_underscore stringByAppendingString:pname];
                    
                }
                else
                {
                    NSString *pname = param[@"name"];
                    if ([pname isEqualToString:@""])
                    {
                        pname = [NSString stringWithFormat:@"param%d", i+1];
                    }
                    paramstring_underscore = [paramstring_underscore stringByAppendingString:pname];
                }
                ++i;
            }
            
            NSString *function_name = [NSString stringWithFormat:@"%@_%@_%@", item[@"classname"], item[@"functionName"], paramstring_underscore];
            
            
            lines[index++] = [NSString stringWithFormat:@"local function %@()", function_name];
            lines[index++] = [NSString stringWithFormat:@"--//! [%@]", function_name];
            
            //        lines[index++] = [NSString stringWithFormat:@"-- @return %@", item[@"functionReturnDescription"]];
            
            if (b_static)
            {
                lines[index++] = [NSString stringWithFormat:@"-- @TODO:Test: %@.%@.%@(%@)", item[@"namespace"], item[@"classname"], item[@"functionName"], paramstring];
                //            lines[index++] = [NSString stringWithFormat:@"function %@(%@)\nend", item[@"functionName"], paramstring];
            }
            else
            {
                lines[index++] = [NSString stringWithFormat:@"-- @TODO: Test: %@:%@(%@)", item[@"classname"], item[@"functionName"], paramstring];
                //            lines[index++] = [NSString stringWithFormat:@"function %@(%@)\nend", item[@"functionName"], paramstring];
            }
            
            lines[index++] = [NSString stringWithFormat:@"--//! [%@]\n", function_name];
            lines[index++] = @"end";
            
            
            functions[function_index++] = [NSString stringWithFormat:@"\t%@()", function_name];
            
            fileData = [fileData stringByAppendingString:[lines componentsJoinedByString:@"\n"]];
            fileData = [fileData stringByAppendingString:@"\n\n"];
        }
    }
    NSString *all_functions = [functions componentsJoinedByString:@"\n"];
//    all_functions = [all_functions stringByAppendingString:@"\n\n"];
    
    fileData = [NSString stringWithFormat:@"%@\nfunction Test:testAll()\n%@\nend\n\nreturn Test", fileData, all_functions];
    
    return fileData;
}

/*
- (NSString*)stubs
{
    NSArray *chunks = [self.compoundname componentsSeparatedByString: @"::"];
    NSString *classname = [chunks objectAtIndex:0];
    if ([chunks count] >= 2)
    {
        classname = [self trimPCDATA:[chunks objectAtIndex:1]];
    }
    
    NSString *fileData = [[NSString alloc] initWithFormat:@"\n\
                          --Test the functions for @file %@\n\
                          \n\
                          \n", classname];
    
    NSString *function = [[NSString alloc] initWithFormat:@"--//! [test_factory]\n\
function test_factory()\n\
-- code here\n\
end\n\
--//! [test_factory]\n\
\n", classname];
    
    NSMutableArray *lines = [[NSMutableArray alloc] init];
    for (NSDictionary *item in self.processedItems)
    {
        NSMutableArray *lines = [[NSMutableArray alloc] init];
        int index = 0;
    }
    
    return fileData;
}
*/

- (NSString*)generateSnippetParam:(int)number name:(NSString*)name
{
    return [NSString stringWithFormat:@"${%d:%@}", number, name];
}
- (NSArray*)snippets
{
    /*
     <snippet>
     <content><![CDATA[
     Hello, ${1:this} is a ${2:snippet}.
     ]]></content>
     <!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
     <!-- <tabTrigger>hello</tabTrigger> -->
     <!-- Optional: Set a scope to limit where the snippet will trigger -->
     <!-- <scope>source.python</scope> -->
     </snippet>
     */
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    NSArray *chunks = [self.compoundname componentsSeparatedByString: @"::"];
    NSString *classname = [chunks objectAtIndex:0];
    if ([chunks count] >= 2)
    {
        classname = [self trimPCDATA:[chunks objectAtIndex:1]];
    }
    
    
    
    for (NSDictionary *item in self.processedItems)
    {
        if ([self functionExists:item[@"functionName"] className:item[@"classname"] namespaceName:item[@"namespace"]])
        {
            NSString *fileData = @"\
<snippet>\n\
<content><![CDATA[\n";
            
            NSMutableArray *lines = [[NSMutableArray alloc] init];
            int index = 0;
            
            NSNumber *n = item[@"static"];
            BOOL b_static = [n boolValue];
            
            
            //        lines[index++] = [NSString stringWithFormat:@"---- %@", item[@"functionBriefDescription"]];
            
            if (![item[@"functionAuthor"] isEqualToString:@""])
            {
                //            lines[index++] = [NSString stringWithFormat:@"-- @author %@", item[@"functionAuthor"]];
            }
            
            for (NSString *paraline in item[@"functionParaArray"])
            {
                //            lines[index++] = [NSString stringWithFormat:@"-- %@", paraline];
            }
            
            NSString *paramstring = @"";
            int i = 0;
            for (NSDictionary *param in item[@"functionParameters"])
            {
                //            lines[index++] = [NSString stringWithFormat:@"-- @param %@ %@", param[@"name"], param[@"description"]];
                NSString *pname = param[@"name"];
                
                if(![paramstring isEqualToString:@""])
                {
                    paramstring = [paramstring stringByAppendingString:@", "];
                    
                    if ([pname isEqualToString:@""])
                    {
                        pname = [NSString stringWithFormat:@"param%d", i+1];
                    }
                }
                else
                {
                    if ([pname isEqualToString:@""])
                    {
                        pname = [NSString stringWithFormat:@"param%d", i+1];
                    }
                }
                
                paramstring = [paramstring stringByAppendingString:[self generateSnippetParam:(i+1) name:pname]];
                
                ++i;
            }
            
            //        lines[index++] = [NSString stringWithFormat:@"-- @return %@", item[@"functionReturnDescription"]];
            
            if (b_static)
            {
                lines[index++] = [NSString stringWithFormat:@"%@.%@.%@(%@)", item[@"namespace"], item[@"classname"], item[@"functionName"], paramstring];
            }
            else
            {
                lines[index++] = [NSString stringWithFormat:@"%@(%@)", item[@"functionName"], paramstring];
            }
            
            lines[index++] = @"]]></content>";
            
            if (b_static)
            {
                lines[index++] = [NSString stringWithFormat:@"<tabTrigger>%@.%@</tabTrigger>", item[@"classname"], item[@"functionName"]];
            }
            else
            {
                lines[index++] = [NSString stringWithFormat:@"<tabTrigger>%@:%@</tabTrigger>", item[@"classname"], item[@"functionName"]];
            }
            
            lines[index++] = @"<scope>source.lua</scope>";
            lines[index++] = @"</snippet>";
            /*
             <snippet>
             <content><![CDATA[
             Hello, ${1:this} is a ${2:snippet}.
             ]]></content>
             <!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
             <!-- <tabTrigger>hello</tabTrigger> -->
             <!-- Optional: Set a scope to limit where the snippet will trigger -->
             <!-- <scope>source.python</scope> -->
             </snippet>
             */
            
            fileData = [fileData stringByAppendingString:[lines componentsJoinedByString:@"\n"]];
            fileData = [fileData stringByAppendingString:@"\n\n"];
            
            NSString *function_name = [NSString stringWithFormat:@"%@_%@_%@.sublime-snippet", item[@"namespace"], item[@"classname"], item[@"functionName"]];
            
            
            NSDictionary *dd = @{@"file" : [self trimPCDATA:function_name],
                                 @"data" : fileData};
            [array addObject:dd];
            
            //        dict[@"file"] = function_name;
            //        dict[@"data"] = fileData;
        }
    }
    return array;
}

//LDoc documentation: https://stevedonovan.github.io/ldoc/manual/doc.md.html#Introduction
- (NSString*)ldoc
{
    NSArray *chunks = [self.compoundname componentsSeparatedByString: @"::"];
    NSString *classname = [chunks objectAtIndex:0];
    NSString *_namespace = @"";
    if ([chunks count] == 2)
    {
        _namespace = [self trimPCDATA:[chunks objectAtIndex:0]];
        classname = [self trimPCDATA:[chunks objectAtIndex:1]];
    }
    
    NSString *fileData = [[NSString alloc] initWithFormat:@"\n\
----\n\
-- @file %@\n\
\n\
\n", classname];
    
    for (NSDictionary *item in self.processedItems)
    {
        //item[@"namespace"], item[@"classname"], item[@"functionName"]
        
        if ([self functionExists:item[@"functionName"] className:item[@"classname"] namespaceName:item[@"namespace"]])
        {
            NSMutableArray *lines = [[NSMutableArray alloc] init];
            int index = 0;
            
            NSNumber *n = item[@"static"];
            BOOL b_static = [n boolValue];
            
            
            lines[index++] = [NSString stringWithFormat:@"---- %@", item[@"functionBriefDescription"]];
            
            if (![item[@"functionAuthor"] isEqualToString:@""])
            {
                lines[index++] = [NSString stringWithFormat:@"-- @author %@", item[@"functionAuthor"]];
            }
            
            for (NSString *paraline in item[@"functionParaArray"])
            {
                lines[index++] = [NSString stringWithFormat:@"-- %@", paraline];
            }
            
            NSString *paramstring = @"";
            int i = 0;
            for (NSDictionary *param in item[@"functionParameters"])
            {
                lines[index++] = [NSString stringWithFormat:@"-- @param %@ %@", param[@"name"], param[@"description"]];
                
                
                if(![paramstring isEqualToString:@""])
                {
                    paramstring = [paramstring stringByAppendingString:@", "];
                    NSString *pname = param[@"name"];
                    if ([pname isEqualToString:@""])
                    {
                        pname = [NSString stringWithFormat:@"param%d", i+1];
                    }
                    paramstring = [paramstring stringByAppendingString:pname];
                    
                }
                else
                {
                    NSString *pname = param[@"name"];
                    if ([pname isEqualToString:@""])
                    {
                        pname = [NSString stringWithFormat:@"param%d", i+1];
                    }
                    paramstring = [paramstring stringByAppendingString:pname];
                }
                ++i;
            }
            
            lines[index++] = [NSString stringWithFormat:@"-- @return %@", item[@"functionReturnDescription"]];
            
            if (b_static)
            {
                lines[index++] = [NSString stringWithFormat:@"function %@.%@.%@(%@)\nend", item[@"namespace"], item[@"classname"], item[@"functionName"], paramstring];
                //            lines[index++] = [NSString stringWithFormat:@"function %@(%@)\nend", item[@"functionName"], paramstring];
            }
            else
            {
                lines[index++] = [NSString stringWithFormat:@"function %@:%@(%@)\nend", item[@"classname"], item[@"functionName"], paramstring];
                //            lines[index++] = [NSString stringWithFormat:@"function %@(%@)\nend", item[@"functionName"], paramstring];
            }
            
            fileData = [fileData stringByAppendingString:[lines componentsJoinedByString:@"\n"]];
            fileData = [fileData stringByAppendingString:@"\n\n"];
        }
    }
    return fileData;
}

- (NSString*)assemblePCDATA:(NSString*)pcdata newString:(NSString*)newString
{
    if (pcdata)
    {
        return [pcdata stringByAppendingString:newString];
    }
    return @"";
}

- (NSString*)trimPCDATA:(NSString*)pcdata
{
    if (pcdata)
    {
        return [pcdata stringByTrimmingCharactersInSet:
                [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return @"";
}

- (NSString*)fixMultiline:(NSString*)data
{
    NSArray *chunks = [data componentsSeparatedByString: @"\n"];
    if ([chunks count] > 1)
    {
        return [chunks componentsJoinedByString:@"\n-- "];
    }
    return data;
}

- (NSString*)createPathWithFile:(NSString*)file
{
//    NSString *base = @"/Users/jamesfolk/Dropbox/GameDevelopment/NJLIGames/NJLIGameEngine/Source/jli_game_engine/version-1.0/doc/doxygen/xml/";
//    
    NSString *root = [NSString stringWithFormat:@"%@/%@.xml", [self xmlDirectory], file];
    
    if ([root isEqualToString:@""])
    {
        NSLog(@"The file: %@ doesn't exist.", root);
    }
    
    return root;
}

- (void)createSublimeSnippets
{
    NSArray *s = [self snippets];
    
    NSString *dir = [self sublimeSnippetDirectory];
    
    char path[2048];
    for (NSDictionary *d in s)
    {
        NSString *file = d[@"file"];
        NSString *data = d[@"data"];
        
        sprintf(path, "%s/%s", [dir UTF8String], [file UTF8String]);
        FILE * pFile;
        pFile = fopen (path,"w");
        if (pFile!=NULL)
        {
            fputs ([data UTF8String],pFile);
            fclose (pFile);
        }
    }
//    NSArray *chunks = [self.compoundname componentsSeparatedByString: @"::"];
//    NSString *classname = [chunks objectAtIndex:0];
//    if ([chunks count] >= 2)
//    {
//        classname = [self trimPCDATA:[chunks objectAtIndex:1]];
//    }
    
    
    
    
//    char path[2048];
//    sprintf(path, "%s/%s.sublime-snippet", [dir UTF8String], [classname UTF8String]);
//    FILE * pFile;
//    pFile = fopen (path,"w");
//    if (pFile!=NULL)
//    {
//        fputs ([s UTF8String],pFile);
//        fclose (pFile);
//    }
}
- (void)createldoc
{
    NSString *s = [self ldoc];
    
    NSArray *chunks = [self.compoundname componentsSeparatedByString: @"::"];
    NSString *classname = [chunks objectAtIndex:0];
    NSString *_namespace = @"";
    
    if ([chunks count] == 2)
    {
        _namespace = [self trimPCDATA:[chunks objectAtIndex:0]];
        classname = [self trimPCDATA:[chunks objectAtIndex:1]];
    }
    else
    {
        NSLog(@"%@", chunks);
    }
    
    
    NSString *dir = [self ldocDirectory];
    
    char path[2048];
    sprintf(path, "%s/%s.lua", [dir UTF8String], [classname UTF8String]);
    FILE * pFile;
    pFile = fopen (path,"w");
    if (pFile!=NULL)
    {
        fputs ([s UTF8String],pFile);
        fclose (pFile);
    }
    
    //config.ld
    sprintf(path, "%s/config.ld", [dir UTF8String]);
    pFile = fopen (path,"w");
    
    if (pFile!=NULL)
    {
        NSString *configfile = @"\
-- ldoc configuration file\n\
title = \"NJLI docs\"\n\
project = \"NJLI\"";
        fputs ([configfile UTF8String],pFile);
        fclose (pFile);
    }
}

- (void)createstubs
{
    NSString *s = [self stubs];
    
    NSArray *chunks = [self.compoundname componentsSeparatedByString: @"::"];
    NSString *classname = [chunks objectAtIndex:0];
    if ([chunks count] >= 2)
    {
        classname = [self trimPCDATA:[chunks objectAtIndex:1]];
    }
    
    NSString *dir = [self stubsDirectory];
    
    char path[2048];
    sprintf(path, "%s/%s.lua", [dir UTF8String], [classname UTF8String]);
    FILE * pFile;
    pFile = fopen (path,"w");
    if (pFile!=NULL)
    {
        fputs ([s UTF8String],pFile);
        fclose (pFile);
    }
}


- (NSMutableDictionary*)namespacePass:(NSString*)namepace
{
    
    NSMutableDictionary *classDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray *enumitemArray = [[NSMutableArray alloc] init];
    NSMutableArray *enumArray = [[NSMutableArray alloc] init];
    NSMutableArray *cdeclArray = [[NSMutableArray alloc] init];
    NSMutableArray *classforwardArray = [[NSMutableArray alloc] init];
    NSMutableArray *templateArray = [[NSMutableArray alloc] init];
    NSMutableArray *constructorArray = [[NSMutableArray alloc] init];
    NSMutableArray *destructorArray = [[NSMutableArray alloc] init];
    NSMutableArray *constantArray = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{CLASS: classDictionary,
                                                                                  ENUMITEM: enumitemArray,
                                                                                  ENUM: enumitemArray,
                                                                                  CDECL: cdeclArray,
                                                                                  CLASSFORWARD: classforwardArray,
                                                                                  TEMPLATE: templateArray,
                                                                                  CONSTANT: constantArray,
                                                                                  CONSTRUCTOR: constructorArray,
                                                                                  DESTRUCTOR: destructorArray}];
    
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:[self swigSymbolsFile] encoding:NSUTF8StringEncoding error:&error];
    
    NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    BOOL foundBreak = NO;
    NSString *currentClass = @"";
    BOOL foundNamespace = NO;
    
    for (NSString *uncleanedLine in allLinedStrings)
    {
        NSString *line = [self trimPCDATA:uncleanedLine];
        
        if ([START isEqualToString:line] ||
            [FINISH isEqualToString:line] ||
            [@"" isEqualToString:line])
        {
            continue;
        }
        else
        {
            if (foundBreak)
            {
                if (foundNamespace)
                {
                    //return the dictionary
                    return dict;
                }
                else
                {
                    NSArray* components = [line componentsSeparatedByString:@"-"];
                    
                    currentClass = [self trimPCDATA:[components objectAtIndex:0]];
                    if ([namepace isEqualToString:currentClass])
                    {
                        foundNamespace = YES;
                    }
                }
                
                foundBreak=NO;
            }
            else
            {
                if ([BREAK isEqualToString:line])
                {
                    foundBreak = YES;
                }
                else
                {
                    if ([namepace isEqualToString:currentClass])
                    {
                        NSArray* components = [[self trimPCDATA:line] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                        
                        if ([components count] == 2)
                        {
                            NSString *value = [self trimPCDATA:[components objectAtIndex:0]];
                            NSString *type = [self trimPCDATA:[components objectAtIndex:1]];
                            
                            if ([CLASS isEqualToString:type])
                            {
                                classDictionary[value] = [[NSMutableDictionary alloc] init];
                            }
                            else if ([CDECL isEqualToString:type])
                            {
                                [cdeclArray addObject:value];
                            }
                            else if ([ENUMITEM isEqualToString:type])
                            {
                                [enumitemArray addObject:value];
                            }
                            else if ([ENUM isEqualToString:type])
                            {
                                [enumArray addObject:value];
                            }
                            else if ([CLASSFORWARD isEqualToString:type])
                            {
                                [classforwardArray addObject:value];
                            }
                            else if ([TEMPLATE isEqualToString:type])
                            {
                                [templateArray addObject:value];
                            }
                            else if ([CONSTRUCTOR isEqualToString:type])
                            {
                                [constructorArray addObject:value];
                            }
                            else if ([DESTRUCTOR isEqualToString:type])
                            {
                                [destructorArray addObject:value];
                            }
                            else if ([CONSTANT isEqualToString:type])
                            {
                                [constantArray addObject:value];
                            }
                            else
                            {
                                NSLog(@"NOT accounted for.... %@, %@", type, value);
                            }
                        }
                        else
                        {
                            NSLog(@"There are more than 2 components: %@ \nnamepace: %@ \ncurrentClass: %@", components, namepace, currentClass);
                        }
                    }
                }
            }
        }
    }
    
    return dict;
}

- (NSMutableArray *)createNamepaceArray
{
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:[self swigSymbolsFile] encoding:NSUTF8StringEncoding error:&error];
    
    NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    NSMutableArray *namespaceArray = [[NSMutableArray alloc] init];
    
    for (NSString *uncleanedLine in allLinedStrings)
    {
        NSString *line = [self trimPCDATA:uncleanedLine];
        
        if ([START isEqualToString:line] ||
            [FINISH isEqualToString:line] ||
            [@"" isEqualToString:line])
        {
            continue;
        }
        else
        {
            
            NSArray* components = [line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            if ([components count] >= 2)
            {
                if ([NAMESPACE isEqualToString:components[1]])
                {
                    [namespaceArray addObject:components[0]];
                }
            }
        }
    }
    return namespaceArray;
}

- (void)parseSWIGSymbols
{
    NSMutableArray *array = [self createNamepaceArray];
    [array addObject:@""];
    
    
    self.swigSymbols = [[NSMutableDictionary alloc] init];
    
    for (NSString *_namespace in array)
    {
        NSMutableDictionary *readDict = [self namespacePass:_namespace][CLASS];
        NSMutableDictionary *writeDict = [[NSMutableDictionary alloc] init];
        
        for (NSString *_class in readDict)
        {
            NSString *_namespace_class = [NSString stringWithFormat:@"%@::%@", _namespace, _class];
            NSMutableDictionary *_dict = [self namespacePass:_namespace_class];
            
            writeDict[_class] = _dict;
        }
        
        self.swigSymbols[_namespace] = writeDict;
    }
}

- (BOOL)functionExists:(NSString*)functionName className:(NSString*)className namespaceName:(NSString*)namespaceName
{
    if(self.swigSymbols[namespaceName])
    {
        if(self.swigSymbols[namespaceName][className])
        {
            NSArray *functionArray = self.swigSymbols[namespaceName][className][CDECL];
            for (NSString *func in functionArray)
            {
                if ([functionName isEqualToString:func])
                {
                    return YES;
                }
            }
        }
    }
    return NO;
}

- (void)parseXMLFile:(NSString*)file listOnly:(BOOL)listOnly
{
    self.b_listOnly = listOnly;
    
    self.classList = [[NSMutableArray alloc] init];
    
    NSData *data = [NSData dataWithContentsOfFile:[self createPathWithFile:file]];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    
    self.elementStack = [[NSMutableArray alloc] init];
    self.processedItems = [[NSMutableArray alloc] init];
    
    [self initParse];
    
    [parser parse];
    
    
    if (!self.b_listOnly)
    {
        [self createldoc];
        [self createstubs];
        [self createSublimeSnippets];
    }
}

- (NSArray*)getList
{
    return self.classList;
}

+ (NSString *)AddParserNotificationName
{
    return @"AddParserNotif";
}

+ (NSString *)EarthquakeResultsKey
{
    return @"EarthquakeResultsKey";
}

+ (NSString *)ParserErrorNotificationName
{
    return @"EarthquakeErrorNotif";
}

+ (NSString *)ParserMessageErrorKey
{
    return @"ParserMsgErrorKey";//516-803-2770 217110
}

- (void)initParse
{
//    self.b_compoundname = NO;
    self.b_inscope = NO;
    self.b_static = NO;
//    self.b_infunction = NO;
//    self.b_infunctiontype = NO;
//    self.b_infunctiontyperef = NO;
//    self.b_infunction_definition = NO;
//    self.b_inargsstring = NO;
//    self.b_infunction_name = NO;
//    self.b_inbriefdescription = NO;
//    self.b_ininbodydescription = NO;
}
#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict
{
    [self.elementStack addObject:elementName];
    NSUInteger stacksize = [self.elementStack count];
    
    self.currentAttribute = attributeDict;
    self.currentElement = elementName;
    
    
    if ([elementName isEqualToString:@"compounddef"])
    {
        /*
         kind="class" prot="public"
         */
        NSString *_id = attributeDict[@"id"];
        NSString *_kind = attributeDict[@"kind"];
        NSString *_prot = attributeDict[@"prot"];
        
        if ([_kind isEqualToString:@"class"] && [_prot isEqualToString:@"public"])
        {
            [self.classList addObject:_id];
        }
        
    }
    
    if (!self.b_listOnly)
    {
        if ([elementName isEqualToString:@"compoundname"])
        {
            self.compoundname = @"";
        }
        else if([elementName isEqualToString:@"sectiondef"])
        {
            NSString *scope = attributeDict[@"kind"];
            
            if ([scope isEqualToString:@"public-func"])
            {
                self.b_inscope = YES;
                self.b_static = NO;
            }
            else if ([scope isEqualToString:@"public-static-func"])
            {
                self.b_inscope = YES;
                self.b_static = YES;
            }
            
        }
        else if([elementName isEqualToString:@"memberdef"])
        {
            self.returnType = [[NSMutableDictionary alloc] init];
            self.functionParaArray = [[NSMutableArray alloc] init];
            self.functionParameterNameList = [[NSMutableArray alloc] init];
            self.functionParameterTypeList = [[NSMutableArray alloc] init];
        }
        else if([elementName isEqualToString:@"type"])
        {
            if(self.b_inscope)
            {
                if(stacksize == 5)
                {
                    self.returnType[@"type.value"] = @"";
                    self.returnType[@"ref.value"] = @"";
                    self.returnType[@"ref.kindref"] = @"";
                    self.returnType[@"ref.refid"] = @"";
                }
            }
        }
        else if([elementName isEqualToString:@"ref"])
        {
            if(self.b_inscope)
            {
                if(stacksize == 6)
                {
                    self.returnType[@"ref.refid"] = (attributeDict[@"refid"])?attributeDict[@"refid"]:@"";
                    self.returnType[@"ref.kindref"] = (attributeDict[@"kindref"])?attributeDict[@"kindref"]:@"";
                }
                if(stacksize == 7)
                {
                    self.currentFunctionParameterTypeDict[@"type.ref.refid"] = (attributeDict[@"refid"])?attributeDict[@"refid"]:@"";
                    self.currentFunctionParameterTypeDict[@"type.ref.kindref"] = (attributeDict[@"kindref"])?attributeDict[@"kindref"]:@"";
                }
            }
        }
        else if([elementName isEqualToString:@"definition"])
        {
            if(self.b_inscope)
            {
                if(stacksize == 5)
                {
                    self.functionDefinition = @"";
                }
            }
        }
        else if([elementName isEqualToString:@"argsstring"])
        {
            if(self.b_inscope)
            {
                if(stacksize == 5)
                {
                    self.functionArgmentString = @"";
                }
            }
        }
        else if([elementName isEqualToString:@"name"])
        {
            if(self.b_inscope)
            {
                if(stacksize == 5)
                {
                    self.functionName = @"";
                }
            }
        }
        else if([elementName isEqualToString:@"param"])
        {
            if (self.b_inscope)
            {
                if(stacksize == 5)
                {
                    self.currentFunctionParameterTypeDict = [[NSMutableDictionary alloc] init];
                    
                    self.currentFunctionParameterTypeDict[@"type.value"] = @"";
                    self.currentFunctionParameterTypeDict[@"type.ref.value"] = @"";
                    self.currentFunctionParameterTypeDict[@"type.ref.kindref"] = @"";
                    self.currentFunctionParameterTypeDict[@"type.ref.refid"] = @"";
                    
                    self.currentFunctionParameterTypeDict[@"declname"] = @"";
                    
                    self.currentFunctionParameterTypeDict[@"defval.value"] = @"";
                    self.currentFunctionParameterTypeDict[@"defval.ref.value"] = @"";
                    self.currentFunctionParameterTypeDict[@"defval.ref.kindref"] = @"";
                    self.currentFunctionParameterTypeDict[@"defval.ref.refid"] = @"";
                }
            }
        }
        else if([elementName isEqualToString:@"declname"])
        {
            
        }
        else if([elementName isEqualToString:@"defval"])
        {
            
        }
        else if([elementName isEqualToString:@"briefdescription"])
        {
            if(self.b_inscope)
            {
                if(stacksize == 5)
                {
                    self.functionBriefDescription = @"";
                }
            }
        }
        else if([elementName isEqualToString:@"detaileddescription"])
        {
            
        }
        else if([elementName isEqualToString:@"para"])
        {
            if(self.b_inscope)
            {
                if(stacksize == 6)
                {
                    self.currentFunctionPara = @"";
                }
                if(stacksize == 8)
                {
                    self.functionReturnDescription = @"";
                    self.functionAuthor = @"";
                }
            }
            
        }
        else if([elementName isEqualToString:@"parameterlist"])
        {
            
        }
        else if([elementName isEqualToString:@"parameteritem"])
        {
            if (self.b_inscope)
            {
                if(stacksize == 8)
                {
                    self.currentFunctionParameterNameDict = [[NSMutableDictionary alloc] init];
                    self.currentFunctionParameterNameDict[@"name"] = @"";
                    self.currentFunctionParameterNameDict[@"description"] = @"";
                }
            }
        }
        else if([elementName isEqualToString:@"parameternamelist"])
        {
            
        }
        else if([elementName isEqualToString:@"parametername"])
        {
            
        }
        else if([elementName isEqualToString:@"parameterdescription"])
        {
            
        }
        else if([elementName isEqualToString:@"inbodydescription"])
        {
            if(self.b_inscope)
            {
                if(stacksize == 5)
                {
                    self.functionInbodydescription = @"";
                }
            }
        }
        else if([elementName isEqualToString:@"location"])
        {
            if(self.b_inscope)
            {
                if(stacksize == 5)
                {
                    self.functionLocation = attributeDict;
                }
            }
        }
        else if([elementName isEqualToString:@"simplesect"])
        {
            if([attributeDict[@"kind"] isEqualToString:@"author"])
            {
                self.b_inauthor = YES;
                self.b_returnDescription = NO;
            }
            else if([attributeDict[@"kind"] isEqualToString:@"return"])
            {
                self.b_inauthor = NO;
                self.b_returnDescription = YES;
            }
        }
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    NSUInteger stacksize = [self.elementStack count];
    
    if ([elementName isEqualToString:self.elementStack.lastObject]) {
        // they match, remove it
        [self.elementStack removeLastObject];
    }
    else {
        // they don't match, we have malformed XML
        NSLog(@"could not find end element of \"%@\"", elementName);
        [self.elementStack removeAllObjects];
        [parser abortParsing];
    }
    
    if (!self.b_listOnly)
    {
        if ([elementName isEqualToString:@"compoundname"])
        {
            
        }
        else if([elementName isEqualToString:@"sectiondef"])
        {
            
        }
        else if([elementName isEqualToString:@"memberdef"])
        {
            if (self.b_inscope)
            {
                BOOL shouldAdd = YES;
                
                NSString *classname = [self trimPCDATA:self.compoundname];
                NSString *_namespace = @"";
                NSArray *chunks = [self.compoundname componentsSeparatedByString: @"::"];
                if ([chunks count] >= 2)
                {
                    _namespace = [self trimPCDATA:[chunks objectAtIndex:0] ];
                    classname = [self trimPCDATA:[chunks objectAtIndex:1]];
                }
                
                self.returnType[@"type.value"]  = [self trimPCDATA:self.returnType[@"type.value"]];
                self.returnType[@"ref.value"]   = [self trimPCDATA:self.returnType[@"ref.value"]];
                self.returnType[@"ref.kindref"] = [self trimPCDATA:self.returnType[@"ref.kindref"]];
                self.returnType[@"ref.refid"]   = [self trimPCDATA:self.returnType[@"ref.refid"]];
                
                self.functionDefinition = [self trimPCDATA:self.functionDefinition];
                
                self.functionArgmentString = [self trimPCDATA:self.functionArgmentString];
                
                self.functionName = [self trimPCDATA:self.functionName];
                
                NSArray *fnchunks = [self.functionName componentsSeparatedByString: @" "];
                if ([fnchunks count] > 1)
                {
                    self.functionName = [fnchunks objectAtIndex:1];
                    self.functionName = [self trimPCDATA:self.functionName];
                    fnchunks = [self.functionName componentsSeparatedByString: @"::"];
                    if ([fnchunks count] > 1)
                    {
                        shouldAdd = NO;
                    }
                }
                
                if ([self.functionName rangeOfString:@"~"].location != NSNotFound)
                {
                    shouldAdd = NO;
                }
                
                self.functionBriefDescription = [self trimPCDATA:self.functionBriefDescription];
                self.functionBriefDescription = [self fixMultiline:self.functionBriefDescription];
                if ([self.functionBriefDescription isEqualToString:@""])
                {
                    self.functionBriefDescription = @"Brief description.";
                }
                
                self.functionInbodydescription = [self trimPCDATA:self.functionInbodydescription];
                self.functionInbodydescription = [self fixMultiline:self.functionInbodydescription];
                
                self.functionReturnDescription = [self trimPCDATA:self.functionReturnDescription];
                self.functionReturnDescription = [self fixMultiline:self.functionReturnDescription];
                
                self.functionAuthor = [self trimPCDATA:self.functionAuthor];
                
                NSMutableArray *parameters = [[NSMutableArray alloc] init];
                
                for (NSDictionary *param in self.functionParameterNameList)
                {
                    NSMutableDictionary *_param = [[NSMutableDictionary alloc] init];
                    
                    _param[@"name"] = param[@"name"];
                    _param[@"description"] = [self fixMultiline:param[@"description"]];
                    _param[@"type"] = @"";
                    _param[@"defaultValue"] = @"";
                    
                    for (NSDictionary *paramType in self.functionParameterTypeList)
                    {
                        if ([_param[@"name"] isEqualToString:paramType[@"declname"]])
                        {
                            _param[@"type"] = paramType[@"type.value"];
                        }
                    }
                    [parameters addObject:_param];
                }
                
                NSDictionary *item = @{@"returnType" : self.returnType,
                                       @"functionDefinition" : self.functionDefinition,
                                       @"functionArgmentString" : self.functionArgmentString,
                                       @"functionName" : self.functionName,
                                       @"functionBriefDescription" : self.functionBriefDescription,
                                       @"functionInbodydescription" : self.functionInbodydescription,
                                       @"functionLocation" : self.functionLocation,
                                       @"functionParaArray" : self.functionParaArray,
                                       //                                   @"functionParameterNameList" : self.functionParameterNameList,
                                       //                                   @"functionParameterTypeList" : self.functionParameterTypeList,
                                       @"functionReturnDescription" : self.functionReturnDescription,
                                       @"functionParameters" : parameters,
                                       @"classname" : classname,
                                       @"namespace" : _namespace,
                                       @"functionAuthor" : self.functionAuthor,
                                       @"static" : [NSNumber numberWithBool:self.b_static]};
                
                if(shouldAdd)
                    [self.processedItems addObject:item];
            }
        }
        else if([elementName isEqualToString:@"type"])
        {
        }
        else if([elementName isEqualToString:@"ref"])
        {
            
        }
        else if([elementName isEqualToString:@"definition"])
        {
            
        }
        else if([elementName isEqualToString:@"argsstring"])
        {
            
        }
        else if([elementName isEqualToString:@"name"])
        {
            
        }
        else if([elementName isEqualToString:@"param"])
        {
            if (self.b_inscope)
            {
                if(self.currentFunctionParameterTypeDict)
                    [self.functionParameterTypeList addObject:self.currentFunctionParameterTypeDict];
            }
        }
        else if([elementName isEqualToString:@"declname"])
        {
            
        }
        else if([elementName isEqualToString:@"defval"])
        {
            
        }
        else if([elementName isEqualToString:@"briefdescription"])
        {
            
        }
        else if([elementName isEqualToString:@"detaileddescription"])
        {
            
        }
        else if([elementName isEqualToString:@"para"])
        {
            if (self.b_inscope)
            {
                self.currentFunctionPara = [self trimPCDATA:self.currentFunctionPara];
                if (![self.currentFunctionPara isEqualToString:@""])
                {
                    [self.functionParaArray addObject:self.currentFunctionPara];
                }
                
                if(stacksize == 10)
                {
                    self.currentFunctionParameterNameDict[@"description"] = [self trimPCDATA:self.currentFunctionParameterNameDict[@"description"]];
                }
            }
        }
        else if([elementName isEqualToString:@"parameterlist"])
        {
            
        }
        else if([elementName isEqualToString:@"parameteritem"])
        {
            if(self.b_inscope)
            {
                if(self.currentFunctionParameterNameDict)
                    [self.functionParameterNameList addObject:self.currentFunctionParameterNameDict];
            }
        }
        else if([elementName isEqualToString:@"parameternamelist"])
        {
            
        }
        else if([elementName isEqualToString:@"parametername"])
        {
            if (self.b_inscope)
            {
                if(stacksize == 10)
                {
                    self.currentFunctionParameterNameDict[@"name"] = [self trimPCDATA:self.currentFunctionParameterNameDict[@"name"]];
                }
            }
        }
        else if([elementName isEqualToString:@"parameterdescription"])
        {
            
        }
        
        else if([elementName isEqualToString:@"inbodydescription"])
        {
            
        }
        else if([elementName isEqualToString:@"location"])
        {
            
        }
        else if([elementName isEqualToString:@"simplesect"])
        {
            self.b_inauthor = NO;
            self.b_returnDescription = NO;
        }
    }
}




/**
 This method is called by the parser when it find parsed character data ("PCDATA") in an element. The parser is not guaranteed to deliver all of the parsed character data for an element in a single invocation, so it is necessary to accumulate character data until the end of the element is reached.
 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
//    NSString *prompt = @"In the return type of the function";
//    NSLog(@"\n%@%@", prompt,
//          @{@"currentElement" : self.currentElement,
//            @"stacksize" : [NSNumber numberWithInteger:stacksize],
//            @"currentAttribute" : (self.currentAttribute == nil)?@"":self.currentAttribute,
//            @"string" : string});
//    
    NSUInteger stacksize = [self.elementStack count];
    
    if (!self.b_listOnly)
    {
        if ([self.currentElement isEqualToString:@"compoundname"])
        {
            self.compoundname = [self assemblePCDATA:self.compoundname newString:string];
        }
        
        if (self.b_inscope)
        {
            if(stacksize == 4 && [self.currentElement isEqualToString:@"memberdef"])
            {
                
            }
            
            if([self.currentElement isEqualToString:@"type"])
            {
                if(stacksize == 5)
                {
                    self.returnType[@"type.value"] = [self assemblePCDATA:self.returnType[@"type.value"] newString:string];
                }
                else if (stacksize == 6)
                {
                    self.currentFunctionParameterTypeDict[@"type.value"] = [self assemblePCDATA:self.currentFunctionParameterTypeDict[@"type.value"] newString:string];
                }
            }
            
            if([self.currentElement isEqualToString:@"ref"])
            {
                if(stacksize == 6)
                {
                    self.returnType[@"ref.value"] = [self assemblePCDATA:self.returnType[@"ref.value"] newString:string];
                }
                else if(stacksize == 7)
                {
                    self.currentFunctionParameterTypeDict[@"type.ref.value"] = [self assemblePCDATA:self.currentFunctionParameterTypeDict[@"type.ref.value"] newString:string];
                }
                
                
            }
            
            if([self.currentElement isEqualToString:@"definition"])
            {
                if(stacksize == 5)
                {
                    self.functionDefinition = [self assemblePCDATA:self.functionDefinition newString:string];
                }
            }
            
            else if([self.currentElement isEqualToString:@"argsstring"])
            {
                if(stacksize == 5)
                {
                    self.functionArgmentString = [self assemblePCDATA:self.functionArgmentString newString:string];
                }
            }
            else if([self.currentElement isEqualToString:@"name"])
            {
                if(stacksize == 5)
                {
                    self.functionName = [self assemblePCDATA:self.functionName newString:string];
                }
            }
            else if([self.currentElement isEqualToString:@"briefdescription"])
            {
                if(stacksize == 5)
                {
                    self.functionBriefDescription = [self assemblePCDATA:self.functionBriefDescription newString:string];
                }
            }
            else if([self.currentElement isEqualToString:@"inbodydescription"])
            {
                if(stacksize == 5)
                {
                    self.functionInbodydescription = [self assemblePCDATA:self.functionInbodydescription newString:string];
                }
            }
            else if([self.currentElement isEqualToString:@"location"])
            {
                
            }
            else if([self.currentElement isEqualToString:@"para"])
            {
                if(stacksize == 6)
                {
                    self.currentFunctionPara = [self assemblePCDATA:self.currentFunctionPara newString:string];
                }
                else if(stacksize == 10)
                {
                    self.currentFunctionParameterNameDict[@"description"] = [self assemblePCDATA:self.currentFunctionParameterNameDict[@"description"]newString:string];
                }
                else if(stacksize == 8)
                {
                    if (self.b_returnDescription)
                    {
                        self.functionReturnDescription = [self assemblePCDATA:self.functionReturnDescription newString:string];
                    }
                    if (self.b_inauthor)
                    {
                        self.functionAuthor = [self assemblePCDATA:self.functionAuthor newString:string];
                    }
                    
                }
            }
            else if([self.currentElement isEqualToString:@"parametername"])
            {
                if(stacksize == 10)
                {
                    self.currentFunctionParameterNameDict[@"name"] = [self assemblePCDATA:self.currentFunctionParameterNameDict[@"name"]newString:string];
                }
            }
            
            else if([self.currentElement isEqualToString:@"declname"])
            {
                if (stacksize == 6)
                {
                    self.currentFunctionParameterTypeDict[@"declname"] = [self assemblePCDATA:self.currentFunctionParameterTypeDict[@"declname"] newString:string];
                }
            }
        }
    }
}

/**
 An error occurred while parsing the earthquake data: post the error as an NSNotification to our app delegate.
 */
- (void)handleParserError:(NSError *)parseError {
    
    assert([NSThread isMainThread]);
    [[NSNotificationCenter defaultCenter] postNotificationName:Parser.ParserErrorNotificationName
                                                        object:self
                                                      userInfo:@{Parser.ParserMessageErrorKey: parseError}];
}

/**
 An error occurred while parsing the earthquake data, pass the error to the main thread for handling.
 (Note: don't report an error if we aborted the parse due to a max limit of earthquakes.)
 */
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
    if (parseError.code != NSXMLParserDelegateAbortedParseError && !self.didAbortParsing) {
        [self performSelectorOnMainThread:@selector(handleParserError:) withObject:parseError waitUntilDone:NO];
    }
}
@end
