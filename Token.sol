// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

import "./ERC20.sol";


contract Token is ERC20{
    uint32 public time = uint32(block.timestamp);
    uint112 public constant max_token_number = 37800000000000 ether;
    uint112 public constant all_claim = max_token_number / 2; 
    uint16 the_number_of_claim = 0;
    mapping(address => bool) public is_claim;
    constructor() ERC20("The Xin Coin","TXC"){
        _mint(0xC107a9123fB6a38635e9f939Be366ff1B17C29Ab, max_token_number / 2);
    }
    function claim() public {
        require(msg.sender == tx.origin);
        if(block.timestamp - time <= 360 days && return_is_claim(msg.sender) == false){
            the_number_of_claim += 1;
            is_claim[msg.sender] = true;
            _mint(msg.sender,return_claim_number());
        }
    }
    function return_claim_number() public view returns(uint112){
        uint112 claim_number;
        if(the_number_of_claim <= 1010){
            claim_number = all_claim / 100 * 20 / 1010 * 1;
        }
        else if(the_number_of_claim > 1010 && the_number_of_claim <= 101010){
            claim_number = all_claim / 100 * 80 / 10000 * 1;
        }
        return claim_number;
    }
    function return_is_claim(address _address) public view returns(bool){
        return is_claim[_address];
    }
}
