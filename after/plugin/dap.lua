local status, dap = pcall(require, 'dap')
if (not status) then return end

--  https://github.com/xdebug/vscode-php-debug/releases
-- Extract the vsix content, rename .vsix to *.zip
-- (Optional) run `npm install` inside extensions directory
-- then look for phpDebug.js
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = {"/Users/lucio/.local/bin/php-debug/extension/out/phpDebug.js"},
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for XDebug',
    port = '9003',
    log = true,
    localSourceRoot = '/Users/lucio/projects/'
  },
}

-- @INFO: Repeated configuration for .blade
dap.adapters.blade = {
    type = 'executable',
    command = 'node',
    args = {"/Users/lucio/.local/bin/php-debug/extension/out/phpDebug.js"},
}

dap.configurations.blade = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for XDebug',
    port = '9003',
    log = true,
    localSourceRoot = '/Users/lucio/projects/'
  },
}
