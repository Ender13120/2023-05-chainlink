// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {IERC677} from "../../interfaces/IERC677.sol";
import {IERC677Receiver} from "../../interfaces/IERC677Receiver.sol";

import {Address} from "../../../vendor/openzeppelin-solidity/v4.8.0/utils/Address.sol";
import {ERC20} from "../../../vendor/openzeppelin-solidity/v4.8.0/token/ERC20/ERC20.sol";

contract ERC677 is IERC677, ERC20 {
  using Address for address;

  constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

  /// @inheritdoc IERC677
  function transferAndCall(address to, uint amount, bytes memory data) public returns (bool success) {
    super.transfer(to, amount);
    emit Transfer(msg.sender, to, amount, data);
    if (to.isContract()) {
      IERC677Receiver(to).onTokenTransfer(msg.sender, amount, data);
    }
    return true;
  }

  /// @inheritdoc IERC677
  function transferAndCall(address to, uint256 amount) external returns (bool) {
    return transferAndCall(to, amount, "");
  }
}
