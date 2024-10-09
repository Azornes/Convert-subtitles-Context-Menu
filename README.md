<p align="center">
  <h1 align="center">Convert subtitles Context Menu</h1>
  <p align="center"><i>Convert subtitle files to various formats directly from your Windows context menu.</i></p>
</p>

<p align="center">
   <a href="https://github.com/Azornes/Convert-subtitles-Context-Menu/releases">
    <img alt="Downloads" src="https://img.shields.io/github/downloads/Azornes/Convert-subtitles-Context-Menu/latest/total?label=Downloads&style=flat-square">
   </a>
  <a href="https://www.php.net/">
    <img alt="PHP 8.3" src="https://img.shields.io/badge/PHP-8.3-777BB4?logo=PHP&logoColor=FFFFFF&style=flat-square">
   </a>
</p>

---

This application adds options to your Windows context menu for converting subtitle files to various formats. It leverages the [subtitles](https://github.com/mantas-done/subtitles) library for conversion operations.

---

# 🔥 Features

- Seamless integration with Windows context menu
- Support for multiple subtitle formats (SRT, VTT, and more)
- Easy-to-use interface: right-click and convert
- Preserves timing and formatting during conversion

---

# 📊 Supported Subtitle Formats
<details>
<summary>

> #### For a full list of supported formats, please refer to the [subtitles library documentation](https://github.com/mantas-done/subtitles).
</summary>

| Format                                                                                                | Extension | Internal format name |
|-------------------------------------------------------------------------------------------------------|-----------|----------------------|
| [SubRip](https://en.wikipedia.org/wiki/SubRip#SubRip_text_file_format)                                | .srt      | srt                  |
| [WebVTT](https://en.wikipedia.org/wiki/WebVTT)                                                        | .vtt      | vtt                  |
| [Scenarist](http://www.theneitherworld.com/mcpoodle/SCC_TOOLS/DOCS/SCC_FORMAT.HTML)                   | .scc      | scc                  |
| [Spruce Technologies SubTitles](https://pastebin.com/ykGM9qjZ)                                        | .stl      | stl                  |
| [Youtube Subtitles](https://webdev-il.blogspot.lt/2010/01/sbv-file-format-for-youtube-subtitles.html) | .sbv      | sbv                  |
| [SubViewer](https://wiki.videolan.org/SubViewer)                                                      | .sub      | sub_subviewer        |
| [MicroDVD](https://en.wikipedia.org/wiki/MicroDVD)                                                    | .sub      | sub_microdvd         |
| Advanced Sub Station                                                                                  | .ass      | ass                  |
| [Netflix Timed Text](https://en.wikipedia.org/wiki/Timed_Text_Markup_Language)                        | .dfxp     | dfxp                 |
| [TTML](https://en.wikipedia.org/wiki/Timed_Text_Markup_Language)                                      | .ttml     | ttml                 |
| [SAMI](https://en.wikipedia.org/wiki/SAMI)                                                            | .smi      | smi                  |
| QuickTime                                                                                             | .qt.txt   | txt_quicktime        |
| [LyRiCs](https://en.wikipedia.org/wiki/LRC_(file_format))                                             | .lrc      | lrc                  |
| Comma separated values                                                                                | .csv      | csv                  |
| Plaintext                                                                                             | .txt      | txt                  |

</details>

# 🚀 Installation

1. Download the latest release from the [releases page](https://github.com/Azornes/Convert-subtitles-Context-Menu/releases).
2. Run the ConvertSubInstall.bat

To uninstall, run the ConvertSubUninstall.reg file.

Note: The program might stop working if you move the folder after installation.

# 🛠 Usage

1. Right-click on a subtitle file in Windows Explorer.
2. Navigate to the "Convert Subtitles" submenu.
3. Choose the desired output format.
4. The converted file will be saved in the same directory as the original file.

# 🧩 Dependencies
1. [PHP 8.3](https://windows.php.net/download#php-8.3)
2. [Subtitles library](https://github.com/mantas-done/subtitles)

# 🧑‍💻 Building from Source

If you prefer to build the project from source, follow these steps:

1. Ensure you have [PHP 8.3](https://windows.php.net/download#php-8.3) installed on your system.
2. Install Composer (if not already installed) from [getcomposer.org](https://getcomposer.org/).
3. Clone the repository:
   ```
   git clone https://github.com/Azornes/Convert-subtitles-Context-Menu.git Convert-subtitles-Context-Menu
   cd Convert-subtitles-Context-Menu
   ```

4. Clone the repository [mantas-done/subtitles](https://github.com/mantas-done/subtitles):
   ```
   git clone https://github.com/mantas-done/subtitles.git Lib
   cd Lib
   ```
5. Install dependencies:
   ```
   composer install
   ```
6. Move files from the directory where you installed PHP to Convert-subtitles-Context-Menu\Lib\php, OR edit the convert_subs.bat file to point to your PHP installation.
If PHP is in your system's environment variables, you can find its location by running the following command in the command prompt:
   ```
   where php.exe
   ```


# 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

# 📄 License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Azornes/Convert-subtitles-Context-Menu/blob/main/LICENSE.md) file for details.

# 📞 Support

If you encounter any problems or have any questions, please [open an issue](https://github.com/Azornes/Convert-subtitles-Context-Menu/issues) on GitHub.

---

Remember to star ⭐ this repo if you find it useful!
