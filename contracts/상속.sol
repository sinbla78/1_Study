// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

//솔리디티의 상속
//다중 상속 지원, is 키워드 사용
//오버라이딩 override 키워드 사용
contract A{
    function foo() public pure virtual returns(string memory){
        return "A";
    }
}
contract B is A{
    //A.foo() 오버라이딩
    function foo() public pure virtual override returns (string memory){
        return "B";
    }
}
