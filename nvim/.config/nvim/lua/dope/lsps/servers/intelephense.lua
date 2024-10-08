return {
  settings = {
    intelephense = {
      stubs = {
        "bcmath",
        "bz2",
        "calendar",
        "Core",
        "curl",
        "zip",
        "zlib",
        "wordpress",
        "woocommerce",
        "acf-pro",
        "wordpress-globals",
        "wp-cli",
        "genesis",
        "polylang",
      },
      environment = {
        includePaths = "/home/your-user/.composer/vendor/php-stubs/", -- this line forces the composer path for the stubs in case inteliphense don't find it...
      },
      files = {
        maxSize = 5000000,
      },
    },
  },
}
