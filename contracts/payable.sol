// SPDX-Lisence-Identifier: GPL-3.0
pragma solidity ^0.8.13;
contract Hotel {
    address payable public owner;
    uint public counter;
    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses[5] public rooms = [Statuses.Vacant];
    event Occupy(address _occuoant, uint _value);
    Statuses currentStatus;
    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier cost(uint _amount) {
        require(msg.value == _amount*(1 ether), "Invalid Money.");
        _;
    }

    modifier Room {
        require(counter < 5,"Not Room.");
         _;
    }

    receive() external payable cost(99) Room{ 
        rooms[counter++] = Statuses.Occupied;
        //owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
    function salary() public {
        uint amount = address(this).balance;
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

}
