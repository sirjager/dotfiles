local M = {
  "kirasok/cmp-hledger",
  ft = { "ledger" },
}

-- Plugin will choose to work with ledger if it won't find hledger binary in PATH.
-- install hledger
-- yay -S hledger

return M
