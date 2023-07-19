// SPDX-License-Indenfier: GPL-3.0;
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract DataType{
    // uint(unsigned Integer)
    // uint8~uint256
    uint8 public u8=1;
    uint public u256=1;
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123;
    int public minInt=type(int).min;
    int public maxInt=type(int).max;
    
    // Address Type
    // 주소 타입, 20byte(160비트) 자료형
    // ContractAddress(계약 계정), EOA(External Owned Address)외부 소유 계정
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // bytes 타입
    bytes1 public a = 0x5b;
    bytes1 public b = 0x56;

    //default Value
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x00000...00
}
