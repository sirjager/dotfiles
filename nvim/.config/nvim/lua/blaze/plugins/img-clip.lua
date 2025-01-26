-- https://github.com/HakonHarnes/img-clip.nvim
local M = {
  "HakonHarnes/img-clip.nvim",
  event = "BufReadPost",
}

-- suggested keymap
-- { "<leader>v", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },

M.opts = {
  -- add options here
  -- or leave it empty to use the default settings
  default = {
    use_absolute_path = false, ---@type boolean
    -- make dir_path relative to current file rather than the cwd
    -- To see your current working directory run `:pwd`
    -- So if this is set to false, the image will be created in that cwd
    -- In my case, I want images to be where the file is, so I set it to true
    relative_to_current_file = true, ---@type boolean

    -- I want to save the images in a directory named after the current file,
    -- but I want the name of the dir to end with `-img`
    dir_path = function()
      return vim.fn.expand "%:t:r" .. "-img"
    end,

    -- If you want to get prompted for the filename when pasting an image
    -- This is the actual name that the physical file will have
    -- If you set it to true, enter the name without spaces or extension `test-image-1`
    -- Remember we specified the extension above
    --
    -- I don't want to give my images a name, but instead autofill it using
    -- the date and time as shown on `file_name` below
    prompt_for_file_name = false, ---@type boolean
    file_name = "%Y-%m-%d-at-%H-%M-%S", ---@type string

    -- -- Set the extension that the image file will have
    -- -- I'm also specifying the image options with the `process_cmd`
    -- -- Notice that I HAVE to convert the images to the desired format
    -- -- If you don't specify the output format, you won't see the size decrease

    extension = "avif", ---@type string
    process_cmd = "convert - -quality 75 avif:-", ---@type string

    -- extension = "webp", ---@type string
    -- process_cmd = "convert - -quality 75 webp:-", ---@type string

    -- extension = "png", ---@type string
    -- process_cmd = "convert - -quality 75 png:-", ---@type string

    -- extension = "jpg", ---@type string
    -- process_cmd = "convert - -quality 75 jpg:-", ---@type string

    -- -- Here are other conversion options to play around
    -- -- Notice that with this other option you resize all the images
    -- process_cmd = "convert - -quality 75 -resize 50% png:-", ---@type string

    -- -- Other parameters I found in stackoverflow
    -- -- https://stackoverflow.com/a/27269260
    -- --
    -- -- -depth value
    -- -- Color depth is the number of bits per channel for each pixel. For
    -- -- example, for a depth of 16 using RGB, each channel of Red, Green, and
    -- -- Blue can range from 0 to 2^16-1 (65535). Use this option to specify
    -- -- the depth of raw images formats whose depth is unknown such as GRAY,
    -- -- RGB, or CMYK, or to change the depth of any image after it has been read.
    -- --
    -- -- compression-filter (filter-type)
    -- -- compression level, which is 0 (worst but fastest compression) to 9 (best but slowest)
    -- process_cmd = "convert - -depth 24 -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 png:-",
    --
    -- -- These are for jpegs
    -- process_cmd = "convert - -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace RGB -quality 75 jpg:-",
    -- process_cmd = "convert - -strip -interlace Plane -gaussian-blur 0.05 -quality 75 jpg:-",
    --
  },

  -- filetype specific options
  filetypes = {
    markdown = {
      -- encode spaces and special characters in file path
      url_encode_path = true, ---@type boolean

      -- -- The template is what specifies how the alternative text and path
      -- -- of the image will appear in your file
      --
      -- -- $CURSOR will paste the image and place your cursor in that part so
      -- -- you can type the "alternative text", keep in mind that this will
      -- -- not affect the name that the image physically has
      -- template = "![$CURSOR]($FILE_PATH)", ---@type string
      --
      -- -- This will just statically type "Image" in the alternative text
      -- template = "![Image]($FILE_PATH)", ---@type string
      --
      -- -- This will dynamically configure the alternative text to show the
      -- -- same that you configured as the "file_name" above
      template = "![$FILE_NAME]($FILE_PATH)", ---@type string
    },
  },
}

return M
