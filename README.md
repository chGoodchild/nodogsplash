# Rebuilding Nodogsplash using Quilt in OpenWrt

This guide provides detailed steps to rebuild the `nodogsplash` package in OpenWrt using `quilt` for patch management.

## Prerequisites

1. Ensure you have a working OpenWrt build environment. Follow the [OpenWrt build system setup guide](https://openwrt.org/docs/guide-developer/build-system/install-buildsystem) if you haven't done so already.
2. Install `quilt`:
    ```sh
    sudo apt-get install quilt
    ```

## Steps to Rebuild Nodogsplash

### Step 1: Navigate to the Nodogsplash Source Directory

1. Open a terminal.
2. Navigate to the `nodogsplash` source directory in your OpenWrt build environment:
    ```sh
    cd ~/Documents/openwrt/build_dir/target-*/nodogsplash-*/src/
    ```

### Step 2: Make Changes to the Source Code

1. Use `quilt` to manage patches. To begin editing a file, use:
    ```sh
    quilt edit <filename>
    ```
2. After making the desired changes, refresh the patch:
    ```sh
    quilt refresh
    ```

### Step 3: Navigate Back to the OpenWrt Root Directory

Return to the OpenWrt root directory to update and compile the package:
```sh
cd ~/Documents/openwrt
```

### Step 4: Update the Nodogsplash Package

Update the `nodogsplash` package to incorporate your changes:
```sh
make package/nodogsplash/update V=s
```

### Step 5: Compile the Nodogsplash Package

Compile the `nodogsplash` package with your changes:
```sh
make package/nodogsplash/compile V=s
```

### Step 6: Install the Compiled Package

1. Locate the compiled package, which should be in the following directory:
    ```sh
    ls ~/Documents/openwrt/bin/packages/mips_24kc/routing/
    ```
    Look for a file named similar to `nodogsplash_5.0.0-1_mips_24kc.ipk`.

2. Transfer the package to your OpenWrt router if it's not already there.

3. Install the package on your OpenWrt router using `opkg`:
    ```sh
    opkg install /path/to/nodogsplash_5.0.0-1_mips_24kc.ipk
    ```
    Replace `/path/to/nodogsplash_5.0.0-1_mips_24kc.ipk` with the actual path to the `.ipk` file.

## Troubleshooting

- If you encounter issues during compilation, check the logs for error messages and ensure all dependencies are met.
- For more detailed information on managing patches with `quilt`, refer to the [quilt documentation](https://manpages.debian.org/testing/quilt/quilt.1.en.html).

## Additional Resources

- [OpenWrt Developer Guide](https://openwrt.org/docs/guide-developer/start)
- [Nodogsplash Documentation](https://github.com/nodogsplash/nodogsplash)

By following these steps, you can successfully rebuild the `nodogsplash` package in OpenWrt using `quilt` to manage your patches.

# Usage

scp /home/pachai/Documents/openwrt/bin/packages/mips_24kc/routing/nodogsplash_5.0.0-1_mips_24kc.ipk root@192.168.8.1:/tmp/

opkg remove nodogsplash
opkg install nodogsplash_5.0.0-1_mips_24kc.ipk
service nodogsplash start
service nodogsplash status
logread | grep nodogsplash

GLTollGate/v4.3.11$ scp -r www/cgi-bin/* root@192.168.8.1:/www/cgi-bin/.

