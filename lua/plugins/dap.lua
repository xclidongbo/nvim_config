return {
  -- { import = "lazyvim.plugins.extras.lang.java" },
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      dap.configurations.java = {
        {
          -- You need to extend the classPath to list your dependencies.
          -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
          -- classPaths = {},

          -- If using multi-module projects, remove otherwise.
          -- projectName = "yourProjectName",

          javaExec = "/Library/Java/JavaVirtualMachines/jdk1.8.0_361.jdk/Contents/Home/bin/java",
          -- mainClass = "PrimitiveTypeTest",

          -- If using the JDK9+ module system, this needs to be extended
          -- `nvim-jdtls` would automatically populate this property
          -- modulePaths = {},
          name = "Launch YourClassName",
          request = "launch",
          type = "java",
        },
      }
    end,
  },
}
