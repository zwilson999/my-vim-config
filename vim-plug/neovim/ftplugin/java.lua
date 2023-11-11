-- local config = {
--     cmd = {'/usr/bin/jdtls/bin/jdtls'},
--     root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'pom.xml'}, { upward = true })[1]),
-- }
-- require('jdtls').start_or_attach(config)

-- Get local project directory
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = '~/Documents/sandbox/java_sandbox/' .. project_name
--
--
-- -- config for jdtls
-- local config = {
--   -- The command that starts the language server
--   -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--   cmd = {
--
--     -- must point this to your java binary
--     'java', -- or '/path/to/java17_or_newer/bin/java'
--             -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.protocol=true',
--     '-Dlog.level=ALL',
--     '-Xmx1g',
--     '--add-modules=ALL-SYSTEM',
--     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--
--     -- must point this to jdtls plugins folder
--     '-jar', '~/.local/share/nvim/mason/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--          -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
--          -- Must point to the                                                     Change this to
--          -- eclipse.jdt.ls installation                                           the actual version
-- ~/.local/share/nvim/lsp_servers
--
--     -- point this to your appropriate system folder in the jdtls folder
--     '-configuration', '~/Documents/sandbox/java_sandbox/jdtls/config_linux',
--                     -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
--                     -- Must point to the                      Change to one of `linux`, `win` or `mac`
--                     -- eclipse.jdt.ls installation            Depending on your system.
--
--
--     -- this must be uniquely set to a java workspace folder where you store java projects
--     -- See `data directory configuration` section in the README
--     '-data', workspace_dir,
--   },
--   settings = {
--           java = {
--                   signatureHelp = {enabled = true},
--                   import = {enabled = true},
--                   rename = {enabled = true}
--           }
--   },
--
--   -- 💀
--   -- This is the default if not provided, you can remove it. Or adjust as needed.
--   -- One dedicated LSP server & client will be started per unique root_dir
--   root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
--
--   -- Here you can configure eclipse.jdt.ls specific settings
--   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--   -- for a list of options
--   -- settings = {
--   --   java = {
--   --   }
--   -- },
--
--   -- Language server `initializationOptions`
--   -- You need to extend the `bundles` with paths to jar files
--   -- if you want to use additional eclipse.jdt.ls plugins.
--   --
--   -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
--   --
--   -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
--   -- init_options = {
--   --   bundles = {}
--   -- },
-- }

-- Where the Mason jdtls binary is
local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"

-- OPTIONAL: edit bindings
-- local lsp_attach = function(client, bufnr)
--   -- mappings here
-- end

local config = {
    cmd = { jdtls_bin },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    on_attach = lsp_attach,
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
