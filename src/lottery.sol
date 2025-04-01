// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@chainlink/contracts/src/v0.8/vrf/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/vrf/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/automation/AutomationCompatible.sol";


contract LotteryVRF is VRFConsumerBaseV2, AutomationCompatibleInterface {
    VRFCoordinatorV2Interface private vrfCoordinator;
    uint64 private subscriptionId;
    bytes32 private gasLane;
    uint32 private callbackGasLimit;
    
    address[] public players;
    uint256 private lastTimestamp;
    uint256 private interval = 5 minutes; 
    
    constructor(address vrfCoordinatorV2, uint64 _subscriptionId, bytes32 _gasLane) 
    VRFConsumerBaseV2(vrfCoordinatorV2) {
        vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);
        subscriptionId = _subscriptionId;
        gasLane = _gasLane;
        lastTimestamp = block.timestamp;
    }
    
    function enterLottery() public payable {
        require(msg.value > 0, "Must send some ETH to enter");
        players.push(msg.sender);
    }
    
    function checkUpkeep(bytes calldata) external view override returns (bool, bytes memory) {
        bool timeHasPassed = (block.timestamp - lastTimestamp) >= interval;
        bool hasPlayers = players.length > 0;
        bool hasBalance = address(this).balance > 0;
        
        return (timeHasPassed && hasPlayers && hasBalance, "");
    }
    
    function performUpkeep(bytes calldata) external override {
        vrfCoordinator.requestRandomWords(
            gasLane,
            subscriptionId,
            3, 
            callbackGasLimit,
            1 
    }
    
   
    function fulfillRandomWords(uint256, uint256[] memory randomWords) internal override {
        uint winnerIndex = randomWords[0] % players.length;
        address winner = players[winnerIndex];
        
        (bool success,) = winner.call{value: address(this).balance}("");
        require(success, "Transfer failed");
        
        recentWinner = winner;
        players = new address[](0);
        lastTimestamp = block.timestamp;
    }
}