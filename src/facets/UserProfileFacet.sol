// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserProfileFacet {
    string public userName;
    string public userBio;
    string public userEmail;
    uint256 public userAge;
    address public userWallet;
    string public userLocation;
    string public userWebsite;
    string public userAvatar;
    string public userTwitter;
    string public userGithub;

    function setUserName(string memory _name) external { userName = _name; }
    function setUserBio(string memory _bio) external { userBio = _bio; }
    function setUserEmail(string memory _email) external { userEmail = _email; }
    function setUserAge(uint256 _age) external { userAge = _age; }
    function setUserWallet(address _wallet) external { userWallet = _wallet; }
    function setUserLocation(string memory _location) external { userLocation = _location; }
    function setUserWebsite(string memory _website) external { userWebsite = _website; }
    function setUserAvatar(string memory _avatar) external { userAvatar = _avatar; }
    function setUserTwitter(string memory _twitter) external { userTwitter = _twitter; }
    function setUserGithub(string memory _github) external { userGithub = _github; }
}