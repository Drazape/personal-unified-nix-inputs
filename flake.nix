{
	description = "flake inputs for my NixOS system";

	inputs = {
		nixpkgs = { type="github"; owner="NixOS"; repo="nixpkgs"; ref="nixos-unstable"; };
		omniflake = {
			type="github"; owner="fzakaria"; repo="omniflake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		# mine
		fish-subAbbr = {
			type="github"; owner="drazape"; repo="fish-subAbbr"; ref="alpha";
			inputs = {
				nixpkgs.follows = "nixpkgs";
				flake-parts.follows = "omniflake/flake-parts";
				fish-format.follows = "dryboil/fish-format";
			};
		};
		dryboil = {
			type="github"; owner="drazape"; repo="nix-dryboil"; ref="alpha";
			inputs = {
				nixpkgs.follows = "nixpkgs";
				flake-parts.follows = "omniflake/flake-parts";
				fish-subAbbr.follows = "fish-subAbbr";
			};
		};
	};

	outputs = inputs@{...}: inputs;
}
