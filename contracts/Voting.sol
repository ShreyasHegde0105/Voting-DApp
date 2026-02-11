// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    // ---- STRUCTURES ----
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    struct Voter {
        bool isRegistered;
        bool hasVoted;
    }

    // ---- STATE VARIABLES ----
    address public admin;
    uint256 public candidateCount;

    mapping(uint256 => Candidate) public candidates;
    mapping(address => Voter) public voters;

    // ---- EVENTS ----
    event Voted(address indexed voter, uint256 candidateId);
    event CandidateAdded(uint256 id, string name);

    // ---- CONSTRUCTOR ----
    constructor() {
        admin = msg.sender; // the person who deploys is admin
    }

    // ---- MODIFIER ----
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    // ---- FUNCTIONS ----

    // Add a candidate (only admin)
    function addCandidate(string memory _name) public onlyAdmin {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
        emit CandidateAdded(candidateCount, _name);
    }

    // Register a voter (only admin for now)
    function registerVoter(address _voter) public onlyAdmin {
        voters[_voter] = Voter(true, false);
    }

    // Vote function
    function vote(uint256 _candidateId) public {
        require(voters[msg.sender].isRegistered, "You are not registered");
        require(!voters[msg.sender].hasVoted, "You have already voted");
        require(_candidateId > 0 && _candidateId <= candidateCount, "Invalid candidate");

        voters[msg.sender].hasVoted = true;
        candidates[_candidateId].voteCount++;

        emit Voted(msg.sender, _candidateId);
    }

    // Get candidate votes
    function getVotes(uint256 _candidateId) public view returns (uint256) {
        require(_candidateId > 0 && _candidateId <= candidateCount, "Invalid candidate");
        return candidates[_candidateId].voteCount;
    }
}
