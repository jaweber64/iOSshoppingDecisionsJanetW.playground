//: Playground - noun: a place where people can play

// Janet Weber    DUE: 9/21/15
// Flow: Critical Thinking Exercise (Week 5)
//   Assignment: Simulate some type of decision making process
//
// This program uses mostly if else flow control to decide if
//  a clothing purchase should be made.  The decision is based
//  on many criteria (If item is for you: is item needed, is it
//  in season, is it on sale (how much off)?, do you already 
//  own similar, AND if the item is a gift: is it on sale (how
//  much off?), is it a perfect gift or just marginal, and how
//  pressed for time are you to get this gift.  This is kind of
//  the process I go through in my head on a typical trip to
//  Kohl's
//
// /Users/markweber/Desktop/MCC-Mom/iOS Swift Programming/shoppingDecision.swf

import UIKit
//**********************************************************
// Declare variable and constants
//**********************************************************
// Constants setting the discount boundaries
let ONLY_10_PERCENT = 0  // indicates a discount of less than
                         //    10%
let SECOND_RATE = 1      // indicates a discount over 10%, but 
                         //    less than 25%
let SIGNIFICANT = 2      // indicates a discount over 25%, but
                         //    less than 50%
let RARE = 3             // indicates a discount over 50%

// string variables
var msg1 : String = ""   // holds secondary output (item characteristic) message
var msg : String = ""    // holds primary decision message
var item : String = "black pants" // holds item up for purchase

// boolean variables               // change these to change item characteristics
var onSale : Bool = true         // item on sale?
var forYou : Bool = false          // item for you? (or gift)
var needed : Bool = false          // item a need? (or want)
var inSeason: Bool = false          // item in Season?
var ownSimilar: Bool = false        // already own similar?
var buyingToday : Bool = false      // holds purchase recommendation
var perfectGift : Bool = false      // perfect gift? (or marginal)
var pressedForTime : Bool = false   // need it now?

// integer variable
var discount : Int = SECOND_RATE  // holds type of discount from
                                  //  constants above

//*********************************************************
//MAIN SHOPPING DECISION FLOW:
//*********************************************************
if (onSale) {                                       // Item is on sale so proceed to next criteria
    if (forYou){                                        // Item is for you so proceed to next criteria
        if (needed){                                        // Item is needed so procced to next criteria
            if (discount != ONLY_10_PERCENT){                           // Discount is enough so buy
                buyingToday = true
                msg = "Item needed - EXCELLENT discount!"
            } else {                                                    // discount not enough so wait
                buyingToday = false
                msg = "Item needed, but you can do better"
            }  // end of if (discount)
        } else {       // item is not needed
            msg = "Item not needed, "                                   // begin msg string (append below)
            if (inSeason) && (!ownSimilar) {                            // Item in season and unique
                if (discount == SIGNIFICANT || discount == RARE){           // discount enough, buy
                    buyingToday = true
                    msg = msg + "but is in season and unique " +
                          "to your wardrobe. Excellent discount"
                } else {                                                    // discount not enough, wait.    
                     buyingToday = false
                     msg = msg + "but is in season and unique " +
                                 "to your wardrobe.  Discount is NOT ENOUGH"
                }
            } else if (!inSeason) && (ownSimilar){                      // Item not in season and not unique
                buyingToday = false                                     //     so wait
                msg = msg + "out of season, and not unique to " +
                            "your wardrobe."
            } else {                                                    // Item either in season or unique, not both
                if (discount == RARE) {                                     // Discount is enough, buy
                    buyingToday = true
                    if (inSeason) {
                        msg = msg + "and not unique to your wardrobe, " +
                            "but in season and the discount is excellent!"
                    } else {
                        msg = msg + "and not in season, but is unique " +
                            "to your wardrobe and the discount is excellent!"
                    } // end of if (inSeason)
                } else {                                                    // Discount not enough, wait
                    buyingToday = false
                    msg = msg + "and either not in season or not unique " +
                            "to your wardrobe. The discount is NOT ENOUGH."
                }   // end of if (discount == RARE)
            }       // end of if (inSeason)
        }           // end of if (needed)
        
    } else {                                            // Item is not for you - it is a gift
        if (pressedForTime){                                // Time requires you to purchase
            buyingToday = true
            msg = "You're out of time to find something better"
        } else {                                            // You are not pressed for time
            if (perfectGift) {                                  // The gift is perfect
                if (discount != ONLY_10_PERCENT) {                  // discount enough, buy!
                    buyingToday = true
                    msg = "Perfect gift. Discount is enough"
                } else {                                            // discount not enough, wait
                    buyingToday = false
                    msg = "Perfect gift. Hardly any discount."
                }
            } else {                                            // The gift is marginal (not that perfect gift)
                if (discount == SIGNIFICANT || discount == RARE){
                    buyingToday = true                              // The discount is enough so buy
                    msg = "Gift idea marginal, but this is a great deal!"
                } else {
                    buyingToday = false                             // No good deal. Wait.
                    msg = "Gift idea only marginal and you have time to look for a better deal."
                }   // end of if discount(SIGNIFICANT or RARE)
            }       // end of if (perfectGift)
        }           // end of if (pressedForTime)
    }               // end of if (forYou)
    
} else {                                // Item is NOT on sale so don't buy it
    buyingToday = false
    msg = "NOT ON SALE! Don't even think about it!"
}   // end of if (onSale)

// *****************************************************
// Output section: 
// Some of the println() statements are commented out to make the 
//    playground display at right easier to read.
// *****************************************************
// First, display potential purchase item, if it is on sale and if so,
//    the discount
println("Item up for consideration: " + item)
if (onSale) {
    println("The item IS on sale.")
    switch (discount){
    case ONLY_10_PERCENT : println(" But only 10% discount!")
    case SECOND_RATE : println(" Standard 10%-25% discount.")
    case SIGNIFICANT : println(" Great 25%-50% discount!!!")
    case RARE : println(" Awesome! Over 50% off!!!!!!")
    default : println("ERROR")
    }
} else {println("The item is NOT on sale.")}

// Second, display if item is for you or a gift and the item's current characteristics.
//    Reminder: println statements are commented to make playground easier to read at right
if (forYou) {
    //println("The item is for YOU!")
    msg1 = needed ? "Item is needed" : "Item is NOT needed"
    //println("\(msg1)")
    msg1 = inSeason ? "Item is in season." : "Item is NOT in season"
    //println("\(msg1)")
    msg1 = ownSimilar ? "You already own similar item" :
                        "Item is unique in your wardrobe"
    //println("\(msg1)")
} else {
    println("The item is a gift.")
    msg1 = perfectGift ? "The gift is PERFECT" :"The gift will do - marginal."
    //println("\(msg1)")
    msg1 = pressedForTime ? "Out of time to look further" :
                            "You are NOT pressed for time"
    //println("\(msg1)")
}

// display final decision: approval or decline along with reasons
println("******************************************")
msg1 = buyingToday ? "Purchase approved!" : "Purchase DECLINED."
//println("\(msg1)")
println("\(msg)")

// DONE *************************************************
