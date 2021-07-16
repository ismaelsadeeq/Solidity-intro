// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Bank {

  mapping(address=> uint256) public accounts;

  modifier hasFunds(uint256 _amount){
    require(_amount <= accounts[msg.sender], "Does not own sufficient funds");
    _;
  }
  function deposit() public payable {
    accounts[msg.sender] += msg.value;
  }
  function widthraw(uint256 _amount) public hasFunds(_amount){
    (msg.sender).transfer(_amount);
  }
  function checkAssets() public view returns(uint256) {
    return address(this).balance;
  }
}