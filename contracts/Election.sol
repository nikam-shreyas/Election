pragma solidity >=0.4.25;

contract Election{
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    mapping(uint=>Candidate) public candidates;
    uint public candidatesCount;
    constructor() public{
        addCandidates("Candidate 1");
        addCandidates("Candidate 2");
        
    }

    function addCandidates(string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }
}