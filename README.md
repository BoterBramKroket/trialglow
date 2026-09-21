# Minecraft Mod Datapack Template

This template offers a foundation for creating mod variants of datapacks compatible with major mod loaders including
Forge, NeoForge, Fabric, and Quilt (Fabric API required for Fabric and Quilt). It simplifies the process for developers
to craft datapacks that seamlessly operate as mods in Minecraft.

## Features

- Universal compatibility: Works seamlessly with all Minecraft mod loaders, including Forge, NeoForge, Fabric, and
  Quilt, requiring no specific mod loader.
- Seamless integration with existing datapack structures: Allows for easy integration of additional features into
  existing datapack setups without the need for extensive restructuring.
- **Important note for Fabric and Quilt:** Fabric API is necessary for loading the "mod" as a datapack; without it, the
  mod datapack will not work.

## Prerequisites

- Java Development Kit (JDK) is recommended but not necessary
- Basic knowledge of Minecraft datapack creation and modding

## Usage

1. [Use this template](https://github.com/sa-shiro/Minecraft-Mod-Datapack-Template/generate) to instantly create a new
   GitHub repository based on this template. (optional)
2. Clone or download this or the newly created repository to your local machine.
3. Customize the datapack according to your requirements.
    - To make modifications to the datapack, edit the content of the `src/main/resources` directory.
    - To modify mod/datapack information (such as name, description, etc.), edit the `gradle.properties` file.
4. Build the project:
    - If using Java JDK:
        - Execute the command `gradlew build`.
        - Locate the output JAR file under `build/libs`.
        - Copy and rename the generated JAR to `.zip` for the datapack version.
    - If **NOT** using Java JDK:
        - Ensure to modify the following files: `pack.mcmeta`, `mods.toml`, `neoforge.mods.toml`, `fabric.mod.json`,
          and `quilt.mod.json`, as their information is retrieved using variables from the buildscript and
          the `gradle.properties` file.
        - Compress the contents of the `src/main/resources` folder into a ZIP archive.
        - Rename the compressed ZIP archive to `.jar` for the mod version.
5. Once built, upload both the built JAR file and the renamed ZIP copy to your mod hosting platform.

### Important Note for CurseForge Uploads

When uploading both the mod and datapack variants to CurseForge, ensure that at least one of the files includes an
additional file or modification to prevent rejection due to duplicate files. CurseForge's hashing check will identify
duplicates, resulting in rejection if the hashes match. Adding a dummy file, for instance, is one way to achieve this
differentiation.

## Contributing

Contributions are welcome! If you have suggestions, feature requests, or bug reports, please open an issue or submit
a pull request.

## License

This project is licensed under the [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](LICENSE).