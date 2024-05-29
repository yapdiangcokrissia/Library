// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Library {
    address public owner;
    uint public membershipFee;
    uint public maxBooksPerMember;
    mapping(address => bool) public members;
    mapping(address => uint) public borrowedBooks;

    event MemberRegistered(address member);
    event BookBorrowed(address member, uint numberOfBooks);
    event BookReturned(address member, uint numberOfBooks);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    modifier onlyMembers() {
        require(members[msg.sender], "Only members can perform this action.");
        _;
    }

    constructor(uint _membershipFee, uint _maxBooksPerMember) {
        owner = msg.sender;
        membershipFee = _membershipFee;
        maxBooksPerMember = _maxBooksPerMember;
    }

    function register() public payable {
        require(msg.value == membershipFee, "Incorrect membership fee.");
        require(!members[msg.sender], "Already a member.");
        
        members[msg.sender] = true;
        emit MemberRegistered(msg.sender);
    }

    function borrowBook(uint _numberOfBooks) public onlyMembers {
        require(_numberOfBooks > 0, "Must borrow at least one book.");
        require(borrowedBooks[msg.sender] + _numberOfBooks <= maxBooksPerMember, "Exceeds maximum allowed books.");

        borrowedBooks[msg.sender] += _numberOfBooks;
        emit BookBorrowed(msg.sender, _numberOfBooks);
    }

    function returnBook(uint _numberOfBooks) public onlyMembers {
        require(_numberOfBooks > 0, "Must return at least one book.");
        require(borrowedBooks[msg.sender] >= _numberOfBooks, "You cannot return more books than you have borrowed.");

        borrowedBooks[msg.sender] -= _numberOfBooks;
        emit BookReturned(msg.sender, _numberOfBooks);
    }

    function updateMembershipFee(uint _newFee) public onlyOwner {
        require(_newFee > 0, "Membership fee must be greater than zero.");
        
        membershipFee = _newFee;
    }

    function testAssertions() public pure {
        uint a = 10;
        uint b = 20;
        uint sum = a + b;
        assert(sum == 30); // This should never fail

        if (sum != 30) {
            revert("Assertion failed: sum should be equal to 30");
        }
    }
}
