// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract Example{
    //함수 수정자(modifier)
    //함수 호출하기 전에 싱행할 수 있는 코드
    address public owner;
    uint public x=10;
    bool public locked;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner");
        _;
    }

    function sendEther() public onlyOwner {
        //코드 작성..
        //
    }
    modifier validAdress(address _addr){
        require(_addr != address(0), "Not valid address");
        _;
    }
    //Owner 변경 코드
    function changeOwner(address _newOwner) public validAdress(_newOwner) {
        owner = _newOwner;
    }
    
}
