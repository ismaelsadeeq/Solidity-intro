// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Test {
  bool trueOrFalse = true;
  //Uint means unsigned integer it cant take nagative value
  uint number8 = 2;
  uint8 number =  2;
  //signed integer can have negative and positive value
  int any = -4;
  string basicString = "Hello";

  //Array in solidity
  string[] public stringArray = ["hi","hello"];
  //public means it is a public keyword in the blockchain

  Person public sadiq;
  struct Person {
    string firstName;
    string lastName;
    uint age;
  }
  //Function in solidity
  function doThings() public {
    sadiq = Person(
      {
        firstName:"Abubakar",
        lastName:"Ismail",
        age:19
      }
    );
  }
  //Mapping
  address user = 0x6F283cA1Ea2A305662e25437f65aA9a52aE31c90;
  mapping(address =>uint) public balances;
  function doThings_2() public {
    balances[user] = 100;
  }

  //Constructors
  // address public owner;

  // constructor() public{
  //   owner = msg.sender;
  // }
  // function changeOwner(address newOwner) public {
  //   require(msg.sender == owner, "Only the owner can change the owner!!");

  //   owner = newOwner;
  // }
  //Events And Modifiers
  //Payable 
  constructor() public payable{
    
  }
  function checkBalance() public view returns(uint256) {
    return(address(this).balance);
  }
  function doMatch() public pure returns(uint256) {
    return 1+1;
  }
  event logUser(address indexed _user, uint _amount);

  modifier onlyOneEther(uint256 _amount){
    require(msg.value == 1 ether);
    _;
  }
  function sendOneEth() public payable onlyOneEther(3){
    emit logUser(msg.sender,msg.value);
  }

  //Memory and Storage

  // uint256[] public uintArray;

  // function happyFunction() public {
  //   uintArray.push(5);
  //   uintArray.push(8);

  //   uint256[] storage newArray = uintArray;

  //   newArray[0] = 0;
  // }
  uint256[] public uintArray;

  function happyFunction() public {
    uintArray.push(5);
    uintArray.push(8);

    uint256[] memory newArray = uintArray;

    newArray[0] = 0;
  }


}