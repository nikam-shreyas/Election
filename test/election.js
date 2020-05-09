var Election = artifacts.require("./Election.sol");

contract("Election",function(accounts) {
    var electionInstance;
    it("Initializes 2 candidates", function(){
        return Election.deployed().then(function(instance){
            return instance.candidatesCount();
        }).then(function(count){
            assert.equal(count,2);
        });
    });

    it("Initialized with proper values",function(){
        return Election.deployed().then(function(instance){
            electionInstance = instance;
            return electionInstance.candidates(1);

        }).then(function(candidate){
            assert.equal(candidate[0],1,"Id is correct");
            assert.equal(candidate[1],"Candidate 1","Name is correct");
            assert.equal(candidate[2],0,"Votes Count is correct");
            return electionInstance.candidates(2);
        }).then(function(candidate){
            assert.equal(candidate[0],2,"Id is correct");
            assert.equal(candidate[1],"Candidate 2","Name is correct");
            assert.equal(candidate[2],0,"Votes Count is correct");
        });
    });
});

