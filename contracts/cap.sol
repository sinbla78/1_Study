// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HotelRoom is ERC20Capped, Ownable {
    constructor(string memory name, string memory symbol, uint256 initialSupply, uint256 cap) ERC20(name, symbol) ERC20Capped(cap * 10**uint(decimals())) {
        _mint(msg.sender, initialSupply * 10**uint(decimals()));
    }

    function Mint(uint256 _number) public {
        _mint(msg.sender, _number * 10**uint(decimals()));
    }

    function mintTokens(address account, uint256 amount) public onlyOwner {
        _mint(account, amount * 10**uint(decimals()));
    }
}
