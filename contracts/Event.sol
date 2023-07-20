// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract Example{
    //이밴트(event) -> dapp에서 활용
    //블록체인에 기록을 남기는 수단, 비용이 조금 저렴하다.
    //indexed 파라미터 3개까지 가능하다.
    //이밴트 정의
    event Log(address indexed sender, string message);
    event AnotherLog();
    //함수에서 사용
    function test() public {
        emit Log(msg.sender, "Hello World");
        emit Log(msg.sender, "Hello EM");
        emit AnotherLog();
    }
}
