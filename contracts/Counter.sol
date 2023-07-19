// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract Counter{
    // 1. 상태 변수 (블록체인에 기록되는 데이터)
    uint public count;

    // 2. 함수 정의
    function increment() public {
        count++;
    }

    function ManyIncrement() public {
        for (int i = 0; i < 100; i++)
        {
            count++;
        }
    }
}
