# This SH script is used to update the en locale file for Sphinx documents.
cd source
sphinx-build -b gettext . _locale
sphinx-intl update -p _locale -l en
cd ..
echo "\nEnglish locale updated."
