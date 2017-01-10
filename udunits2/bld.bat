mkdir build
cd build

set LIB=%LIBRARY_LIB%;.\lib;%LIB%
set LIBPATH=%LIBRARY_LIB%;.\lib;%LIBPATH%
set INCLUDE=%LIBRARY_INC%;%INCLUDE%

:: Install the udunits2 xml files.
mkdir %LIBRARY_PREFIX%\share
mkdir %LIBRARY_PREFIX%\share\udunits
copy ..\lib\*.xml %LIBRARY_PREFIX%\share\udunits\

copy %RECIPE_DIR%\unistd.h %SRC_DIR% || exit 1

cmake -G "NMake Makefiles" -DEXPAT_INCLUDE_DIR:PATH=%LIBRARY_INC%\expat.h -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX%  -DCMAKE_BUILD_TYPE=Release %SRC_DIR%

nmake libudunits2 || exit 1
nmake udunits2 || exit 1

copy prog\udunits2.exe %SCRIPTS%\ || exit 1
copy lib\udunits2.dll %SCRIPTS%\ || exit 1

