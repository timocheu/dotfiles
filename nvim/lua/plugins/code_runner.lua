return {
    "CRAG666/code_runner.nvim",
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype", "CRProjects" },
    opts = {
        -- your config (mode, filetype, ...) goes here
        filetype = {
            php = "php",
            typescript = "bun run",
            odin = "odin run $fileName -file -vet -strict-style"
        }
    },
}
