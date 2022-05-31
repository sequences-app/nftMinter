//Contract based on https://docs.openzeppelin.com/contracts/3.x/erc721
// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MyNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    uint public balanceReceived;
    string[] _tokenURIs = ["https://gateway.pinata.cloud/ipfs/QmX4Lt6n3XujaDD2L7aYSvCZwFnzf5CDMJReQspSs69qMR", "https://gateway.pinata.cloud/ipfs/QmdtNTzrTfcdCUaw9niZWLk1ZTcuZR46if29wyB2GkwfFP", "https://gateway.pinata.cloud/ipfs/QmainEiskW9YSWMc6kBBogNFjUi6wWbQEkDKqFNt2satcu", "https://gateway.pinata.cloud/ipfs/QmecSNmdPJU4rH82sr49QFo2hSqxzpSe42ytkwx87QiAJ5", "https://gateway.pinata.cloud/ipfs/QmcwvVujYJHeDLdbB9mn1rfe5gKsuGfcMpPgYkC38XvbJS"];

    constructor() ERC721("SQNCS_NFT_TEST", "NFT") {}

    // 1. Make smart contract accept new admin
    // 2. Smart contract will be deployed when given with list of tokenURI

    // make owner to add admin access to other address
    function claimTo(address userWallet, uint256 quantity)
        public
        virtual
        payable
        returns (uint256)
    {
        // tokenIds will reach certain number and it will stop
        // require(_tokenIds <= _tokenURIs.length);
        require(msg.value >= 0.01 * (10 ** 18), "Not enough Polygon sent; check price!");
        balanceReceived += msg.value;

        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(userWallet, newItemId);
        _setTokenURI(newItemId, _tokenURIs[newItemId % 5]);

        return newItemId;        
    }

    function price() public view returns (uint256) {
        return 0.01 * (10**18);
    }

    function getClaimIneligibilityReason(address userWallet, uint256 quantity) public view returns (string memory) {
        return "";
    }

    function unclaimedSupply() public view returns (uint256) {
        return 50 - _tokenIds.current();
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawMoney() public onlyOwner {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }

}
