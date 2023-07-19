// SPDX-License-Identifier: GPL 3.0
pragma solidity ^0.8.13;
contract Example {
    uint public num;
    // 1. 상태변수를 업데이트 함 - 가스비가 소모(블록체인에 기록)
    function set(uint _num) public{
        num = _num;
    }
    
    // 2. 상태변수를 읽는 것 - 가스비가 소모되지 않음 (view)
    function get() public view returns(uint){
        return num;
    }
}
