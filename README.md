# Diamond Rush-dev

A development fork of the decompiled Diamond Rush (Sony Ericsson S700, 240×320).

## Requirements

- A JDK with `javac` and `jar` on `PATH` (tested with OpenJDK 17).
- Java ME (`javax.microedition.*`) APIs configured on Java's `CLASSPATH`.
- Bash and standard Unix utilities.

### Install dependencies (Ubuntu / Debian)

Install the JDK and download tools:

```sh
sudo apt install openjdk-17-jdk curl unzip
```

Install [FreeJ2ME-Plus v1.52](https://github.com/TASEmulators/freej2me-plus/releases/tag/1.52) as a Java ME API library:

```sh
curl -fL -o /tmp/freej2me.zip https://github.com/TASEmulators/freej2me-plus/releases/download/1.52/freej2me-v1.52.zip
unzip -p /tmp/freej2me.zip freej2me.jar > /tmp/freej2me.jar
sudo install -Dm644 /tmp/freej2me.jar /usr/local/share/java/freej2me.jar
export CLASSPATH=/usr/local/share/java/freej2me.jar
```

 On other systems, install a JDK and a compatible Java ME API JAR, then set `CLASSPATH` to its location.

## Build

```sh
git clone https://github.com/duyanhHSGS/Diamond-Rush.git
cd Diamond-Rush
./build.sh
```

The script only compiles and packages files. It does **not** install tools, download dependencies, or assume anyone's home directory. Outputs:

- `build/Diamond-Rush-dev.jar`
- `build/Diamond-Rush-dev.jad`

**Compatibility:** Built with Java 7 class format for modern J2ME emulators. This is not a CLDC-preverified JAR for vintage physical phones.
