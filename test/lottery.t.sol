// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {LotteryVRF} from "../src/lottery.sol";
import "forge-std/console.sol";
import "@chainlink/contracts/src/v0.8/vrf/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/vrf/VRFConsumerBaseV2.sol";


contract MockVRFCoordinator is VRFCoordinatorV2Interface {
    uint256 private lastRequestId;
    LotteryVRF private lottery;

    function requestRandomWords(
        bytes32,
        uint64,
        uint16,
        uint32,
        uint32
    ) external returns (uint256) {
        lastRequestId++;
        lottery = LotteryVRF(msg.sender);
        return lastRequestId;
    }

    function triggerRandomWords(uint256[] memory randomWords) external {
        if (address(lottery) != address(0)) {
            VRFConsumerBaseV2(address(lottery)).rawFulfillRandomWords(lastRequestId, randomWords);
        }
    }

    function getRequestConfig() external pure returns (uint16, uint32, bytes32[] memory) {
        bytes32[] memory keyhashes = new bytes32[](0);
        return (3, 1000000, keyhashes);
    }

    function createSubscription() external pure returns (uint64) {
        return 1;
    }

    function getSubscription(uint64) external pure returns (
        uint96, uint64, address, address[] memory
    ) {
        address[] memory consumers = new address[](0);
        return (0, 0, address(0), consumers);
    }

    function requestSubscriptionOwnerTransfer(uint64, address) external pure {}
    function acceptSubscriptionOwnerTransfer(uint64) external pure {}
    function addConsumer(uint64, address) external pure {}
    function removeConsumer(uint64, address) external pure {}
    function cancelSubscription(uint64, address) external pure {}
    function pendingRequestExists(uint64) external pure returns (bool) {
        return false;
    }
}

contract CounterTest is Test {
    LotteryVRF public lottery;
    MockVRFCoordinator public vrfCoordinator;
    

    address public alice = address(0x1);
    address public bob = address(0x2);
    address public charlie = address(0x3);
    
    uint64 public subscriptionId = 1234;
    bytes32 public gasLane = keccak256("test");
    uint32 public callbackGasLimit = 500000;
    uint256 public entranceFee = 0.01 ether;

    function setUp() public {
       vrfCoordinator = new MockVRFCoordinator();
        
        lottery = new LotteryVRF(
            address(vrfCoordinator),
            subscriptionId,
            gasLane
        );
        
        vm.deal(alice, 10 ether);
        vm.deal(bob, 10 ether);
        vm.deal(charlie, 10 ether);
    }

    function test_enterLottery() public {
        vm.prank(alice);
        lottery.enterLottery{value: entranceFee}();
    }

    function checkUpkeep(uint256 x) public {
        vm.warp(block.timestamp + 6 minutes);
        
        (bool upkeepNeeded, ) = lottery.checkUpkeep("");
        
        assertEq(upkeepNeeded, false);
    }
}