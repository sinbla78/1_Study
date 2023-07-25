// SPDX-Lisence-Identifier: GPL-3.0
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Hotel is ERC20{
    address payable public owner;
    uint public counter;
    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses[10000] public rooms = [Statuses.Vacant];
    event Occupy(address _occuoant, uint _value);
    Statuses currentStatus;
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Invalid Money."); _;
    }

    modifier MaxRooms {
        require(counter < 10000,"Not Room."); _;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You are not Owner."); _;
    }
    uint accountBalance = address(this).balance;
    receive() external payable costs(2 wei) MaxRooms{ //receive : calldata없이 msg를 받을 때 동작하는 함수 (message ether)
        rooms[counter++] = Statuses.Occupied;
        accountBalance += 2 wei;    
        emit Occupy(msg.sender, msg.value);
        _mint(msg.sender , 20000000000 * 10**uint(decimals()));
    }
    function withdraw() public payable onlyOwner{
        owner.transfer(accountBalance);
    }
}
