// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract Constant {
    // 상수(constant)
    // 수정될 수 없는 변수
    // 가스 비용 절약 가능 - 수정할 필요가 없는 값을 상수로 선언
    //address public constant MY_ADDRESS = 0x8059B0AE35c113137694Ba15b2C3585aE77Bb8E9;
    //uint public constant MY_UINT = 123;

    // 불변(Immutable)
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructo(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
