
local config = {
    on_attach = function()
        require('jdtls.setup').add_commands()
    end,
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        '-jar', '/usr/local/Cellar/jdtls/1.15.0/libexec/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

        '-configuration', '/usr/local/Cellar/jdtls/1.15.0/libexec/config_mac',
        -- See `data directory configuration` section in the README
        '-data', '/Users/viet/.jdtls'
    },
}

require('jdtls').start_or_attach(config)
