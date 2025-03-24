// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./libraries/LibDiamondStorage.sol";
import "./interfaces/IDiamondCut.sol";

contract Diamond is IDiamondCut {
    constructor(address _contractOwner) {
        LibDiamondStorage.DiamondStorage storage ds = LibDiamondStorage.diamondStorage();
        ds.contractOwner = _contractOwner;
    }

    fallback() external payable {
        LibDiamondStorage.DiamondStorage storage ds = LibDiamondStorage.diamondStorage();
        address facet = ds.selectorToFacetAndPosition[msg.sig].facetAddress;
        require(facet != address(0), "Diamond: Function does not exist");

        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), facet, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }

    receive() external payable {}

    function diamondCut(FacetCut[] calldata _diamondCut, address _init, bytes calldata _calldata) external override {
        LibDiamondStorage.DiamondStorage storage ds = LibDiamondStorage.diamondStorage();
        require(msg.sender == ds.contractOwner, "Only owner");

        for (uint i = 0; i < _diamondCut.length; i++) {
            if (_diamondCut[i].action == FacetCutAction.Add) {
                for (uint j = 0; j < _diamondCut[i].functionSelectors.length; j++) {
                    ds.selectorToFacetAndPosition[_diamondCut[i].functionSelectors[j]].facetAddress = _diamondCut[i].facetAddress;
                }
            }
        }

        if (_init != address(0)) {
            (bool success, ) = _init.delegatecall(_calldata);
            require(success, "Init function failed");
        }
    }
}