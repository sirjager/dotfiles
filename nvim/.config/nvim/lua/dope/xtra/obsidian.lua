local M = {
  "epwalsh/obsidian.nvim",
  ft = { "markdown" },
  version = "*",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim" },
}

M.slugify = function(title)
  if title == nil then
    return ""
  end
  return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
end

M.get_filename_without_ext = function(path)
  -- Remove the directory part
  local filename = path:match "^.+/(.+)$"
  if filename == nil then
    filename = path -- If there's no directory in the path, use the entire path
  end
  -- Remove the extension part
  local name_without_ext = filename:match "(.+)%..+$"
  if name_without_ext == nil then
    name_without_ext = filename -- If there's no extension, use the filename as is
  end
  return name_without_ext
end

M.custom_link_func = function(prefix, opts)
  local util = require "obsidian.util"
  local anchor = ""
  local header = ""
  local path = M.get_filename_without_ext(opts.path)
  if opts.anchor then
    anchor = opts.anchor.anchor
    header = util.format_anchor_label(opts.anchor)
  elseif opts.block then
    anchor = "#" .. opts.block.id
    header = "#" .. opts.block.id
  end
  path = util.urlencode(path, { keep_path_sep = true })
  return string.format("[%s%s](%s%s%s)", opts.label, header, prefix, path, anchor)
end

M.new_note_name_func = function(title)
  local suffix = ""
  if title ~= nil then
    suffix = M.slugify(title)
  else
    for _ = 1, 4 do
      suffix = suffix .. string.char(math.random(65, 90))
    end
  end
  return suffix
end

M.note_path_func = function(spec)
  local path = spec.dir / tostring(spec.id)
  return path:with_suffix ".md"
end

M.note_frontmatter_func = function(note)
  if note.title then
    note:add_alias(note.title)
  end
  local out = {
    tags = note.tags,
    categories = "[]",
  }
  if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
    for k, v in pairs(note.metadata) do
      out[k] = v
    end
  end
  out.modified = os.date "%Y-%m-%dT%H:%M:%S.000Z"
  return out
end

function M.config()
  local util = require "obsidian.util"
  require("obsidian").setup {
    workspaces = {
      {
        name = "idealogs",
        path = "/mnt/storage/personal/idealogs",
        strict = true,
        overrides = {
          new_notes_location = "notes",
          notes_subdir = "notes",
          templates = {
            folder = "templates",
          },
        },
      },
      {
        name = "ankur-kumar",
        path = "/mnt/storage/workspace/projects/ankur-kumar.in",
        strict = true,
        overrides = {
          notes_subdir = "src/content/blog",
          new_notes_location = "src/content/blog",
          preferred_link_style = "markdown",
          markdown_link_func = function(opts)
            return M.custom_link_func("/blog/", opts)
          end,
        },
      },
      {
        name = "no-vault",
        path = function()
          return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
        end,
        overrides = {
          notes_subdir = vim.NIL,
          new_notes_location = "current_dir",
          templates = {
            folder = vim.NIL,
          },
          disable_frontmatter = true,
        },
      },
    },

    notes_subdir = nil,
    log_level = vim.log.levels.INFO,
    daily_notes = nil,
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    mappings = {},

    new_notes_location = "notes",
    note_id_func = function(title)
      return M.new_note_name_func(title)
    end,

    wiki_link_func = function(opts)
      return util.wiki_link_id_prefix(opts)
    end,

    markdown_link_func = function(opts)
      return util.markdown_link(opts)
    end,

    -- Either 'wiki' or 'markdown'.
    preferred_link_style = "wiki",

    disable_frontmatter = false,

    note_frontmatter_func = function(note)
      return M.note_frontmatter_func(note)
    end,

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {},
    },

    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      -- vim.fn.jobstart({ "open", url }) -- Mac OS
      vim.fn.jobstart { "xdg-open", url } -- linux
    end,

    use_advanced_uri = false,

    open_app_foreground = false,

    picker = {
      name = "telescope.nvim",
      mappings = {
        -- new = "<C-x>",
        -- insert_link = "<C-l>",
      },
    },

    -- Optional, sort search results by "path", "modified", "accessed", or "created".
    -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
    -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
    sort_by = "modified",
    sort_reversed = true,

    -- Optional, determines how certain commands open notes. The valid options are:
    -- 1. "current" (the default) - to always open in the current window
    -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
    -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
    open_notes_in = "vsplit",

    ui = {
      enable = true, -- set to false to disable all additional syntax features
      update_debounce = 200, -- update delay after a text change (in milliseconds)
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = " ", hl_group = "ObsidianTodo" },
        ["/"] = { char = " ", hl_group = "ObsidianTodo" },
        ["n"] = { char = "󰅙 ", hl_group = "ObsidianTodo" },
        ["x"] = { char = "󰄳 ", hl_group = "ObsidianDone" },
        [">"] = { char = " ", hl_group = "ObsidianRightArrow" },
        ["<"] = { char = " ", hl_group = "ObsidianRightArrow" },
        ["i"] = { char = " ", hl_group = "ObsidianBullet" },
        ["?"] = { char = " ", hl_group = "ObsidianBullet" },
        ["+"] = { char = " ", hl_group = "ObsidianBullet" },
        ["-"] = { char = " ", hl_group = "ObsidianBullet" },
        ["'"] = { char = "󰸥 ", hl_group = "ObsidianBullet" },
        ["!"] = { char = "󰀨 ", hl_group = "ErrorMsg" },
        ["*"] = { char = "󰓏 ", hl_group = "ObsidianBullet" },
        ["^"] = { char = "󱠇 ", hl_group = "ObsidianTodo" },
        -- numbers
        ["0"] = { char = "󰲟 ", hl_group = "ObsidianBullet" },
        ["1"] = { char = "󰲡 ", hl_group = "ObsidianBullet" },
        ["2"] = { char = "󰲣 ", hl_group = "ObsidianBullet" },
        ["3"] = { char = "󰲥 ", hl_group = "ObsidianBullet" },
        ["4"] = { char = "󰲧 ", hl_group = "ObsidianBullet" },
        ["5"] = { char = "󰲩 ", hl_group = "ObsidianBullet" },
        ["6"] = { char = "󰲫 ", hl_group = "ObsidianBullet" },
        ["7"] = { char = "󰲭 ", hl_group = "ObsidianBullet" },
        ["8"] = { char = "󰲯 ", hl_group = "ObsidianBullet" },
        ["9"] = { char = "󰲱 ", hl_group = "ObsidianBullet" },
      },
      -- Use bullet marks for non-checkbox lists.
      bullets = { char = "", hl_group = "ObsidianBullet" },
      external_link_icon = { char = " ", hl_group = "ObsidianExtLinkIcon" },
      -- Replace the above with this if you don't have a patched font:
      -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      -- If this is a relative path it will be interpreted as relative to the vault root.
      -- You can always override this per image by passing a full path to the command instead of just a filename.
      img_folder = "assets/images", -- This is the default
      -- A function that determines the text to insert in the note when pasting an image.
      -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
      -- This is the default implementation.
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    },
  }
end

return M
