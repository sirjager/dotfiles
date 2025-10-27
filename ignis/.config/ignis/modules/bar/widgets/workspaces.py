from ignis import widgets, utils
from ignis.services.niri import NiriService, NiriWorkspace, NiriWindow
from ignis.services.hyprland import HyprlandService, HyprlandWindow
from ignis.services.applications import ApplicationsService
from user_settings import user_settings
from modules.shared_modules import AppIcon

SERVICE = None
if NiriService.get_default().is_available:
    SERVICE = NiriService.get_default()
elif HyprlandService.get_default().is_available:
    SERVICE = HyprlandService.get_default()

APPLICATIONS = ApplicationsService.get_default()


class DummyWorkspace:
    def __init__(self, id: int):
        self.id = id
        self.idx = id

    def switch_to(self):
        if SERVICE:
            SERVICE.switch_to_workspace(self.id)


def get_active_workspace():
    if not SERVICE:
        return None
    if isinstance(SERVICE, NiriService):
        for workspace in SERVICE.workspaces:
            if workspace.is_active:
                return workspace
        return None
    elif isinstance(SERVICE, HyprlandService):
        return SERVICE.active_workspace
    return None


class WorkspaceButton(widgets.Button):
    def __init__(self, workspace) -> None:
        bar = (
            user_settings.interface.bar
            if user_settings.interface.modules.bar_id.workspaces == 0
            else user_settings.interface.bar2
        )
        style = user_settings.interface.modules.options.workspaces_style

        if isinstance(workspace, NiriWorkspace):
            label_text = str(workspace.idx)
        else:
            label_text = str(workspace.id)

        self.workspace = workspace
        self._label = widgets.Label(label=label_text, halign="center", valign="center")

        children = [self._label]
        self._icons_box = None

        if style == "windows":
            self._icons_box = widgets.Box(spacing=5, css_classes=["workspace-icons"])
            children.append(self._icons_box)

        self._main_content_box = widgets.Box(
            halign="center", valign="center", spacing=4, child=children
        )

        super().__init__(
            css_classes=["workspace"],
            on_click=lambda x: self.workspace.switch_to(),
            child=self._main_content_box,
        )

        def update_css_classes(*args):
            active_workspace = get_active_workspace()
            if active_workspace and self.workspace.id == active_workspace.id:
                self.add_css_class("active")
            else:
                self.remove_css_class("active")
            if not self._get_windows_for_workspace():
                self.add_css_class("empty")
            else:
                self.remove_css_class("empty")

        if SERVICE:
            SERVICE.connect("notify::workspaces", update_css_classes)
            if isinstance(SERVICE, HyprlandService):
                SERVICE.connect("notify::active-workspace", update_css_classes)
            update_css_classes()

        self.update_layout()
        if style == "windows":
            self._update_icons()
            if SERVICE:
                SERVICE.connect("notify::windows", lambda *args: self._update_icons())

    def _get_windows_for_workspace(self):
        if isinstance(SERVICE, NiriService):
            return [w for w in SERVICE.windows if w.workspace_id == self.workspace.id]
        elif isinstance(SERVICE, HyprlandService):
            return SERVICE.get_windows_on_workspace(self.workspace.id)
        return []

    def _is_same_app(self, id1: str, id2: str):
        if not id1 or not id2:
            return False
        id1_lower = id1.lower()
        id2_lower = id2.lower()
        return id1_lower in id2_lower or id2_lower in id1_lower

    def _update_icons(self):
        if not self._icons_box:
            return

        last_child = self._icons_box.get_last_child()
        while last_child:
            self._icons_box.remove(last_child)
            last_child = self._icons_box.get_last_child()

        windows = self._get_windows_for_workspace()

        self._icons_box.set_visible(bool(windows))

        for window in windows:
            app_id = None
            if isinstance(window, NiriWindow):
                app_id = window.app_id
            elif isinstance(window, HyprlandWindow):
                app_id = window.class_name

            icon_widget = AppIcon(app_id=app_id, name=window.title, pixel_size=16)
            self._icons_box.append(icon_widget)

        self._main_content_box.queue_resize()

    def update_layout(self):
        bar = (
            user_settings.interface.bar
            if user_settings.interface.modules.bar_id.workspaces == 0
            else user_settings.interface.bar2
        )
        vertical = bar.vertical
        style = user_settings.interface.modules.options.workspaces_style

        if self._icons_box:
            self._icons_box.set_vertical(vertical)

        if vertical:
            self._main_content_box.set_vertical(True)
            self.set_halign("center")
            if style == "dots":
                self.set_valign("center")
            else:
                self.set_valign("fill")
        else:
            self._main_content_box.set_vertical(False)
            self.set_valign("center")
            if style == "dots":
                self.set_halign("center")
            else:
                self.set_halign("fill")

        if style == "dots":
            self._main_content_box.set_spacing(0)


class Workspaces(widgets.EventBox):
    def __init__(self):
        self._workspace_box = widgets.Box(
            css_classes=["workspaces"],
            halign="center",
            hexpand=True,
            valign="center",
            vexpand=True,
        )
        user_settings.interface.modules.options.connect_option(
            "workspaces_style", lambda: self.update_workspaces()
        )
        user_settings.interface.modules.options.connect_option(
            "fixed_workspaces_enabled", lambda: self.update_workspaces()
        )
        user_settings.interface.modules.options.connect_option(
            "fixed_workspaces_amount", lambda: self.update_workspaces()
        )

        super().__init__(
            child=[self._workspace_box],
            on_scroll_up=lambda self: self.workspaces_scroll(+1),
            on_scroll_down=lambda self: self.workspaces_scroll(-1),
        )

        self._last_style = None
        self._last_workspace_ids = []
        self._last_fixed_enabled = False

        if SERVICE:
            SERVICE.connect("notify::workspaces", self.update_workspaces)
            SERVICE.connect("notify::active-workspace", self.update_workspaces)
            self.update_workspaces()

            self.update_layout()

    def update_workspaces(self, *args):
        bar = (
            user_settings.interface.bar
            if user_settings.interface.modules.bar_id.workspaces == 0
            else user_settings.interface.bar2
        )
        current_style = user_settings.interface.modules.options.workspaces_style

        current_workspace_ids = []
        if SERVICE:
            fixed_enabled = (
                user_settings.interface.modules.options.fixed_workspaces_enabled
            )
            if isinstance(SERVICE, NiriService):
                current_workspace_ids = [ws.idx for ws in SERVICE.workspaces]
            elif isinstance(SERVICE, HyprlandService):
                current_workspace_ids = [ws.id for ws in SERVICE.workspaces]

            if fixed_enabled != self._last_fixed_enabled:
                self._last_style = None
            self._last_workspace_ids = []
        if (
            current_style != self._last_style
            or current_workspace_ids != self._last_workspace_ids
        ):
            self._last_style = current_style
            self._last_workspace_ids = current_workspace_ids

            fixed_enabled = (
                user_settings.interface.modules.options.fixed_workspaces_enabled
            )
            fixed_amount = int(
                user_settings.interface.modules.options.fixed_workspaces_amount
            )

            self._workspace_box.remove_css_class("dots")
            self._workspace_box.remove_css_class("windows")
            self._workspace_box.remove_css_class("numbers")

            if current_style == "dots":
                self._workspace_box.add_css_class("dots")
            elif current_style == "windows":
                self._workspace_box.add_css_class("windows")
            elif current_style == "numbers":
                self._workspace_box.add_css_class("numbers")

            if SERVICE:
                last_child = self._workspace_box.get_last_child()
                while last_child:
                    self._workspace_box.remove(last_child)
                    last_child = self._workspace_box.get_last_child()

                workspaces_to_display = []
                if SERVICE:
                    all_workspaces_map = {}
                    if isinstance(SERVICE, NiriService):
                        for ws in SERVICE.workspaces:
                            all_workspaces_map[ws.idx] = ws
                    elif isinstance(SERVICE, HyprlandService):
                        for ws in SERVICE.workspaces:
                            all_workspaces_map[ws.id] = ws

                    if fixed_enabled and fixed_amount > 0:
                        active_workspace = get_active_workspace()
                        if active_workspace:
                            if isinstance(SERVICE, NiriService):
                                active_workspace_id = active_workspace.idx
                            elif isinstance(SERVICE, HyprlandService):
                                active_workspace_id = active_workspace.id
                            else:
                                active_workspace_id = None

                        if active_workspace_id is not None:
                            if fixed_amount == 1:
                                page_base_id = active_workspace_id
                            else:
                                page_base_id = (
                                    (active_workspace_id - 1) // fixed_amount
                                ) * fixed_amount + 1

                            start_id = page_base_id
                            end_id = page_base_id + fixed_amount - 1
                            for i in range(start_id, end_id + 1):
                                if i in all_workspaces_map:
                                    workspaces_to_display.append(all_workspaces_map[i])
                                else:
                                    workspaces_to_display.append(DummyWorkspace(i))
                        else:
                            for i in range(1, fixed_amount + 1):
                                if i in all_workspaces_map:
                                    workspaces_to_display.append(all_workspaces_map[i])
                                else:
                                    workspaces_to_display.append(DummyWorkspace(i))
                    else:
                        workspaces_to_display = sorted(
                            list(all_workspaces_map.values()),
                            key=lambda ws: ws.idx
                            if isinstance(SERVICE, NiriService)
                            else ws.id,
                        )

                for workspace in workspaces_to_display:
                    self._workspace_box.append(WorkspaceButton(workspace))
            else:
                pass
        elif SERVICE:
            fixed_enabled = (
                user_settings.interface.modules.options.fixed_workspaces_enabled
            )
            if fixed_enabled:
                self._last_style = None
                self.update_workspaces()
            else:
                for child in self._workspace_box:
                    if isinstance(child, WorkspaceButton):
                        if current_style == "windows":
                            child._update_icons()

    def update_layout(self):
        bar = (
            user_settings.interface.bar
            if user_settings.interface.modules.bar_id.workspaces == 0
            else user_settings.interface.bar2
        )
        vertical = bar.vertical
        style = user_settings.interface.modules.options.workspaces_style

        if style == "windows":
            spacing = 2
        else:
            spacing = 5

        self._workspace_box.set_vertical(vertical)
        self._workspace_box.set_spacing(spacing)

        for child in self._workspace_box:
            if isinstance(child, WorkspaceButton):
                child.update_layout()

    def workspaces_scroll(self, difference: int):
        if not SERVICE:
            return

        fixed_enabled = user_settings.interface.modules.options.fixed_workspaces_enabled
        fixed_amount = user_settings.interface.modules.options.fixed_workspaces_amount

        active_workspace_id = None

        if isinstance(SERVICE, NiriService):
            active_workspace_niri = next(
                (ws for ws in SERVICE.workspaces if ws.is_active), None
            )
            if active_workspace_niri:
                active_workspace_id = active_workspace_niri.idx
            else:
                print("No active Niri workspace found.")
                return

        elif isinstance(SERVICE, HyprlandService):
            active_workspace_hyprland = SERVICE.active_workspace
            if active_workspace_hyprland:
                active_workspace_id = active_workspace_hyprland.id
            else:
                print("No active Hyprland workspace found.")
                return

        if active_workspace_id is not None:
            new_workspace_id = active_workspace_id + difference
            SERVICE.switch_to_workspace(new_workspace_id)

    def widget(self):
        return self
