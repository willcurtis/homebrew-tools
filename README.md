# homebrew-tools

🍺 A Homebrew tap for CLI tools by [Will Curtis](https://github.com/willcurtis).

This repository hosts Homebrew formulas for utilities developed by Will Curtis.

---

## Included Tools

### `mac-lookup-tool`

Command-line utility to look up MAC address vendors via the macvendors.com API.

Supports:
- MAC formats: `AA:BB:CC`, `AA-BB-CC`, `aabb.cc`, `aabbccddeeff`
- Full MAC or just OUI (first 6 hex digits)
- JSON or plain-text output
- Local caching to avoid repeat lookups

### Install via Homebrew:

```bash
brew tap willcurtis/tools
brew install mac-lookup-tool
```

### `syslog-sender`

A simple Python-based utility to send random syslog messages to a specified IP and port.

**Usage:**

```bash
syslog-sender <destination_ip> --port 514 --count 10 --delay 0.5 --interval 0
```

**Options:**

- `destination_ip` (required): IP address to send the syslog messages to
- `--port`: Syslog port (default: 514)
- `--count`: Number of messages to send (default: 10)
- `--delay`: Delay between messages in seconds (default: 0)
- `--interval`: Repeat send every X seconds (default: 0 = no repeat)

**Example:**

```bash
syslog-sender 192.168.1.100 --count 50 --delay 0.2 --interval 60
```

This will send 50 syslog messages every 60 seconds to the given IP.

### Install via Homebrew:

```bash
brew tap willcurtis/tools
brew install syslog-sender
```

### Whatmask (Python Version)

A Python recreation of the classic `whatmask` tool.  
It helps you easily work with IP subnet masks and network ranges.

Original By: Joe Laffey <joe@laffeycomputer.com>
Updates: http://www.laffeycomputer.com/software.html
<c> 2000-2003 Joe Laffey.

## Features

- Accepts subnet mask in any format: CIDR (`/24`), dotted decimal (`255.255.255.0`), hex (`0xffffff00`), or wildcard (`0.0.0.255`)
- Accepts IP/mask combinations: (`192.168.1.10/24`, `10.1.1.5/0xffffff00`, etc.)
- Outputs:
  - CIDR notation
  - Netmask (dotted)
  - Hexadecimal netmask
  - Wildcard bits
  - Number of usable IP addresses
  - Network address
  - Broadcast address
  - First and last usable IPs
- Colored warning if using unusual subnets like `/31` or `/32`
- Optional **brief output** mode for one-line summaries

---

## Installation

Clone the repository and make the script executable:

```bash
git clone https://github.com/willcurtis/whatmask-python.git
cd whatmask-python
chmod +x getmask.py
```

## Usage

Standard mode:
```bash
./getmask.py 255.255.255.0
./getmask.py /26
./getmask.py 192.168.1.10/24
```

Brief mode (one-line output):
```bash
./getmask.py --brief 192.168.1.10/24

CIDR: /24 | Network: 192.168.1.0 | Broadcast: 192.168.1.255 | Range: 192.168.1.1-192.168.1.254
```

## Warnings

	•	⚠️ If you input a /31 or /32 network, a colored warning will be displayed:
	•	/31 indicates a two-host point-to-point subnet (only 2 addresses)
	•	/32 indicates a single IP address (typically used for hosts)

Example:

```bash
⚠️  Warning: /31 subnet — only 2 IPs (point-to-point link)
```

## Requirements

	•	Python 3.6+
	•	No external packages required (only built-in modules)


# Modbus Relay Controller CLI

Control an 8-relay Modbus TCP device easily using a command-line tool or an interactive menu.

Supports:
- Turning individual relays ON/OFF
- Turning all relays ON/OFF
- Reading relay states
- Saving relay states as profiles
- Loading relay states from profiles
- Listing available profiles (no device connection needed)

---

## 📦 Features

- **Command-line mode** for scripting and automation
- **Interactive menu** for manual control
- **Relay profiles** to save and load common relay configurations
- **Logging** of all actions to `relay_control.log`
- **Automatic reconnection** on startup
- **Timeouts and error handling**

---

## 🚀 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/modbus-relay-cli.git
   cd modbus-relay-cli
   ```

2. Install dependencies:
   ```bash
   pip install pymodbus
   ```

---

## ⚙️ Usage

### Command-Line Mode

Run one-off commands:

- **Turn a specific relay ON or OFF**
  ```bash
  python modbus_relay_cli.py --ip 10.194.10.14 --relay 3 --state on
  ```

- **Turn ALL relays ON or OFF**
  ```bash
  python modbus_relay_cli.py --ip 10.194.10.14 --all --state off
  ```

- **Read all relay statuses**
  ```bash
  python modbus_relay_cli.py --ip 10.194.10.14 --status
  ```

- **Save current relay states as a profile**
  ```bash
  python modbus_relay_cli.py --ip 10.194.10.14 --save-profile myprofile
  ```

- **Load a saved profile**
  ```bash
  python modbus_relay_cli.py --ip 10.194.10.14 --load-profile myprofile
  ```

- **List available profiles (no device required)**
  ```bash
  python modbus_relay_cli.py --list-profiles
  ```


### Interactive Menu

Just run without extra options:

```bash
python modbus_relay_cli.py --ip 10.194.10.14
```

You’ll see a simple menu:
```
🔹 Modbus Relay Control Menu 🔹
1️⃣  Toggle Relay ON/OFF
2️⃣  Enable/Disable ALL Relays
3️⃣  Show Relay Status
4️⃣  Save Profile
5️⃣  Load Profile
6️⃣  List Profiles
7️⃣  Exit
```

---

## 🛠 Configuration

- **Default Modbus TCP port**: `502`
- **Relay address mapping**: Relay 1 → Coil 0, Relay 2 → Coil 1, etc.
- **Profiles**: Stored in `relay_profiles.json`
- **Logs**: Stored in `relay_control.log`

---

## 📋 Requirements

- Python 3.7+
- `pymodbus`
- A reachable Modbus TCP relay device (8 coils expected)

---

### Install via Homebrew:

```bash
brew tap willcurtis/tools
brew install modbus-relay-control
```

## License

All tools are provided under the MIT license.
