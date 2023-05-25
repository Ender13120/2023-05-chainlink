// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.19;

import {OCR2Base} from "../../ocr/OCR2Base.sol";

contract OCR2Helper is OCR2Base {
  function configDigestFromConfigData(
    uint256 chainSelector,
    address contractAddress,
    uint64 configCount,
    address[] memory signers,
    address[] memory transmitters,
    uint8 f,
    bytes memory onchainConfig,
    uint64 offchainConfigVersion,
    bytes memory offchainConfig
  ) public pure returns (bytes32) {
    return
      _configDigestFromConfigData(
        chainSelector,
        contractAddress,
        configCount,
        signers,
        transmitters,
        f,
        onchainConfig,
        offchainConfigVersion,
        offchainConfig
      );
  }

  function _report(bytes memory report) internal override {}

  function typeAndVersion() public pure override returns (string memory) {
    return "OCR2BaseHelper 1.0.0";
  }
}
