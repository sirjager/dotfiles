# Import your modular configs
import importlib.util
import os

# pyright: ignore
def load_module(name):
    path = os.path.expanduser(f"~/.config/qutebrowser/{name}")
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    # Inject qutebrowser's config and c into the module namespace
    module.config = config
    module.c = c
    spec.loader.exec_module(module)
    return module


# Load your modules
# Can be used to keep modular config
load_module("defaults.py")
load_module("myoptions.py")
load_module("mykeybindings.py")


