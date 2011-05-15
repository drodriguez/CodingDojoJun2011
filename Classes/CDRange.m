/*
 *  CDRange.m
 *  CodingDojo
 */

#import "CDRange.h"

CDRange CDMakeRange(NSUInteger location, NSUInteger length)
{
  CDRange range;
  range.location = location;
  range.length = length;
  return range;
}

NSUInteger CDMaxRange(CDRange range)
{
  return range.location + range.length;
}

BOOL CDEqualRanges(CDRange range1, CDRange range2)
{
  return (range1.location == range2.location &&
          range2.length == range2.length);
}

BOOL CDLocationInRange(NSUInteger location, CDRange range)
{
  return (location >= range.location &&
          location < range.location + range.length);
}

NSString *CDStringFromRange(CDRange range)
{
  return [NSString stringWithFormat:@"{%u, %u}", range.location, range.length];
}
