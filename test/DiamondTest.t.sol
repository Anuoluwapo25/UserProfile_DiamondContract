// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/diamond/Diamond.sol";
import "../src/facets/UserProfileFacet.sol";
import "../src/facets/NFTConFacet.sol";

contract DiamondTest is Test {
    Diamond public diamond;

    function setUp() public {
        diamond = new Diamond(address(this));
    }

    function testDiamondDeployment() public view {
        assertEq(address(diamond) != address(0), true);
    }
}
