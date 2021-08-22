require'compe'.setup {
	enabled = true;
	autocomplete = true;

	source = {
		path = true;
		nvim_lsp = true;
		orgmode = true;
		buffer = true;
	};
}
