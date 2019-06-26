pragma solidity ^0.5.0;

contract Portfolio {
  bool public hireMe = false;
  uint public skillsTotal = 0;
  address public owner;
  string public firstName;
  string public lastName;

  event UpdateName(address indexed owner, string indexed first, string last);
  event UpdateSkills(address indexed owner, uint indexed skills);
  event UpdateHireStatus(address indexed owner, bool indexed hire);

  // "Payable" allows Ether to be sent! Donate to me :)
  constructor () public payable {
    owner = msg.sender;
    emit UpdateName(owner, firstName, lastName);
  }

  function isOwner(address _address) external view returns (bool) {
    return _address == owner;
  }

  function updateFirstname(string memory _first) public {
    require(msg.sender == owner, 'Must be owner to update');
    firstName = _first;
    emit UpdateName(owner, firstName, lastName);
  }

  function updateLastname(string memory _last) public {
    require(msg.sender == owner, 'Must be owner to update');
    lastName = _last;
    emit UpdateName(owner, firstName, lastName);
  }

  function getFullname() public view returns(string memory _firstName, string memory _lastName) {
    return (firstName, lastName);
  }

  function incrementSkills() public {
    require(msg.sender == owner, 'Must be owner to increment');
    skillsTotal = skillsTotal + 1;
    emit UpdateSkills(owner, skillsTotal);
  }

  function updateHireStatus(bool _hire) public {
    require(msg.sender == owner, 'Must be owner to change hire status');
    hireMe = _hire;
    emit UpdateHireStatus(owner, hireMe);
  }
}
