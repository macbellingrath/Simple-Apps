//
//  CoreNotesTests.swift
//  CoreNotesTests
//
//  Created by Mac Bellingrath on 11/16/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import Nimble
import Quick

@testable import CoreNotes

class CoreNotesTests: QuickSpec {
    
    override func spec() {
        
        describe("A category") {
            
            it("Is accessible after it is created."){
                
                let newCategory = Category.category()
                newCategory?.name = "Dolphin"
                newCategory?.color = UIColor.capeCodColor()
                
                expect(newCategory?.valueForKey("name") as? String).to(equal("Dolphin"))
            }
        }
    }
}



