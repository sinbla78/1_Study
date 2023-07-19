// SPDX-License-Indenfier: GPL-3.0
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract Variables{
    // 변수
    // 1. local(지역변수) : 함수 안에 선언됨 -> 블록체인에 기록 X
    // 2. State(상태변수) : 함수 밖에 선언됨 -> 블록체인에 기록 O
    // 3. Global(전역변수) : 블록체인에 관한 정보를 제공
    
    string public text = "Hello";
    uint public num = 123;
    uint public timestamp = block.timestamp; // 현재 블록의 타임 스탬프를 가져옴
    address public sender = msg.sender; // 호출자의 주소를 가져옴
    function doSomething() public {
        // 지역변수는 블록체인에 기록되지 않음
        // 배포되는 순간 함수의 기능에 기록되는데, 변수 자체가 블록체인에 기록되진 않음
        uint i = 256;
    }
    
}
