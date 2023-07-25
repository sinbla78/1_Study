// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;
//private : 해당 컨트랙트에서만 사용(상속에서만 사용 못함)
contract Base{
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }
    

    function testPrivateFunc() public pure returns (string memory) {
        return  privateFunc();
    }
}
