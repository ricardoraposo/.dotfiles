local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local config_dir = jdtls_dir .. '/config_mac_arm'
local plugins_dir = jdtls_dir .. '/plugins'
local path_to_jar = plugins_dir .. 'org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar'

local root_markers = {'.git', 'pom.xml', 'mvnw', 'gradlew', 'build.gradle'}

