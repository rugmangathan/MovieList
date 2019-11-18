// MARK: - Mocks generated from file: MovieListTests/MovieDB/SpyableMovieListAction.swift at 2019-11-18 17:09:54 +0000

//
//  SpyableMovieListAction.swift
//  MovieListTests
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import Cuckoo
@testable import MovieList

import MovieList


 class MockSpyableMovieListAction: SpyableMovieListAction, Cuckoo.ClassMock {
    
     typealias MocksType = SpyableMovieListAction
    
     typealias Stubbing = __StubbingProxy_SpyableMovieListAction
     typealias Verification = __VerificationProxy_SpyableMovieListAction

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: SpyableMovieListAction?

     func enableDefaultImplementation(_ stub: SpyableMovieListAction) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func fetchMovies()  {
        
    return cuckoo_manager.call("fetchMovies()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.fetchMovies()
                ,
            defaultCall: __defaultImplStub!.fetchMovies())
        
    }
    

	 struct __StubbingProxy_SpyableMovieListAction: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchMovies() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockSpyableMovieListAction.self, method: "fetchMovies()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SpyableMovieListAction: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchMovies() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchMovies()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SpyableMovieListActionStub: SpyableMovieListAction {
    

    

    
     override func fetchMovies()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

