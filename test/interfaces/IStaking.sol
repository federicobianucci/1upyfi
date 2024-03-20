// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IStaking {
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Deposit(address indexed sender, address indexed owner, uint256 assets, uint256 shares);
    event PendingManagement(address management);
    event SetManagement(address management);
    event SetRewards(address rewards);
    event Transfer(address indexed sender, address indexed receiver, uint256 value);
    event Withdraw(
        address indexed sender, address indexed receiver, address indexed owner, uint256 assets, uint256 shares
    );

    function accept_management() external;
    function allowance(address arg0, address arg1) external view returns (uint256);
    function approve(address _spender, uint256 _value) external returns (bool);
    function asset() external view returns (address);
    function balanceOf(address _account) external view returns (uint256);
    function convertToAssets(uint256 _shares) external view returns (uint256);
    function convertToShares(uint256 _assets) external view returns (uint256);
    function decimals() external view returns (uint8);
    function deposit(uint256 _assets) external returns (uint256);
    function deposit(uint256 _assets, address _receiver) external returns (uint256);
    function lock() external returns (uint256);
    function lock(uint256 _duration) external returns (uint256);
    function management() external view returns (address);
    function maxDeposit(address _owner) external view returns (uint256);
    function maxMint(address _owner) external view returns (uint256);
    function maxRedeem(address _owner) external view returns (uint256);
    function maxWithdraw(address _owner) external view returns (uint256);
    function mint(uint256 _shares) external returns (uint256);
    function mint(uint256 _shares, address _receiver) external returns (uint256);
    function name() external view returns (string memory);
    function packed_balances(address arg0) external view returns (uint256);
    function packed_streams(address arg0) external view returns (uint256);
    function pending_management() external view returns (address);
    function previewDeposit(uint256 _assets) external view returns (uint256);
    function previewMint(uint256 _shares) external view returns (uint256);
    function previewRedeem(uint256 _shares) external view returns (uint256);
    function previewWithdraw(uint256 _assets) external view returns (uint256);
    function previous_packed_balances(address arg0) external view returns (uint256);
    function redeem(uint256 _shares) external returns (uint256);
    function redeem(uint256 _shares, address _receiver) external returns (uint256);
    function redeem(uint256 _shares, address _receiver, address _owner) external returns (uint256);
    function rewards() external view returns (address);
    function set_management(address _management) external;
    function set_rewards(address _rewards) external;
    function streams(address _account) external view returns (uint256, uint256, uint256);
    function symbol() external view returns (string memory);
    function totalAssets() external view returns (uint256);
    function totalSupply() external view returns (uint256);
    function transfer(address _to, uint256 _value) external returns (bool);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
    function unlock_times(address arg0) external view returns (uint256);
    function unstake(uint256 _assets) external;
    function vote_weight(address _account) external view returns (uint256);
    function withdraw(uint256 _assets) external returns (uint256);
    function withdraw(uint256 _assets, address _receiver) external returns (uint256);
    function withdraw(uint256 _assets, address _receiver, address _owner) external returns (uint256);
}
