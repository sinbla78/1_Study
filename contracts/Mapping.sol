// SPDX-License-Identifier: GPL 3.0

pragma solidity ^0.8.13;
contract Example {
    //매핑(mapping)
    //key type               -> value type(다른 맵핑, 배열, 구조체..)
    //(모든 값) - int, bytes, string, contract address)
    //반복 안된다.
    mapping(address => uint) public myMap;
    function set(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }
    function get(address _addr) public view returns (uint) {
        return myMap[_addr];
    }
    function remove(address _addr) public {
        delete  myMap[_addr];
    }
}
