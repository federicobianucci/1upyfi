// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface ILiquidLocker {
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed sender, address indexed receiver, uint256 value);

    function allowance(address arg0, address arg1) external view returns (uint256);
    function approve(address _spender, uint256 _value) external returns (bool);
    function balanceOf(address arg0) external view returns (uint256);
    function decimals() external view returns (uint8);
    function deposit(uint256 _amount) external;
    function deposit(uint256 _amount, address _receiver) external;
    function extend_lock() external;
    function mint() external returns (uint256);
    function mint(address _receiver) external returns (uint256);
    function name() external view returns (string memory);
    function proxy() external view returns (address);
    function symbol() external view returns (string memory);
    function token() external view returns (address);
    function totalSupply() external view returns (uint256);
    function transfer(address _to, uint256 _value) external returns (bool);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
    function voting_escrow() external view returns (address);
}
