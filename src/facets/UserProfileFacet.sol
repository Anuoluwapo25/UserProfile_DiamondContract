// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { LibAppStorage } from "../diamond/libraries";


contract UserProfileFacet {
    using LibAppStorage for LibAppStorage.AppStorage;


    function setUserName(string memory _name) external { 
        LibAppStorage storage s = LibAppStorage.diamondstorage();
        
        s.userName = _name;
    }
    function setUserBio(string memory _bio) external { 
        LibAppStorage storage s = LibAppStorage.diamondstorage();
        
        s.userBio = _bio; 
    }
    function setUserEmail(string memory _email) external { 
        LibAppStorage storage s = LibAppStorage.diamondstorage();
        
        s.userEmail = _email; 
    }
    function setUserAge(uint256 _age) external { 
        LibAppStorage storage s = LibAppStorage.diamondstorage();

        s.userAge = _age; 
    }
    function setUserWallet(address _wallet) external {
        LibAppStorage storage s = LibAppStorage.diamondstorage();

        s.userWallet = _wallet; 
    }
    function setUserLocation(string memory _location) external {
        LibAppStorage storage s = LibAppStorage.diamondstorage();

        s.userLocation = _location;
    }
    function setUserWebsite(string memory _website) external {
        LibAppStorage storage s = LibAppStorage.diamondstorage();

        s.userWebsite = _website;
    }
    function setUserAvatar(string memory _avatar) external {
        LibAppStorage storage s = LibAppStorage.diamondstorage();

        s.userAvatar = _avatar; 
    }
    function setUserTwitter(string memory _twitter) external {
        s.userTwitter = _twitter; 
    }
    function setUserGithub(string memory _github) external {
        s.userGithub = _github; 
    }
}