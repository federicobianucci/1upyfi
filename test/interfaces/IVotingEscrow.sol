// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IVotingEscrow {
    event Initialized(address token, address reward_pool);
    event ModifyLock(address indexed sender, address indexed user, uint256 amount, uint256 locktime, uint256 ts);
    event Penalty(address indexed user, uint256 amount, uint256 ts);
    event Supply(uint256 old_supply, uint256 new_supply, uint256 ts);
    event Withdraw(address indexed user, uint256 amount, uint256 ts);

    function balanceOf(address user) external view returns (uint256);
    function balanceOf(address user, uint256 ts) external view returns (uint256);
    function checkpoint() external;
    function decimals() external view returns (uint8);
    function epoch(address arg0) external view returns (uint256);
    function find_epoch_by_timestamp(address user, uint256 ts) external view returns (uint256);
    function getPriorVotes(address user, uint256 height) external view returns (uint256);
    function get_last_user_point(address addr) external view returns (int128, int128, uint256, uint256);
    function locked(address arg0) external view returns (uint256, uint256);
    function modify_lock(uint256 amount, uint256 unlock_time) external returns (uint256, uint256);
    function modify_lock(uint256 amount, uint256 unlock_time, address user) external returns (uint256, uint256);
    function name() external view returns (string memory);
    function point_history(address arg0, uint256 arg1) external view returns (int128, int128, uint256, uint256);
    function reward_pool() external view returns (address);
    function slope_changes(address arg0, uint256 arg1) external view returns (int128);
    function supply() external view returns (uint256);
    function symbol() external view returns (string memory);
    function token() external view returns (address);
    function totalSupply() external view returns (uint256);
    function totalSupply(uint256 ts) external view returns (uint256);
    function totalSupplyAt(uint256 height) external view returns (uint256);
    function withdraw() external returns (uint256, uint256);
}
