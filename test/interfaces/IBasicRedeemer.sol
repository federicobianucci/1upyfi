// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IBasicRedeemer {
    event ClaimExcess(uint256 excess);
    event PendingManagement(address management);
    event Redeem(
        address indexed account, address receiver, uint256 lt_amount, uint256 dt_amount, uint256 value, uint256 minted
    );
    event SetCurvePool(address curve_pool);
    event SetManagement(address management);
    event SetTreasury(address treasury);
    event SetYearnRedemption(address yearn_redemption);

    fallback() external payable;

    function accept_management() external;
    function claim_excess() external;
    function curve_pool() external view returns (address);
    function discount_token() external view returns (address);
    function gauge_rewards() external view returns (address);
    function liquid_locker() external view returns (address);
    function locking_token() external view returns (address);
    function management() external view returns (address);
    function pending_management() external view returns (address);
    function proxy() external view returns (address);
    function redeem(address _account, address _receiver, uint256 _lt_amount, uint256 _dt_amount, bytes memory _data)
        external
        payable
        returns (uint256);
    function set_curve_pool(address _curve_pool) external;
    function set_management(address _management) external;
    function set_treasury(address _treasury) external;
    function set_yearn_redemption(address _yearn_redemption) external;
    function staking_rewards() external view returns (address);
    function treasury() external view returns (address);
    function voting_escrow() external view returns (address);
    function yearn_redemption() external view returns (address);
}
