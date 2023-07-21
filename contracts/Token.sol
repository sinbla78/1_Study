// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract HotelRoom is ERC20, Ownable{
    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply * 10**uint(decimals()));
    }

    function Mint(uint _number) public {
         _mint(msg.sender, _number * 10**uint(decimals()));
    }


    function mintTokens(address account, uint256 amount) public onlyOwner{
        // require(account != address(0), "Invalid address");
        // require(amount > 0, "Amount must be greater than 0");
        _mint(account, amount * 10**uint(decimals()));
    }
    
}
