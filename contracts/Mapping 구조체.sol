// SPDX-License-Identifier: GPL 3.0

pragma solidity ^0.8.13;
contract Example {
    mapping(uint => string) public names;
    mapping (uint => Book) public books;
    struct Book{
        string tittle;
        string author;
    }
    function addBook(uint _id, string memory _tittle, string memory _author) public {
        books[_id] = Book(_tittle, _author);
    }
}
//---------------------------------------------------------------------------------------------------------------------------------------------------
// SPDX-License-Identifier: GPL 3.0

pragma solidity ^0.8.13;
contract Example {
    //mapping (uint => Book) public books;
    mapping(address => mapping(uint => Book)) public myBooks;
    struct Book{
        string tittle;
        string author;
    }
    function addBook(uint _id, string memory _tittle, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_tittle, _author);
    }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------
// SPDX-License-Identifier: GPL 3.0

pragma solidity ^0.8.13;
contract Example {
    //mapping (uint => Book) public books;
    mapping(address => mapping(uint => Book)) public myBooks;
    struct Book{
        string tittle;
        string author;
    }
    function addmyBook(uint _id, string memory _tittle, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_tittle, _author);
    }
    function myaddressdelete (address _add, uint _id) public{
        delete myBooks[_add][_id];
    }
}
