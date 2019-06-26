pragma solidity ^0.5.0;

interface PortfolioInterface {
  function isOwner(address _address) external view returns(bool);
}

contract Directory {
  uint256 public totalParticipants;
  address[] public participants;

  /// @dev first address is user wallet, second address is public profile contract
  mapping(address => address) public participantContracts;

  PortfolioInterface portfolio;

  event ParticipantAdded(address indexed _participant, address indexed _portfolio);

  /// @dev add me as a participant, only if i am the owner of my portfolio contract
  function addMyPortfolio(address myWalletAddress, address portfolioAddress) public {
    // First quick sanity check on if we're already here
    if (participantContracts[myWalletAddress] == portfolioAddress) revert("Already exists");
    // NOTE: Currently left it open, so I could update my portfolio contract address later

    // Next, make sure we are the owner of the portfolio
    portfolio = PortfolioInterface(portfolioAddress);
    require(portfolio.isOwner(msg.sender), "You arent the owner");

    // Now we're here we can finally to the logic
    participantContracts[myWalletAddress] = portfolioAddress;
    // no safemath, i know im a bad human!
    participants.push(myWalletAddress);
    totalParticipants = totalParticipants + 1;

    emit ParticipantAdded(myWalletAddress, portfolioAddress);
  }
}
