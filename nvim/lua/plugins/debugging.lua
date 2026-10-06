return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        local python_venv_path = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        if vim.fn.filereadable(python_venv_path) == 1 then
            require("dap-python").setup(python_venv_path)
        else
            vim.notify("Debugpy not found via Mason. Please install it via :MasonInstall debugpy", vim.log.levels.WARN)
        end
    end,
}
