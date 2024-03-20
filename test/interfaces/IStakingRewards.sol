// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IStakingRewards {
    event Claim(
        address indexed account,
        address receiver,
        uint256 lt_amount,
        uint256 dt_amount,
        uint256 fee_idx,
        uint256 lt_fee,
        uint256 dt_fee
    );
    event Harvest(address account, uint256 lt_amount, uint256 dt_amount, uint256 lt_fee, uint256 dt_fee);
    event PendingManagement(address management);
    event SetFeeRate(uint256 idx, uint256 rate);
    event SetManagement(address management);
    event SetRedeemer(address redeemer);
    event SetTreasury(address treasury);

    function accept_management() external;
    function claim() external payable returns (uint256, uint256);
    function claim(address _receiver) external payable returns (uint256, uint256);
    function claim(address _receiver, bytes memory _redeem_data) external payable returns (uint256, uint256);
    function claim_fees() external;
    function claimable(address _account) external view returns (uint256, uint256);
    function discount_token() external view returns (address);
    function fee_rates(uint256 arg0) external view returns (uint256);
    function harvest(uint256 _lt_amount, uint256 _dt_amount) external;
    function harvest(uint256 _lt_amount, uint256 _dt_amount, address _receiver) external;
    function locking_token() external view returns (address);
    function management() external view returns (address);
    function packed_account_integrals(address arg0) external view returns (uint256);
    function packed_integrals() external view returns (uint256);
    function packed_pending_fees() external view returns (uint256);
    function packed_pending_rewards(address arg0) external view returns (uint256);
    function pending(address _account) external view returns (uint256, uint256);
    function pending_fees() external view returns (uint256, uint256);
    function pending_management() external view returns (address);
    function proxy() external view returns (address);
    function redeemer() external view returns (address);
    function report(address _account, uint256 _balance) external;
    function set_fee_rate(uint256 _idx, uint256 _fee) external;
    function set_management(address _management) external;
    function set_redeemer(address _redeemer) external;
    function set_treasury(address _treasury) external;
    function staking() external view returns (address);
    function treasury() external view returns (address);
}
