# SDDM Astronaut Theme

A simple and clean SDDM theme.

## Installation

1.  **Install dependencies:**

    You need to install the following packages:
    *   `sddm`
    *   `qt6-svg`
    *   `qt6-virtualkeyboard`
    *   `qt6-multimedia`

    Use your package manager to install them. For example, on Arch Linux:

    ```bash
    sudo pacman -S sddm qt6-svg qt6-virtualkeyboard qt6-multimedia
    ```

2.  **Copy the theme:**

    Copy the `sddm-astronaut-theme` folder to the SDDM themes directory:

    ```bash
    sudo cp -r sddm-astronaut-theme /usr/share/sddm/themes/
    ```

3.  **Set the theme:**

    Now you need to edit the SDDM configuration file. It is usually located at `/etc/sddm.conf`.

    Add or edit the following lines:

    ```ini
    [Theme]
    Current=sddm-astronaut-theme
    ```

    The theme is pre-configured to use the `everforest` colorscheme.

## Preview

You can preview the theme with the following command:

```bash
sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/sddm-astronaut-theme
```
