// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NFTConFacet {
    string public nftName;
    string public nftSymbol;
    string public nftBaseURI;
    uint256 public maxSupply;
    uint256 public currentSupply;
    address public admin;
    uint256 public mintPrice;
    string public nftDescription;
    string public nftLicense;
    string public royaltyInfo;

    function setNftName(string memory _name) external { nftName = _name; }
    function setNftSymbol(string memory _symbol) external { nftSymbol = _symbol; }
    function setBaseURI(string memory _uri) external { nftBaseURI = _uri; }
    function setMaxSupply(uint256 _maxSupply) external { maxSupply = _maxSupply; }
    function setCurrentSupply(uint256 _supply) external { currentSupply = _supply; }
    function setAdmin(address _admin) external { admin = _admin; }
    function setMintPrice(uint256 _price) external { mintPrice = _price; }
    function setNftDescription(string memory _desc) external { nftDescription = _desc; }
    function setNftLicense(string memory _license) external { nftLicense = _license; }
    function setRoyaltyInfo(string memory _royalty) external { royaltyInfo = _royalty; }
}
