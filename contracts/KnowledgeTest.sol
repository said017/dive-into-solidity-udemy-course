//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    modifier OnlyOwner() {
        require(owner == msg.sender, "ONLY_OWNER");

        _;
    }

    constructor() {
        owner = msg.sender;
        // TODO: initialize the owner to the address that deploys the contract
    }

    receive() external payable {}

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferAll(address _to) public OnlyOwner {
        (bool sent, ) = _to.call{value: address(this).balance}("");
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string memory word1, string memory word2)
        external
        pure
        returns (string memory)
    {
        return string(abi.encodePacked(word1, word2));
    }
}
