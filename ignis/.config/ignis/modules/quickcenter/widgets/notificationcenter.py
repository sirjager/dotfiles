from ignis import widgets, utils
from ignis.services.notifications import Notification, NotificationService
from ignis.window_manager import WindowManager
from gi.repository import GLib, Gtk
from ...notifications import ExoNotification

notifications = NotificationService.get_default()
window_manager = WindowManager.get_default()

class Popup(widgets.Revealer):
    def __init__(self, notification: Notification, **kwargs):
        widget = ExoNotification(notification)
        super().__init__(child=widget, transition_type="slide_down", **kwargs)

        notification.connect("closed", lambda x: self.destroy())

    def destroy(self):
        self.reveal_child = False
        utils.Timeout(self.transition_duration, self.unparent)


class Notifications(widgets.Box):
    def __init__(self):
        loading_notifications_label = widgets.Label(
            label="Loading notifications...",
            valign="center",
            vexpand=True,
            css_classes=["notification-center-info-label"],
        )

        super().__init__(
            vertical=True,
            child=[loading_notifications_label],
            vexpand=True,
            css_classes=["notification-center-content"],
            spacing=2,
            setup=lambda self: notifications.connect(
                "notified",
                lambda x, notification: self.__on_notified(notification),
            ),
        )

        utils.ThreadTask(
            self.__load_notifications,
            lambda result: self.set_child(result),
        ).run()

    def __on_notified(self, notification: Notification) -> None:
        notify = Popup(notification)
        self.prepend(notify)
        notify.reveal_child = True

    def __load_notifications(self) -> list[widgets.Label | Popup]:
        contents: list[widgets.Label | Popup] = []
        for i in reversed(notifications.notifications):
            GLib.idle_add(lambda i=i: contents.append(Popup(i, reveal_child=True)))

        contents.append(
            widgets.Label(
                label="notifications_off",
                valign="end",
                vexpand=True,
                css_classes=["notification-center-info-icon"],
                visible=notifications.bind(
                    "notifications", lambda value: len(value) == 0
                ),
            )
        )
        contents.append(
            widgets.Label(
                label="No notifications",
                valign="start",
                vexpand=True,
                css_classes=["notification-center-info-label"],
                visible=notifications.bind(
                    "notifications", lambda value: len(value) == 0
                ),
            )
        )
        return contents


class NotificationCenter(widgets.Box):
    __gtype_name__ = "NotificationCenter"

    def __init__(self):
        scroll = widgets.Scroll(child=Notifications(), vexpand=True)
        scroll.set_overflow(Gtk.Overflow.HIDDEN)

        super().__init__(
            vertical=True,
            vexpand=True,
            css_classes=["notification-center"],
            spacing=10,
            child=[
                scroll,
            ],
        )
