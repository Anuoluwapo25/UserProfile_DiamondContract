//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

library LibAppStorage {
    bytes32 constant APP_STORAGE_POSITION = keccak256("diamond.app.storage");


    struct AppStorage {
        string  nftName;
        string  nftSymbol;
        string  nftBaseURI;
        uint256  maxSupply;
        uint256  currentSupply;
        address  admin;
        uint256  mintPrice;
        string  nftDescription;
        string  nftLicense;
        string  royaltyInfo;

        string  userName;
        string  userBio;
        string  userEmail;
        uint256  userAge;
        address  userWallet;
        string  userLocation;
        string  userWebsite;
        string  userAvatar;
        string  userTwitter;
        string  userGithub;
    }
}

