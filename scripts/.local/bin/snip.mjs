#!/usr/bin/env zx

const opts = minimist(process.argv.slice(2), {
  boolean: ["clipboard"],
  string: ["name", "editor"],
  alias: {
    name: ["title", "file"],
    clipboard: ["copy", "yank", "clip"],
  },
});

const args = opts._;

function getSnipmanDirectory() {
  let dir = `${process.env.SNIPMAN_DIRECTORY}`;
  if (dir.startsWith("~")) {
    dir = path.join(os.homedir(), dir.slice(1));
  }
  return `${path.resolve(dir)}`;
}

const SNIPMAN_DIRECTORY = getSnipmanDirectory();

function getFilePath(snippetName) {
  if (!snippetName || snippetName.length < 1) {
    echo("snippet name is required");
    process.exit(1);
  }
  if (!SNIPMAN_DIRECTORY || SNIPMAN_DIRECTORY.length < 1) {
    echo("SNIPMAN_DIRECTORY is required");
    process.exit(1);
  }
  return `${SNIPMAN_DIRECTORY}/${snippetName}`;
}

async function snip_create(opts) {
  const filePath = getFilePath(opts.name);
  const fileName = path.basename(filePath);
  const relativePath = filePath.substring(SNIPMAN_DIRECTORY.length + 1);
  const directory = path.dirname(filePath);
  const tempFilePath = tmpfile(fileName);

  // exit if file already exists
  if (fs.existsSync(filePath)) {
    echo(`File Already Exists: ${filePath}`);
    process.exit(1);
  }
}

await snip_create(opts);
