// SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract WETH is ERC20 {
    event Deposit (address indexed account, uint amount);
    event Withdraw (address indexed account, uint amount);
    
    constructor() ERC20("Wrapped ETH", "WETH") {}
    
    fallback() external payable {
       mint();
    }
    
    function mint() public payable {
        _mint(msg.sender, msg.value);
        emit Deposit (msg.sender, msg.value);
    }
    
    function withdraw(uint amount) external {
        _burn(msg.sender, amount);
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }
}
