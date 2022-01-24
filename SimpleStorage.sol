// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {
	// value will be written to storage on blockchain
	// this will get initialized to 0
	uint256 favoriteNumber;

	struct People {
		uint256 favoriteNumber;
		string name;
	}

	People[] public people;
	mapping(string => uint256) public nameToFavouriteNumber;

	function store(uint256 _favoriteNumber) public {
		favoriteNumber = _favoriteNumber;
	}

	function retrieve() public view returns (uint256) {
		return favoriteNumber;
	}

	function addPerson(string memory _name, uint256 _favoriteNumber) public {
		people.push(People({ name: _name, favoriteNumber: _favoriteNumber }));
		nameToFavouriteNumber[_name] = _favoriteNumber;
	}
}
