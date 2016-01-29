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

struct Banana {
    var peeled = false
    
    func peel() {
        self.peeled = true
    }
}


class CoreNotesTests: QuickSpec {
    
    override func spec() {
        
        describe("A Banana") {
            
            it("Is is tasty if it is peeled."){
                
                let banana = Banana()
                
                banana.peel()
                expect(banana.peeled).to(beTrue())
               
            }
        }
    }
}



