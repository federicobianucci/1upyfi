// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IGaugeRewards {
    event Claim(address indexed account, address receiver, uint256 amount, uint256 fee_idx, uint256 fee);
    event Harvest(address indexed gauge, address account, uint256 amount, uint256 fee);
    event PendingManagement(address management);
    event SetFeeRate(uint256 idx, uint256 rate);
    event SetManagement(address management);
    event SetRedeemer(address redeemer);
    event SetTreasury(address treasury);

    function accept_management() external;
    function claim(address[] memory _gauges) external payable returns (uint256);
    function claim(address[] memory _gauges, address _receiver) external payable returns (uint256);
    function claim(address[] memory _gauges, address _receiver, bytes memory _redeem_data)
        external
        payable
        returns (uint256);
    function claim_fees() external;
    function claimable(address _gauge, address _account) external view returns (uint256);
    function discount_token() external view returns (address);
    function fee_rate(uint256 _idx) external view returns (uint256);
    function gauge_balance(address _gauge, address _account) external view returns (uint256);
    function gauge_supply(address _gauge) external view returns (uint256);
    function harvest(address[] memory _gauges, uint256[] memory _amounts) external returns (uint256);
    function harvest(address[] memory _gauges, uint256[] memory _amounts, address _receiver)
        external
        returns (uint256);
    function management() external view returns (address);
    function packed_balances(address arg0, address arg1) external view returns (uint256);
    function packed_fees() external view returns (uint256);
    function packed_supply(address arg0) external view returns (uint256);
    function pending(address arg0) external view returns (uint256);
    function pending_fees() external view returns (uint256);
    function pending_management() external view returns (address);
    function redeemer() external view returns (address);
    function registry() external view returns (address);
    function report(address _ygauge, address _from, address _to, uint256 _amount, uint256 _rewards) external;
    function set_fee_rate(uint256 _idx, uint256 _fee) external;
    function set_management(address _management) external;
    function set_redeemer(address _redeemer) external;
    function set_treasury(address _treasury) external;
    function treasury() external view returns (address);
}
