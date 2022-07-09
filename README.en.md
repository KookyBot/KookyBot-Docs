[中文](README.md) | **English**

<h1 align="center">KookyBot-Docs</h1>

<p align="center"> 
  <b>Documentations of KookyBot SDK</b>
</p>

<p align="center">
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/License-CC--BY--NC--SA--4.0-important?style=for-the-badge" />
  </a>
</p>

## Guide to contribute to the documentation

**Your commit messages should follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) guidelines**.

### Install the requirements

``` bash
pip3 install -r requirements.txt
```

### Build the documentation (convert Sphinx rst/md to html)

(This step is only for preview the edited files)

``` bash
make clean
make html
```

The documentation will be generated in `docs/html` directory in `en_US (English (US)).

If you need to change the language of the generated documentation, you can modify the `en_US` of `language = os.environ.get('READTHEDOCS_LANGUAGE', 'en_US')` of line 58 of `source/conf.py` file to your designated language.

### Update the translation files

(This step uses Simplified Chinese as an example, if you need to use other languages, replace `en_US` with your designated language)

``` bash
cd source
sphinx-build -b gettext . _locale
sphinx-intl update -p _locale -l en_US
```

This step will generate some `.po` files in `source/_locale/en_US` directory, which will be used to store the translation content:

- Empty translations will be generated for new content.
- `#, fuzzy` comments will be added to the translation for changed texts. Update the translation and remove the `#, fuzzy` comment.
- Translations for removed texts will be moved to the bottom of the `.po` file and be commented out, you should remove them.

## 📜 License

> **Contents of KookyBot-Docs are licensed under [CC-BY-NC-SA-4.0 License](LICENSE).**

``` text
KookyBot-Docs (c) by CubikTech, Cubik65536, and contributors.

KookyBot-Docs is licensed under a
Creative Commons Attribution-NonCommercial 4.0 International License.

You should have received a copy of the license along with this
work. If not, see <http://creativecommons.org/licenses/by-nc/4.0/>.
```

> **Codes of KookyBot-Docs uses [AGPL-3.0-or-later License](LICENSE.CODE) as software license.**

``` text
KookyBot-Docs - Documentations of KookyBot SDK
Copyright (C) 2022 CubikTech, Cubik65536, and contributors.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
