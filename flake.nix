{
	description = "flake inputs for my NixOS system";

	inputs = {
		determinate = {url = "https://flakehub.com/f/DeterminateSystems/determinate/3";};
		nixpkgs = { type="github"; owner="NixOS"; repo="nixpkgs"; ref="nixos-unstable"; };
		omniflake = {
			type="github"; owner="fzakaria"; repo="omniflake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		# mine
		fish-subAbbr = { # directly added to follow `develop` channel
			type="github"; owner="drazape"; repo="fish-subAbbr"; ref="develop";
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
