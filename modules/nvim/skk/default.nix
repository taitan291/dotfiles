{pkgs,...}:let
	skkeleton = pkgs.vimUtils.buildVimPlugin {
		name = "vim-fern-git-status";
		src = builtins.fetchGit {
			url = "https://github.com/vim-skk/skkeleton";
			rev = "42b7b62062e5eb4ba157b9e8d12a104777bbd9b3";
		};
	};
in {
	programs.nixvim = {
		autoCmd = [
			{
				event = [ "VimEnter" "FocusGained" "InsertEnter" ];
				command = "call system('fcitx5-remote -c')";
			}
		];
		extraPlugins = with pkgs.vimPlugins; [
			skkeleton
			denops-vim
			ddc-vim
			ddc-ui-native
		];
		extraPackages = with pkgs; [
			deno
			skkDictionaries.l
		];
		globals.skk_dict_path = "${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L";
	};
	imports = [
		./keymaps.nix
		./skkeleton
		./fcitx5
	];
}
