```console
                BasicRedeemer Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
                   __default__       2      2     0.0%
       __extcodesize_is_zero__       1      1     0.0%
      __external_call_failed__       1      1     0.0%
 __invalid_calldata_or_value__       1      1     0.0%
  __returndatasize_too_small__       1      1     0.0%
             __validate_uint__       1      1     0.0%
                 _redeem_curve       2      0   100.0%
                 _redeem_yearn       5      0   100.0%
             accept_management       5      2    60.0%
                  claim_excess       5      1    80.0%
                    curve_pool       0      0   100.0%
                discount_token       0      0     0.0%
                 gauge_rewards       0      0     0.0%
                 liquid_locker       0      0     0.0%
                 locking_token       0      0     0.0%
                    management       0      0   100.0%
            pending_management       0      0   100.0%
                         proxy       0      0     0.0%
                        redeem      19      2   89.47%
                set_curve_pool       9      0   100.0%
                set_management       4      1    75.0%
                  set_treasury       4      1    75.0%
          set_yearn_redemption       9      0   100.0%
               staking_rewards       0      0     0.0%
                      treasury       0      0   100.0%
                 voting_escrow       0      0     0.0%
              yearn_redemption       0      0   100.0%

               line=45.45%, func=60.87%

                        Factory Coverage

                                   Func   Stmts   Miss    Cover
────────────────────────────────────────────────────────────────
                      __create_failed__       1      1     0.0%
 __empty_target_create_from_blueprint__       1      1     0.0%
               __external_call_failed__       1      1     0.0%
               __fallback_not_defined__       1      1     0.0%
          __invalid_calldata_or_value__       1      1     0.0%
           __returndatasize_too_small__       1      1     0.0%
                      accept_management       5      2    60.0%
                           deploy_gauge      11      3   72.73%
                        gauge_blueprint       0      0   100.0%
                             management       0      0   100.0%
                     pending_management       0      0   100.0%
                                  proxy       0      0     0.0%
                               registry       0      0     0.0%
                           reward_token       0      0     0.0%
                                rewards       0      0     0.0%
                    set_gauge_blueprint       5      1    80.0%
                         set_management       4      1    75.0%
                         yearn_registry       0      0     0.0%

                    line=33.96%, func=53.85%

                      Gauge Coverage

                              Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────────
           __extcodesize_is_zero__       1      1     0.0%
          __external_call_failed__       1      1     0.0%
          __fallback_not_defined__       1      1     0.0%
     __invalid_calldata_or_value__       1      0   100.0%
      __returndatasize_too_small__       1      1     0.0%
                          _deposit       6      0   100.0%
                          _pending       2      0   100.0%
                         _withdraw       9      0   100.0%
                         allowance       0      0   100.0%
                           approve       5      0   100.0%
                             asset       0      0   100.0%
                         balanceOf       2      0   100.0%
                   convertToAssets       2      2     0.0%
                   convertToShares       2      2     0.0%
                          decimals       0      0     0.0%
                  deposit(uint256)       1      0   100.0%
          deposit(uint256,address)       2      1    50.0%
                        maxDeposit       2      2     0.0%
                           maxMint       2      2     0.0%
                         maxRedeem       2      2     0.0%
                       maxWithdraw       2      2     0.0%
                     mint(uint256)       1      1     0.0%
             mint(uint256,address)       2      2     0.0%
                              name       4      0   100.0%
                    previewDeposit       2      1    50.0%
                       previewMint       2      1    50.0%
                     previewRedeem       2      1    50.0%
                   previewWithdraw       2      1    50.0%
                             proxy       0      0   100.0%
                   redeem(uint256)       1      1     0.0%
           redeem(uint256,address)       1      1     0.0%
   redeem(uint256,address,address)       2      2     0.0%
                      reward_token       0      0   100.0%
                           rewards       0      0   100.0%
                            symbol       4      0   100.0%
                       totalAssets       2      2     0.0%
                       totalSupply       2      0   100.0%
                          transfer       6      0   100.0%
                      transferFrom       8      0   100.0%
                 withdraw(uint256)       1      0   100.0%
         withdraw(uint256,address)       1      0   100.0%
 withdraw(uint256,address,address)       2      1    50.0%

                  line=39.6%, func=65.79%

                    GaugeRewards Coverage

                                 Func   Stmts   Miss    Cover
──────────────────────────────────────────────────────────────
              __extcodesize_is_zero__       1      1     0.0%
             __external_call_failed__       1      1     0.0%
             __fallback_not_defined__       1      1     0.0%
        __invalid_calldata_or_value__       1      1     0.0%
         __returndatasize_too_small__       1      1     0.0%
                    __validate_uint__       1      1     0.0%
                            _fee_rate       2      0   100.0%
                             _harvest       8      0   100.0%
                                _pack       2      0   100.0%
                    _set_pending_fees       5      1    80.0%
                              _unpack       1      0   100.0%
                    accept_management       5      2    60.0%
                     claim(address[])       1      1     0.0%
             claim(address[],address)       1      1     0.0%
       claim(address[],address,bytes)      27      7   74.07%
                           claim_fees       5      0   100.0%
                            claimable       5      0   100.0%
                       discount_token       0      0     0.0%
                             fee_rate       2      0   100.0%
                        gauge_balance       2      0   100.0%
                         gauge_supply       2      0   100.0%
         harvest(address[],uint256[])       1      0   100.0%
 harvest(address[],uint256[],address)      19      2   89.47%
                           management       0      0   100.0%
                      packed_balances       0      0   100.0%
                          packed_fees       0      0     0.0%
                        packed_supply       0      0   100.0%
                              pending       0      0   100.0%
                         pending_fees       2      0   100.0%
                   pending_management       0      0   100.0%
                             redeemer       0      0   100.0%
                             registry       0      0     0.0%
                               report      26      0   100.0%
                         set_fee_rate      10      1    90.0%
                       set_management       4      1    75.0%
                         set_redeemer       9      0   100.0%
                         set_treasury       4      1    75.0%
                             treasury       0      0   100.0%

                   line=63.96%, func=81.82%

                 LiquidLocker Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
       __extcodesize_is_zero__       1      1     0.0%
      __external_call_failed__       1      1     0.0%
      __fallback_not_defined__       1      1     0.0%
 __invalid_calldata_or_value__       1      1     0.0%
  __returndatasize_too_small__       1      1     0.0%
             __validate_uint__       1      1     0.0%
                         _mint       5      0   100.0%
                     allowance       0      0   100.0%
                       approve       5      0   100.0%
                     balanceOf       0      0   100.0%
                      decimals       0      0     0.0%
              deposit(uint256)       1      1     0.0%
      deposit(uint256,address)       3      3     0.0%
                   extend_lock       2      1    50.0%
                        mint()       1      1     0.0%
                 mint(address)       3      1   66.67%
                          name       0      0     0.0%
                         proxy       0      0     0.0%
                        symbol       0      0     0.0%
                         token       0      0     0.0%
                   totalSupply       0      0   100.0%
                      transfer       6      6     0.0%
                  transferFrom       9      0   100.0%
                 voting_escrow       0      0     0.0%

                line=38.6%, func=42.11%

                  MockGauge Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
      __fallback_not_defined__       1      1     0.0%
 __invalid_calldata_or_value__       1      0   100.0%
                         asset       0      0     0.0%

                line=66.67%, func=50.0%

              MockGaugeRedeemer Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
       __extcodesize_is_zero__       1      1     0.0%
      __external_call_failed__       1      1     0.0%
      __fallback_not_defined__       1      1     0.0%
          __integer_overflow__       1      0   100.0%
 __invalid_calldata_or_value__       1      0   100.0%
  __returndatasize_too_small__       1      1     0.0%
             __validate_uint__       1      1     0.0%
                        redeem       7      1   85.71%

               line=45.83%, func=100.0%

                 MockRegistry Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
      __fallback_not_defined__       1      1     0.0%
          __integer_overflow__       1      0   100.0%
 __invalid_calldata_or_value__       1      0   100.0%
                     gauge_map       0      0     0.0%
                 set_gauge_map       2      0   100.0%

               line=85.71%, func=66.67%

                 MockStaking Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
       __extcodesize_is_zero__       1      1     0.0%
      __external_call_failed__       1      1     0.0%
      __fallback_not_defined__       1      1     0.0%
 __invalid_calldata_or_value__       1      0   100.0%
                     allowance       0      0     0.0%
                       approve       4      4     0.0%
                     balanceOf       0      0     0.0%
                          burn       5      0   100.0%
                      decimals       0      0     0.0%
                          mint       5      0   100.0%
                          name       0      0     0.0%
                   set_rewards       2      0   100.0%
                        symbol       0      0     0.0%
                   totalSupply       0      0     0.0%
                      transfer       8      7    12.5%
                  transferFrom       9      9     0.0%

                line=25.0%, func=38.46%

             MockStakingRedeemer Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
       __extcodesize_is_zero__       1      1     0.0%
      __external_call_failed__       1      1     0.0%
      __fallback_not_defined__       1      1     0.0%
          __integer_overflow__       1      0   100.0%
 __invalid_calldata_or_value__       1      0   100.0%
  __returndatasize_too_small__       1      1     0.0%
             __validate_uint__       1      1     0.0%
                        redeem       7      1   85.71%

               line=35.48%, func=100.0%

                  MockToken Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
      __fallback_not_defined__       1      1     0.0%
 __invalid_calldata_or_value__       1      1     0.0%
                     allowance       0      0   100.0%
                       approve       4      0   100.0%
                     balanceOf       0      0   100.0%
                          burn       4      4     0.0%
                      decimals       0      0     0.0%
                          mint       4      0   100.0%
                          name       0      0     0.0%
                        symbol       0      0     0.0%
                   totalSupply       0      0     0.0%
                      transfer       6      0   100.0%
                  transferFrom       7      0   100.0%

                line=75.0%, func=50.0%

                MockYearnGauge Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
      __fallback_not_defined__       1      1     0.0%
 __invalid_calldata_or_value__       1      1     0.0%
                     allowance       0      0     0.0%
                       approve       4      0   100.0%
                     balanceOf       0      0   100.0%
                          burn       4      3    25.0%
                      decimals       0      0     0.0%
                     getReward       1      0   100.0%
                          mint       4      0   100.0%
                          name       0      0     0.0%
                  setRecipient       1      0   100.0%
                        symbol       0      0     0.0%
                   totalSupply       0      0     0.0%
                      transfer       6      6     0.0%
                  transferFrom       7      0   100.0%

                line=60.0%, func=50.0%

              MockYearnRegistry Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
      __fallback_not_defined__       1      1     0.0%
          __integer_overflow__       1      0   100.0%
 __invalid_calldata_or_value__       1      0   100.0%
                    registered       0      0     0.0%
                set_registered       2      0   100.0%

               line=85.71%, func=66.67%

                    Proxy Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
       __extcodesize_is_zero__       1      1     0.0%
      __external_call_failed__       1      1     0.0%
      __fallback_not_defined__       1      1     0.0%
 __invalid_calldata_or_value__       1      0   100.0%
             accept_management       5      2    60.0%
                          call       3      0   100.0%
              isValidSignature       3      1   66.67%
                    management       0      0   100.0%
                      messages       0      0     0.0%
                   modify_lock       3      0   100.0%
                     operators       0      0   100.0%
            pending_management       0      0   100.0%
                set_management       4      1    75.0%
                  set_operator       5      0   100.0%
            set_signed_message       5      0   100.0%

               line=72.22%, func=91.67%

                   Registry Coverage

                          Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────
       __extcodesize_is_zero__       1      1     0.0%
      __external_call_failed__       1      1     0.0%
      __fallback_not_defined__       1      1     0.0%
 __invalid_calldata_or_value__       1      1     0.0%
  __returndatasize_too_small__       1      1     0.0%
             accept_management       5      1    80.0%
                    deregister      13      1   92.31%
                       disable       9      4   55.56%
                      disabled       2      0   100.0%
                     gauge_map       0      0   100.0%
              gauge_registered       3      0   100.0%
                        gauges       5      0   100.0%
                    management       0      0   100.0%
                    num_gauges       0      0   100.0%
            pending_management       0      0   100.0%
                         proxy       0      0     0.0%
                      register      16      1   93.75%
                     registrar       0      0   100.0%
                set_management       4      1    75.0%
                 set_registrar       4      1    75.0%
             ygauge_registered       3      0   100.0%
                       ygauges       0      0   100.0%

               line=65.48%, func=88.89%

                     Staking Coverage

                              Func   Stmts   Miss    Cover
───────────────────────────────────────────────────────────
           __extcodesize_is_zero__       1      1     0.0%
          __external_call_failed__       1      1     0.0%
          __fallback_not_defined__       1      1     0.0%
     __invalid_calldata_or_value__       1      1     0.0%
      __returndatasize_too_small__       1      1     0.0%
                 __validate_uint__       1      1     0.0%
                          _deposit       5      0   100.0%
                             _pack       2      0   100.0%
                           _unpack       1      0   100.0%
                   _update_balance      20      0   100.0%
                         _withdraw      15      0   100.0%
                     _withdrawable       6      0   100.0%
                 accept_management       5      1    80.0%
                         allowance       0      0   100.0%
                           approve       5      0   100.0%
                             asset       0      0     0.0%
                         balanceOf       2      0   100.0%
                   convertToAssets       2      2     0.0%
                   convertToShares       2      2     0.0%
                          decimals       0      0     0.0%
                  deposit(uint256)       1      0   100.0%
          deposit(uint256,address)       2      1    50.0%
                            lock()       1      1     0.0%
                     lock(uint256)      20      2    90.0%
                        management       0      0   100.0%
                        maxDeposit       2      1    50.0%
                           maxMint       2      2     0.0%
                         maxRedeem       2      2     0.0%
                       maxWithdraw       2      0   100.0%
                     mint(uint256)       1      1     0.0%
             mint(uint256,address)       2      2     0.0%
                              name       0      0     0.0%
                   packed_balances       0      0   100.0%
                    packed_streams       0      0     0.0%
                pending_management       0      0   100.0%
                    previewDeposit       2      1    50.0%
                       previewMint       2      1    50.0%
                     previewRedeem       2      1    50.0%
                   previewWithdraw       2      2     0.0%
          previous_packed_balances       0      0   100.0%
                   redeem(uint256)       1      1     0.0%
           redeem(uint256,address)       1      1     0.0%
   redeem(uint256,address,address)       2      2     0.0%
                           rewards       0      0   100.0%
                    set_management       4      1    75.0%
                       set_rewards       5      0   100.0%
                           streams       2      0   100.0%
                            symbol       0      0     0.0%
                       totalAssets       2      1    50.0%
                       totalSupply       0      0   100.0%
                          transfer       7      0   100.0%
                      transferFrom       9      0   100.0%
                      unlock_times       0      0   100.0%
                           unstake       8      1    87.5%
                       vote_weight      10      0   100.0%
                 withdraw(uint256)       1      1     0.0%
         withdraw(uint256,address)       1      0   100.0%
 withdraw(uint256,address,address)       2      1    50.0%

                 line=70.21%, func=66.04%

                 StakingRewards Coverage

                             Func   Stmts   Miss    Cover
──────────────────────────────────────────────────────────
          __extcodesize_is_zero__       1      1     0.0%
         __external_call_failed__       1      1     0.0%
         __fallback_not_defined__       1      1     0.0%
    __invalid_calldata_or_value__       1      1     0.0%
     __returndatasize_too_small__       1      1     0.0%
                __validate_uint__       1      1     0.0%
                            _pack       2      0   100.0%
                            _sync      16      0   100.0%
                          _unpack       1      0   100.0%
                accept_management       5      1    80.0%
                          claim()       1      0   100.0%
                   claim(address)       1      0   100.0%
             claim(address,bytes)      31      7   77.42%
                       claim_fees       9      2   77.78%
                        claimable      11      1   90.91%
                   discount_token       0      0     0.0%
                        fee_rates       0      0   100.0%
         harvest(uint256,uint256)       1      0   100.0%
 harvest(uint256,uint256,address)      25      0   100.0%
                    locking_token       0      0     0.0%
                       management       0      0   100.0%
         packed_account_integrals       0      0   100.0%
                 packed_integrals       0      0   100.0%
              packed_pending_fees       0      0     0.0%
           packed_pending_rewards       0      0     0.0%
                          pending       2      0   100.0%
                     pending_fees       2      0   100.0%
               pending_management       0      0   100.0%
                            proxy       0      0     0.0%
                         redeemer       0      0   100.0%
                           report       3      0   100.0%
                     set_fee_rate       6      1   83.33%
                   set_management       4      1    75.0%
                     set_redeemer      11      0   100.0%
                     set_treasury       4      1    75.0%
                          staking       0      0     0.0%
                         treasury       0      0   100.0%

                 line=52.16%, func=78.12%

                                        VestingEscrowFactory Coverage

                                                                                  Func   Stmts   Miss   Cover
──────────────────────────────────────────────────────────────────────────────────────────────────────────────
                                                                                TARGET       0      0    0.0%
                                                                     __create_failed__       1      1    0.0%
                                                               __extcodesize_is_zero__       1      1    0.0%
                                                              __external_call_failed__       1      1    0.0%
                                                              __fallback_not_defined__       1      1    0.0%
                                                         __invalid_calldata_or_value__       1      1    0.0%
                                                          __returndatasize_too_small__       1      1    0.0%
                                                               deploy_vesting_contract       4      4    0.0%
                              deploy_vesting_contract(address,address,uint256,uint256)       4      4    0.0%
              deploy_vesting_contract(address,address,uint256,uint256,uint256,uint256)       3      3    0.0%
         deploy_vesting_contract(address,address,uint256,uint256,uint256,uint256,bool)       3      3    0.0%
 deploy_vesting_contract(address,address,uint256,uint256,uint256,uint256,bool,address)      25     25    0.0%

                                             line=0.0%, func=0.0%

             VestingEscrowSimple Coverage

                          Func   Stmts   Miss   Cover
──────────────────────────────────────────────────────
       __extcodesize_is_zero__       1      1    0.0%
      __external_call_failed__       1      1    0.0%
      __fallback_not_defined__       1      1    0.0%
 __invalid_calldata_or_value__       1      1    0.0%
  __returndatasize_too_small__       1      1    0.0%
             __validate_uint__       1      1    0.0%
                       _locked       1      1    0.0%
              _total_vested_at       6      6    0.0%
                    _unclaimed       1      1    0.0%
                       claim()       1      1    0.0%
                claim(address)       1      1    0.0%
        claim(address,uint256)       8      8    0.0%
                  cliff_length       0      0    0.0%
         collect_dust(address)       1      1    0.0%
 collect_dust(address,address)       6      6    0.0%
                   disabled_at       0      0    0.0%
                        disown       5      5    0.0%
                      end_time       0      0    0.0%
                    initialize      17     17    0.0%
                   initialized       0      0    0.0%
                        locked       2      2    0.0%
                    open_claim       0      0    0.0%
                         owner       0      0    0.0%
                     recipient       0      0    0.0%
                      revoke()       1      1    0.0%
               revoke(uint256)       1      1    0.0%
       revoke(uint256,address)       9      9    0.0%
                set_open_claim       4      4    0.0%
                    start_time       0      0    0.0%
                         token       0      0    0.0%
                 total_claimed       0      0    0.0%
                  total_locked       0      0    0.0%
                     unclaimed       2      2    0.0%

                 line=0.0%, func=0.0%
```
