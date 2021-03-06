// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "token/ERC20/ERC20.sol";
import "token/ERC20/IERC20.sol";

contract implementation is ERC20{
    constructor() public {
        _mint(msg.sender, 1000);
    }
}

interface ERC20 {
    function balanceOf(address owner) external view returns (unit);
    function allowance(address owner, address spender) external view returns (unit);
    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool); 
}

//when its using thingy, we can read the functions 
contract UsingThingy{
    //because its inherting functions from ERC20 and we know that
    // we can use their external functions like that.

    function TransferERC(address _owner, address _token, unit _amount, address _who) public {
        ERC20(_token).transferFrom(_owner, _who, _amount);
    }
    // need these two functions before the other 2
    function getBalanceOfToken(address _address, address _tokenAdd) public view returns (unit) {
        return ERC20(_address).balanceOf(address(this));
    }

    /*
    so to use this follow the thing
    Interface(address).functionDeclared
    ok so this is how you actually use it
    refrence the Interface to see where we declared balanceOf and TransferFrom

    ERC20(address).balanceOf(msg.sender);
    */
}