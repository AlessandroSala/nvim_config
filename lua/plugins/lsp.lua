return 
{
    { "neovim/nvim-lspconfig",
config = function()
    vim.lsp.enable("clangd")


end
},
    {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "clangd"
        },
    },
},
{ "lukas-reineke/lsp-format.nvim",
config = function()
  vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    require("lsp-format").on_attach(client, args.buf)
  end,
})
end

}
}
