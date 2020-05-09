pragma solidity >=0.4.25;

contract Election{
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    event votedEvent(uint indexed _candidateId);
    mapping(uint=>Candidate) public candidates;
    mapping(address=>bool) public voters;
    uint public candidatesCount;
    constructor() public{
        addCandidates("Candidate 1");
        addCandidates("Candidate 2");
    }

    function addCandidates(string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }

    function vote(uint _candidateId) public {
        require(!voters[msg.sender],"Already Voted!");
        require(_candidateId>0 && _candidateId<=candidatesCount,"Invalid Candidate");
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;
        emit votedEvent(_candidateId);
    }
}
