// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;
contract Example {
    // function 리턴 값을 다양하게 받을 수 있음
    function returnMany() public pure returns(uint,bool,uint){
        return (1,true,2);
    }
    function named() public pure returns(uint x, bool b, uint y)
    {
        return (1,true,2);
    }
    function assigned() public pure returns(uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }
    function destructuringAssignment() public pure returns(
        uint, bool, uint, uint, uint
    ) {
        (uint i, bool b, uint j) = returnMany();
        (uint x, ,uint y) = (4,5,6);
        return(i,b,j,x,y);
    }
    
    
} 
