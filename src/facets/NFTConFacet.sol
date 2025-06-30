// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { LibAppStorage } from "../diamond/libraries";

contract NFTConFacet {
    using LibAppStorage for LibAppStorage.AppStorage;


    function setNftName(string memory _name) external { 
        LibAppStorage.AppStorage storage s = LibAppStorage.diamondStorage();
        s.nftName = _name;
    }
    function setNftSymbol(string memory _symbol) external { 
        LibAppStorage.AppStorage storage s = LibAppStorage.diamondStorage();
        s.nftSymbol = _symbol; 
    }
    function setBaseURI(string memory _uri) external { 
        LibAppStorage.AppStorage storage s = LibAppStorage.diamondStorage();
        s.nftBaseURI = _uri; 
    }
    function setMaxSupply(uint256 _maxSupply) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.diamondStorage();
        s.maxSupply = _maxSupply; 
    }
    function setCurrentSupply(uint256 _supply) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.diamondStorage();
        s.currentSupply = _supply;
    }
    function setAdmin(address _admin) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.diamondStorage();
        s.admin = _admin;
        }
    function setMintPrice(uint256 _price) external { 
        LibAppStorage.AppStorage storage s = LibAppStorage.diamondStorage();
        s.mintPrice = _price; 
        }
    function setNftDescription(string memory _desc) external { 
        LibAppStorage.AppStorage storage s = LibAppStorage.diamondStorage();
        s.nftDescription = _desc; 
        }
    function setNftLicense(string memory _license) external { 
        LibAppStorage.AppStorage storage s = LibAppStorage.diamondStorage();
        s.nftLicense = _license;
         }
    function setRoyaltyInfo(string memory _royalty) external {
        LibAppStorage.AppStorage storage s = LibAppStorage.diamondStorage();
        s.royaltyInfo = _royalty; 
        }
}
