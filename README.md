# Library 

## Description
This Solidity smart contract, named `Library`, manages a library system where users can register as members, borrow books, return books, and update membership fees. It also includes functions to test assertions.

## Contract Details
- `owner`: The address of the contract owner who has special privileges.
- `membershipFee`: The fee required for becoming a member.
- `maxBooksPerMember`: The maximum number of books a member can borrow.
- `members`: A mapping of addresses to track registered members.
- `borrowedBooks`: A mapping of addresses to track the number of books borrowed by each member.

## Events
- `MemberRegistered`: Fired when a new member is successfully registered.
- `BookBorrowed`: Fired when a member borrows one or more books.
- `BookReturned`: Fired when a member returns one or more books.

## Modifiers
- `onlyOwner`: Restricts functions to be called only by the contract owner.
- `onlyMembers`: Restricts functions to be called only by registered members.

## Functions
1. `constructor`: Initializes the contract with the membership fee and maximum books per member.
2. `register`: Allows an address to become a member by paying the membership fee.
3. `borrowBook`: Allows members to borrow books, respecting the maximum limit.
4. `returnBook`: Allows members to return books they have borrowed.
5. `updateMembershipFee`: Allows the owner to update the membership fee.
6. `testAssertions`: A function to test assertions.

## Usage
1. Deploy the contract on Remix.
2. Set the initial membership fee and maximum books per member.
3. Users can register as members by calling the `register` function and paying the membership fee.
4. Registered members can borrow books using the `borrowBook` function and return them using the `returnBook` function.
5. The owner can update the membership fee using the `updateMembershipFee` function.

## Testing
1. After deployment, use the Remix IDE's testing feature to simulate transactions.
2. Ensure that members can register, borrow books, return books, and that membership fee updates work correctly.
3. Use the `testAssertions` function to verify that assertions are functioning as expected.

## License
This contract is licensed under the MIT License.
